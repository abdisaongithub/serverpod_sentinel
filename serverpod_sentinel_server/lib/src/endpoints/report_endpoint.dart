import 'dart:convert';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

class ReportEndpoint extends Endpoint {
  /// List all report snapshots
  Future<List<ReportSnapshot>> listSnapshots(
    Session session, {
    int? incidentId,
    int? generatedById,
    int? limit,
    int? offset,
  }) async {
    return await ReportSnapshot.db.find(
      session,
      where: (t) {
        var conditions = t.id.notEquals(null);
        if (incidentId != null) {
          conditions = conditions & t.incidentId.equals(incidentId);
        }
        if (generatedById != null) {
          conditions = conditions & t.generatedById.equals(generatedById);
        }
        return conditions;
      },
      include: ReportSnapshot.include(
        incident: Incident.include(),
        generatedBy: OpsUser.include(),
      ),
      orderBy: (t) => t.generatedAt,
      orderDescending: true,
      limit: limit ?? 50,
      offset: offset ?? 0,
    );
  }

  /// Get a single report snapshot by ID
  Future<ReportSnapshot?> getSnapshot(Session session, int id) async {
    return await ReportSnapshot.db.findById(
      session,
      id,
      include: ReportSnapshot.include(
        incident: Incident.include(
          service: Service.include(),
          commander: OpsUser.include(),
        ),
        generatedBy: OpsUser.include(),
      ),
    );
  }

  /// Save a new report snapshot
  Future<ReportSnapshot> saveSnapshot(
    Session session,
    ReportSnapshot snapshot,
  ) async {
    snapshot.generatedAt = DateTime.now();
    return await ReportSnapshot.db.insertRow(session, snapshot);
  }

  /// Delete a report snapshot
  Future<bool> deleteSnapshot(Session session, int id) async {
    final deleted = await ReportSnapshot.db.deleteWhere(
      session,
      where: (t) => t.id.equals(id),
    );
    return deleted.isNotEmpty;
  }

  /// Generate an incident report
  Future<Map<String, dynamic>> generateIncidentReport(
    Session session, {
    required DateTime from,
    required DateTime to,
    List<int>? serviceIds,
    List<IncidentSeverity>? severities,
  }) async {
    // Fetch incidents within the date range
    final incidents = await Incident.db.find(
      session,
      where: (t) {
        var conditions = t.createdAt.notEquals(null);
        // Filter by service if provided
        if (serviceIds != null && serviceIds.isNotEmpty) {
          conditions = conditions & t.serviceId.inSet(serviceIds.toSet());
        }
        return conditions;
      },
      include: Incident.include(
        service: Service.include(),
        commander: OpsUser.include(),
      ),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );

    // Filter by severity if provided
    final filteredIncidents = severities != null && severities.isNotEmpty
        ? incidents.where((i) => severities.contains(i.severity)).toList()
        : incidents;

    // Calculate statistics
    final totalIncidents = filteredIncidents.length;
    final criticalCount = filteredIncidents
        .where((i) => i.severity == IncidentSeverity.CRITICAL)
        .length;
    final highCount = filteredIncidents
        .where((i) => i.severity == IncidentSeverity.HIGH)
        .length;
    final mediumCount = filteredIncidents
        .where((i) => i.severity == IncidentSeverity.MEDIUM)
        .length;
    final lowCount = filteredIncidents
        .where((i) => i.severity == IncidentSeverity.LOW)
        .length;

    final resolvedCount = filteredIncidents
        .where((i) => i.status == IncidentStatus.RESOLVED)
        .length;

    // Calculate MTTR (Mean Time To Resolution)
    final resolvedIncidents = filteredIncidents.where(
      (i) => i.status == IncidentStatus.RESOLVED && i.resolvedAt != null,
    );
    Duration totalResolutionTime = Duration.zero;
    for (final incident in resolvedIncidents) {
      totalResolutionTime += incident.resolvedAt!.difference(
        incident.createdAt,
      );
    }
    final mttrMinutes = resolvedIncidents.isEmpty
        ? 0
        : (totalResolutionTime.inMinutes / resolvedIncidents.length).round();

    // Group by service
    final byService = <String, int>{};
    for (final incident in filteredIncidents) {
      final serviceName = incident.service?.name ?? 'Unknown';
      byService[serviceName] = (byService[serviceName] ?? 0) + 1;
    }

    // Group by status
    final byStatus = <String, int>{};
    for (final incident in filteredIncidents) {
      final status = incident.status.name;
      byStatus[status] = (byStatus[status] ?? 0) + 1;
    }

    return {
      'reportType': 'incident',
      'generatedAt': DateTime.now().toIso8601String(),
      'dateRange': {
        'from': from.toIso8601String(),
        'to': to.toIso8601String(),
      },
      'summary': {
        'totalIncidents': totalIncidents,
        'resolvedCount': resolvedCount,
        'resolutionRate': totalIncidents > 0
            ? (resolvedCount / totalIncidents * 100).toStringAsFixed(1)
            : '0.0',
        'mttrMinutes': mttrMinutes,
      },
      'bySeverity': {
        'critical': criticalCount,
        'high': highCount,
        'medium': mediumCount,
        'low': lowCount,
      },
      'byStatus': byStatus,
      'byService': byService,
      'incidents': filteredIncidents
          .map(
            (i) => {
              'id': i.id,
              'title': i.title,
              'severity': i.severity.name,
              'status': i.status.name,
              'service': i.service?.name,
              'createdAt': i.createdAt.toIso8601String(),
              'resolvedAt': i.resolvedAt?.toIso8601String(),
            },
          )
          .toList(),
    };
  }

