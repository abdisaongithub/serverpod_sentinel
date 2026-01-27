import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/business/security/security_checks.dart';
import 'package:serverpod_sentinel_server/src/business/security/audit_logger.dart';
import 'package:serverpod_sentinel_server/src/business/extensibility/webhook_service.dart';
import 'streaming_endpoint.dart';

class IncidentEndpoint extends Endpoint {
  /// Helper to verify permission
  Future<void> _checkPermission(Session session, AppPermission permission) async {
    await SecurityChecks.requirePermission(session, permission);
  }

  /// List incidents with filtering
  Future<List<Incident>> list(
    Session session, {
    IncidentStatus? status,
    IncidentSeverity? severity,
    int? serviceId,
    int? limit,
    int? offset,
  }) async {
    await _checkPermission(session, AppPermission.incident_view);
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
    await _checkPermission(session, AppPermission.incident_view);
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
    final permission = status == IncidentStatus.RESOLVED || status == IncidentStatus.CLOSED
        ? AppPermission.incident_resolve
        : AppPermission.incident_acknowledge;
    
    await _checkPermission(session, permission);
    
    final incident = await Incident.db.findById(session, id);

    if (incident == null) throw Exception('Incident not found');

    final oldStatus = incident.status;
    incident.status = status;
    incident.updatedAt = DateTime.now();
    if (status == IncidentStatus.RESOLVED) {
      incident.resolvedAt = DateTime.now();
    }

    final updated = await Incident.db.updateRow(session, incident);

    // Log action
    await AuditLogger.log(
      session: session,
      action: 'UPDATE_STATUS',
      entityType: 'Incident',
      entityId: id,
      changes: {'from': oldStatus.name, 'to': status.name},
    );

    // Get current user for timeline
    final authInfo = await session.authenticated;
    final actorUserId = (authInfo as dynamic)?.userId;
    int authorOpsUserId = 0;
    if (actorUserId != null) {
      final opsUser = await OpsUser.db.findFirstRow(
        session,
        where: (t) => t.userInfoId.equals(actorUserId),
      );
      authorOpsUserId = opsUser?.id ?? 0;
    }

    // Add timeline entry
    await IncidentTimelineItem.db.insertRow(
      session,
      IncidentTimelineItem(
        incidentId: id,
        type: TimelineItemType.STATUS_CHANGE,
        content: 'Status changed from ${oldStatus.name} to ${status.name}',
        createdAt: DateTime.now(),
        authorId: authorOpsUserId,
      ),
    );

    // Broadcast update via streaming
    session.messages.postMessage(
      'incident-room-$id',
      StreamIncidentUpdate(
        type: StreamUpdateType.UPDATE,
        incident: updated,
      ),
    );

    return updated;
  }

