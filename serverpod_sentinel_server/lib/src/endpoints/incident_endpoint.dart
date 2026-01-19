import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'streaming_endpoint.dart';

class IncidentEndpoint extends Endpoint {
  /// List incidents with filtering
  Future<List<Incident>> list(
    Session session, {
    IncidentStatus? status,
    IncidentSeverity? severity,
    int? serviceId,
    int? limit,
    int? offset,
  }) async {
    return await Incident.db.find(
      session,
      where: (t) {
        var conditions = t.id.notEquals(null);
        if (status != null) conditions = conditions & t.status.equals(status);
        if (severity != null) {
          conditions = conditions & t.severity.equals(severity);
        }
        if (serviceId != null) {
          conditions = conditions & t.serviceId.equals(serviceId);
        }
        return conditions;
      },
      include: Incident.include(
        service: Service.include(),
        commander: OpsUser.include(),
      ),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      limit: limit ?? 50,
      offset: offset ?? 0,
    );
  }

  /// Get single incident with full details
  Future<Incident?> get(Session session, int id) async {
    return await Incident.db.findById(
      session,
      id,
      include: Incident.include(
        service: Service.include(),
        commander: OpsUser.include(),
        rule: Rule.include(),
        timeline: IncidentTimelineItem.includeList(),
        executions: PlaybookExecution.includeList(),
      ),
    );
  }

  /// Update incident status
  Future<Incident> updateStatus(
    Session session,
    int id,
    IncidentStatus status,
  ) async {
    final incident = await Incident.db.findById(session, id);
    if (incident == null) throw Exception('Incident not found');

    incident.status = status;
    incident.updatedAt = DateTime.now();
    if (status == IncidentStatus.RESOLVED) {
      incident.resolvedAt = DateTime.now();
    }

    await Incident.db.updateRow(session, incident);

    // Add timeline entry
    await IncidentTimelineItem.db.insertRow(
      session,
      IncidentTimelineItem(
        incidentId: id,
        type: TimelineItemType.STATUS_CHANGE,
        content: 'Status changed to ${status.name}',
        createdAt: DateTime.now(),
        authorId: 0, // TODO: Get from authenticated user
      ),
    );

    // Broadcast update via streaming - fetch updated incident
    final updatedIncident = await Incident.db.findById(session, id);
    if (updatedIncident != null) {
      session.messages.postMessage(
        'incident-room-$id',
        StreamIncidentUpdate(
          type: StreamUpdateType.UPDATE,
          incident: updatedIncident,
        ),
      );
    }

    return incident;
  }

  /// Assign incident commander
  Future<Incident> assignCommander(
    Session session,
    int id,
    int commanderId,
  ) async {
    final incident = await Incident.db.findById(session, id);
    if (incident == null) throw Exception('Incident not found');

    incident.commanderId = commanderId;
    incident.updatedAt = DateTime.now();
    await Incident.db.updateRow(session, incident);

    await IncidentTimelineItem.db.insertRow(
      session,
      IncidentTimelineItem(
        incidentId: id,
        type: TimelineItemType.STATUS_CHANGE,
        content: 'Incident commander assigned',
        createdAt: DateTime.now(),
        authorId: commanderId,
      ),
    );

    // Broadcast update
    session.messages.postMessage(
      'incident-room-$id',
      StreamIncidentUpdate(
        type: StreamUpdateType.UPDATE,
        incident: incident,
      ),
    );

    // Also broadcast to global stream for real-time dashboard
    await StreamBroadcaster.broadcastAlert(
      session,
      StreamAlert(
        id: incident.id!,
        serviceId: incident.serviceId,
        title: incident.title,
        message: 'Commander assigned: User #$commanderId',
        severity: 'info',
        source: 'incident',
        timestamp: DateTime.now(),
        acknowledged: false,
      ),
    );

    return incident;
  }

  /// Add timeline item (comment, action, etc.)
  Future<IncidentTimelineItem> addTimelineItem(
    Session session,
    IncidentTimelineItem item,
  ) async {
    item.createdAt = DateTime.now();
    final created = await IncidentTimelineItem.db.insertRow(session, item);

    // Broadcast to incident room
    session.messages.postMessage(
      'incident-room-${item.incidentId}',
      StreamTimelineEvent(
        incidentId: item.incidentId,
        item: created,
      ),
    );

    return created;
  }

  /// Get incident statistics for dashboard
  Future<Map<String, dynamic>> getStats(Session session) async {
    final incidents = await Incident.db.find(session);
    final open = incidents.where((i) => i.status == IncidentStatus.OPEN).length;
    final acknowledged = incidents
        .where((i) => i.status == IncidentStatus.ACKNOWLEDGED)
        .length;
    final mitigated = incidents
        .where((i) => i.status == IncidentStatus.MITIGATED)
        .length;
    final resolved = incidents
        .where((i) => i.status == IncidentStatus.RESOLVED)
        .length;

    final critical = incidents
        .where((i) => i.severity == IncidentSeverity.CRITICAL)
        .length;
    final high = incidents
        .where((i) => i.severity == IncidentSeverity.HIGH)
        .length;

    return {
      'total': incidents.length,
      'open': open,
      'acknowledged': acknowledged,
      'mitigated': mitigated,
      'resolved': resolved,
      'critical': critical,
      'high': high,
      'activeCount': open + acknowledged + mitigated,
    };
  }