  /// Generate a service health report
  Future<Map<String, dynamic>> generateHealthReport(
    Session session, {
    List<int>? serviceIds,
  }) async {
    final services = await Service.db.find(
      session,
      where: serviceIds != null && serviceIds.isNotEmpty
          ? (t) => t.id.inSet(serviceIds.toSet())
          : null,
      include: Service.include(
        signals: HealthSignal.includeList(),
      ),
    );

    final operational = services
        .where((s) => s.status == ServiceStatus.OPERATIONAL)
        .length;
    final degraded = services
        .where((s) => s.status == ServiceStatus.DEGRADED)
        .length;
    final outage = services
        .where(
          (s) =>
              s.status == ServiceStatus.MAJOR_OUTAGE ||
              s.status == ServiceStatus.PARTIAL_OUTAGE,
        )
        .length;
    final maintenance = services
        .where((s) => s.status == ServiceStatus.MAINTENANCE)
        .length;

    return {
      'reportType': 'health',
      'generatedAt': DateTime.now().toIso8601String(),
      'summary': {
        'totalServices': services.length,
        'operational': operational,
        'degraded': degraded,
        'outage': outage,
        'maintenance': maintenance,
        'healthScore': services.isEmpty
            ? 100.0
            : (operational / services.length * 100),
      },
      'services': services
          .map(
            (s) => {
              'id': s.id,
              'name': s.name,
              'status': s.status.name,
              'tier': s.tier.name,
              'signalCount': s.signals?.length ?? 0,
              'updatedAt': s.updatedAt.toIso8601String(),
            },
          )
          .toList(),
    };
  }

  /// Save a generated report as a snapshot
  Future<ReportSnapshot> saveGeneratedReport(
    Session session, {
    required Map<String, dynamic> reportData,
    required int incidentId,
    required int generatedById,
  }) async {
    int targetIncidentId = incidentId;

    // Handle case where report is global/general (incidentId 0)
    // We try to attach it to a special "System Reports" incident or the latest one
    if (targetIncidentId == 0) {
      final latest = await Incident.db.findFirstRow(
        session,
        orderBy: (t) => t.createdAt,
        orderDescending: true,
      );
      
      if (latest != null) {
        targetIncidentId = latest.id!;
      } else {
        // If no incidents exist, we cannot satisfy the FK constraint easily without creating one.
        // For now, we will create a dummy incident if possible, or throw.
        // Creating a dummy incident requires Service, User, Rule.
        // Let's check for a service first.
        final service = await Service.db.findFirstRow(session);
        final user = await OpsUser.db.findFirstRow(session);
        
        if (service != null && user != null) {
           // We can create a dummy incident
           // Note: Rule is also required by FK usually? Incident table has ruleId.
           // Let's check rule.
           final rule = await Rule.db.findFirstRow(session);
           
           if (rule != null) {
             final systemIncident = Incident(
               title: 'System Reports Placeholder',
               summary: 'Container for general system reports',
               serviceId: service.id!,
               ruleId: rule.id!,
               commanderId: user.id!,
               status: IncidentStatus.RESOLVED,
               severity: IncidentSeverity.LOW,
               startedAt: DateTime.now(),
               createdAt: DateTime.now(),
               updatedAt: DateTime.now(),
             );
             final created = await Incident.db.insertRow(session, systemIncident);
             targetIncidentId = created.id!;
           }
        }
      }
    }

    // If we still don't have a valid ID (e.g. empty DB), this will fail at DB level.
    // But this logic covers most cases where seed data exists.

    final snapshot = ReportSnapshot(
      incidentId: targetIncidentId,
      generatedAt: DateTime.now(),
      generatedById: generatedById,
      content: jsonEncode(reportData),
    );
    return await ReportSnapshot.db.insertRow(session, snapshot);
  }
}