  /// Assign incident commander
  Future<Incident> assignCommander(
    Session session,
    int id,
    int commanderId,
  ) async {
    await _checkPermission(session, AppPermission.incident_manage_timeline);
    final incident = await Incident.db.findById(session, id);

    if (incident == null) throw Exception('Incident not found');

    final oldCommanderId = incident.commanderId;
    incident.commanderId = commanderId;
    incident.updatedAt = DateTime.now();
    await Incident.db.updateRow(session, incident);

    // Log action
    await AuditLogger.log(
      session: session,
      action: 'ASSIGN_COMMANDER',
      entityType: 'Incident',
      entityId: id,
      changes: {'from': oldCommanderId, 'to': commanderId},
    );

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
    await _checkPermission(session, AppPermission.incident_manage_timeline);
    item.createdAt = DateTime.now();

    final created = await IncidentTimelineItem.db.insertRow(session, item);

    // Log action (optional for every comment, but good for audit)
    await AuditLogger.log(
      session: session,
      action: 'ADD_TIMELINE_ITEM',
      entityType: 'Incident',
      entityId: item.incidentId,
      changes: {'type': item.type.name, 'content': item.content},
    );

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
    await _checkPermission(session, AppPermission.incident_view);
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
    await _checkPermission(session, AppPermission.incident_create);
    incident.createdAt = DateTime.now();

    incident.updatedAt = DateTime.now();
    incident.status = incident.status; // Keep provided or default

    final created = await Incident.db.insertRow(session, incident);

    // Log action
    await AuditLogger.log(
      session: session,
      action: 'CREATE',
      entityType: 'Incident',
      entityId: created.id!,
      changes: created.toJson(),
    );

    // Get current user for timeline
    final authInfo = await session.authenticated;
    final actorUserId = (authInfo as dynamic)?.userId;
    int authorOpsUserId = incident.commanderId;
    if (actorUserId != null) {
      final opsUser = await OpsUser.db.findFirstRow(
        session,
        where: (t) => t.userInfoId.equals(actorUserId),
      );
      authorOpsUserId = opsUser?.id ?? incident.commanderId;
    }

    // Add initial timeline entry
    await IncidentTimelineItem.db.insertRow(
      session,
      IncidentTimelineItem(
        incidentId: created.id!,
        type: TimelineItemType.STATUS_CHANGE,
        content: 'Incident created manually',
        createdAt: DateTime.now(),
        authorId: authorOpsUserId,
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

    // Trigger Webhook
    await WebhookService.trigger(
      session: session,
      event: 'incident.created',
      payload: created.toJson(),
    );

    return created;
  }

  /// Close an incident
  Future<Incident> close(Session session, int id) async {
    await _checkPermission(session, AppPermission.incident_resolve);
    final incident = await Incident.db.findById(session, id);

    if (incident == null) throw Exception('Incident not found');

    incident.status = IncidentStatus.CLOSED;
    incident.updatedAt = DateTime.now();
    if (incident.resolvedAt == null) {
      incident.resolvedAt = DateTime.now();
    }

    await Incident.db.updateRow(session, incident);

    // Log action
    await AuditLogger.log(
      session: session,
      action: 'CLOSE',
      entityType: 'Incident',
      entityId: id,
    );

    // Get current user for timeline
    final authInfo = await session.authenticated;
    final actorUserId = (authInfo as dynamic)?.userId;
    int authorOpsUserId = 0;
    if (actorUserId != null) {
      final opsUser = await OpsUser.db.findFirstRow(
        session,
        where: (t) => t.userInfoId.equals(actorUserId),
      );
      authorOpsUserId = opsUser?.id ?? 0;
    }

    // Add timeline entry
    await IncidentTimelineItem.db.insertRow(
      session,
      IncidentTimelineItem(
        incidentId: id,
        type: TimelineItemType.STATUS_CHANGE,
        content: 'Incident closed',
        createdAt: DateTime.now(),
        authorId: authorOpsUserId,
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
    await _checkPermission(session, AppPermission.incident_acknowledge);
    final incident = await Incident.db.findById(session, id);

    if (incident == null) throw Exception('Incident not found');

    incident.status = IncidentStatus.ACKNOWLEDGED;
    incident.updatedAt = DateTime.now();

    await Incident.db.updateRow(session, incident);

    // Log action
    await AuditLogger.log(
      session: session,
      action: 'ACKNOWLEDGE',
      entityType: 'Incident',
      entityId: id,
    );

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
    await _checkPermission(session, AppPermission.incident_acknowledge);
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

    // Log bulk action
    if (count > 0) {
      await AuditLogger.log(
        session: session,
        action: 'BULK_ACKNOWLEDGE',
        entityType: 'Incident',
        entityId: 0,
        changes: {'count': count},
      );
      
      // Broadcast global alert about bulk action
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
    await _checkPermission(session, AppPermission.incident_manage_timeline);
    incident.updatedAt = DateTime.now();

    final previous = await Incident.db.findById(session, incident.id!);
    final updated = await Incident.db.updateRow(session, incident);

    // Log action
    await AuditLogger.log(
      session: session,
      action: 'UPDATE',
      entityType: 'Incident',
      entityId: updated.id!,
      changes: {
        'from': previous?.toJson(),
        'to': updated.toJson(),
      },
    );

    return updated;
  }

  /// Delete an incident
  Future<bool> delete(Session session, int id) async {
    await _checkPermission(session, AppPermission.incident_delete);
    
    final previous = await Incident.db.findById(session, id);
    
    // First delete related timeline items
    await IncidentTimelineItem.db.deleteWhere(
      session,
      where: (t) => t.incidentId.equals(id),
    );

    final deleted = await Incident.db.deleteWhere(
      session,
      where: (t) => t.id.equals(id),
    );

    if (deleted.isNotEmpty) {
      // Log action
      await AuditLogger.log(
        session: session,
        action: 'DELETE',
        entityType: 'Incident',
        entityId: id,
        changes: previous?.toJson(),
      );
    }
    
    return deleted.isNotEmpty;
  }
}