  /// Create a new incident manually
  Future<Incident> create(Session session, Incident incident) async {
    incident.createdAt = DateTime.now();
    incident.updatedAt = DateTime.now();
    incident.status = incident.status; // Keep provided or default

    final created = await Incident.db.insertRow(session, incident);

    // Add initial timeline entry
    await IncidentTimelineItem.db.insertRow(
      session,
      IncidentTimelineItem(
        incidentId: created.id!,
        type: TimelineItemType.STATUS_CHANGE,
        content: 'Incident created',
        createdAt: DateTime.now(),
        authorId: incident.commanderId,
      ),
    );

    // Broadcast new incident via streaming
    session.messages.postMessage(
      'global-service-updates',
      StreamIncidentUpdate(
        type: StreamUpdateType.CREATE,
        incident: created,
      ),
    );

    return created;
  }

  /// Close an incident
  Future<Incident> close(Session session, int id) async {
    final incident = await Incident.db.findById(session, id);
    if (incident == null) throw Exception('Incident not found');

    incident.status = IncidentStatus.CLOSED;
    incident.updatedAt = DateTime.now();
    if (incident.resolvedAt == null) {
      incident.resolvedAt = DateTime.now();
    }

    await Incident.db.updateRow(session, incident);

    // Add timeline entry
    await IncidentTimelineItem.db.insertRow(
      session,
      IncidentTimelineItem(
        incidentId: id,
        type: TimelineItemType.STATUS_CHANGE,
        content: 'Incident closed',
        createdAt: DateTime.now(),
        authorId: 0, // TODO: Get from authenticated user
      ),
    );

    // Broadcast update
    session.messages.postMessage(
      'incident-room-$id',
      StreamIncidentUpdate(
        type: StreamUpdateType.UPDATE,
        incident: incident,
      ),
    );

    return incident;
  }

  /// Acknowledge an incident
  Future<Incident> acknowledge(Session session, int id, int userId) async {
    final incident = await Incident.db.findById(session, id);
    if (incident == null) throw Exception('Incident not found');

    incident.status = IncidentStatus.ACKNOWLEDGED;
    incident.updatedAt = DateTime.now();

    await Incident.db.updateRow(session, incident);

    // Add timeline entry
    await IncidentTimelineItem.db.insertRow(
      session,
      IncidentTimelineItem(
        incidentId: id,
        type: TimelineItemType.STATUS_CHANGE,
        content: 'Incident acknowledged',
        createdAt: DateTime.now(),
        authorId: userId,
      ),
    );

    // Broadcast update
    session.messages.postMessage(
      'incident-room-$id',
      StreamIncidentUpdate(
        type: StreamUpdateType.UPDATE,
        incident: incident,
      ),
    );

    return incident;
  }

  /// Bulk acknowledge all open incidents
  Future<int> acknowledgeAll(Session session, int userId) async {
    final openIncidents = await Incident.db.find(
      session,
      where: (t) => t.status.equals(IncidentStatus.OPEN),
    );

    int count = 0;
    for (final incident in openIncidents) {
      incident.status = IncidentStatus.ACKNOWLEDGED;
      incident.updatedAt = DateTime.now();
      await Incident.db.updateRow(session, incident);

      // Add timeline entry for each
      await IncidentTimelineItem.db.insertRow(
        session,
        IncidentTimelineItem(
          incidentId: incident.id!,
          type: TimelineItemType.STATUS_CHANGE,
          content: 'Incident acknowledged (bulk action)',
          createdAt: DateTime.now(),
          authorId: userId,
        ),
      );

      // Broadcast update to room
      session.messages.postMessage(
        'incident-room-${incident.id}',
        StreamIncidentUpdate(
          type: StreamUpdateType.UPDATE,
          incident: incident,
        ),
      );

      count++;
    }

    // Broadcast global alert about bulk action
    if (count > 0) {
      await StreamBroadcaster.broadcastAlert(
        session,
        StreamAlert(
          id: DateTime.now().millisecondsSinceEpoch,
          title: 'Bulk Acknowledge',
          message: '$count incidents acknowledged by User #$userId',
          severity: 'info',
          source: 'system',
          timestamp: DateTime.now(),
          acknowledged: true,
        ),
      );
    }

    return count;
  }

  /// Update incident details
  Future<Incident> update(Session session, Incident incident) async {
    incident.updatedAt = DateTime.now();
    return await Incident.db.updateRow(session, incident);
  }

  /// Delete an incident
  Future<bool> delete(Session session, int id) async {
    // First delete related timeline items
    await IncidentTimelineItem.db.deleteWhere(
      session,
      where: (t) => t.incidentId.equals(id),
    );

    final deleted = await Incident.db.deleteWhere(
      session,
      where: (t) => t.id.equals(id),
    );
    return deleted.isNotEmpty;
  }
}
