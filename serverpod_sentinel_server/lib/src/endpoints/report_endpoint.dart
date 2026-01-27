import 'dart:convert';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/business/security/security_checks.dart';
import 'package:serverpod_sentinel_server/src/business/security/audit_logger.dart';
import 'package:serverpod_sentinel_server/src/business/security/rate_limiter.dart';

class ReportEndpoint extends Endpoint {
  /// Helper to verify permission
  Future<void> _checkPermission(Session session, AppPermission permission) async {
    await SecurityChecks.requirePermission(session, permission);
  }

  /// List all report snapshots
  Future<List<ReportSnapshot>> listSnapshots(
    Session session, {
    int? incidentId,
    int? generatedById,
    int? limit,
    int? offset,
  }) async {
    await _checkPermission(session, AppPermission.report_view_snapshots);
    
    // Apply rate limit for list view (prevents scraping)
    final userId = await SecurityChecks.requireAuthentication(session);
    await RateLimiter.checkLimit(
      session: session,
      key: 'list_snapshots:$userId',
      maxRequests: 30,
      window: const Duration(minutes: 1),
    );

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
    await _checkPermission(session, AppPermission.report_view_snapshots);
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
    await _checkPermission(session, AppPermission.report_generate);
    snapshot.generatedAt = DateTime.now();
    final created = await ReportSnapshot.db.insertRow(session, snapshot);

    await AuditLogger.log(
      session: session,
      action: 'SAVE_SNAPSHOT',
      entityType: 'ReportSnapshot',
      entityId: created.id!,
    );

    return created;
  }

  /// Delete a report snapshot
  Future<bool> deleteSnapshot(Session session, int id) async {
    await _checkPermission(session, AppPermission.report_generate);
    final deleted = await ReportSnapshot.db.deleteWhere(
      session,
      where: (t) => t.id.equals(id),
    );

    if (deleted.isNotEmpty) {
      await AuditLogger.log(
        session: session,
        action: 'DELETE_SNAPSHOT',
        entityType: 'ReportSnapshot',
        entityId: id,
      );
    }

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
    await _checkPermission(session, AppPermission.report_generate);
    
    final incidents = await Incident.db.find(
      session,
      where: (t) {
        var conditions = t.createdAt.between(from, to);
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

    final filteredIncidents = severities != null && severities.isNotEmpty
        ? incidents.where((i) => severities.contains(i.severity)).toList()
        : incidents;

    final totalIncidents = filteredIncidents.length;
    final resolvedCount = filteredIncidents.where((i) => i.status == IncidentStatus.RESOLVED).length;

    return {
      'reportType': 'incident',
      'generatedAt': DateTime.now().toIso8601String(),
      'summary': {
        'totalIncidents': totalIncidents,
        'resolvedCount': resolvedCount,
      },
      'incidents': filteredIncidents.map((i) => {
        'id': i.id,
        'title': i.title,
        'severity': i.severity.name,
        'status': i.status.name,
        'createdAt': i.createdAt.toIso8601String(),
      }).toList(),
    };
  }

  /// Generate a service health report
  Future<Map<String, dynamic>> generateHealthReport(
    Session session, {
    List<int>? serviceIds,
  }) async {
    await _checkPermission(session, AppPermission.report_generate);
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

    return {
      'reportType': 'health',
      'generatedAt': DateTime.now().toIso8601String(),
      'summary': {
        'totalServices': services.length,
        'operational': operational,
      },
    };
  }

  /// Generate a system security & compliance report
  Future<Map<String, dynamic>> generateComplianceReport(Session session) async {
    await _checkPermission(session, AppPermission.audit_log_view);
    
    final roles = await Role.db.find(session);
    final usersWithRoles = await UserRole.db.count(session);
    final thirtyDaysAgo = DateTime.now().subtract(const Duration(days: 30));
    final recentAuditLogs = await AuditLog.db.count(
      session,
      where: (t) => t.createdAt > thirtyDaysAgo,
    );

    final totalOpsUsers = await OpsUser.db.count(session);
    final mfaEnabledUsers = await OpsUser.db.count(
      session,
      where: (t) => t.mfaEnabled.equals(true),
    );

    return {
      'reportType': 'compliance',
      'generatedAt': DateTime.now().toIso8601String(),
      'metrics': {
        'totalRoles': roles.length,
        'usersWithAssignedRoles': usersWithRoles,
        'mfaAdoptionRate': totalOpsUsers > 0 
            ? (mfaEnabledUsers / totalOpsUsers * 100).toStringAsFixed(1) 
            : '100.0',
        'recentAuditActions': recentAuditLogs,
      },
      'checks': [
        {
          'name': 'MFA Enforcement',
          'status': mfaEnabledUsers == totalOpsUsers ? 'PASS' : 'WARN',
          'detail': '$mfaEnabledUsers of $totalOpsUsers users have MFA enabled.',
        },
        {
          'name': 'Audit Trail',
          'status': recentAuditLogs > 0 ? 'PASS' : 'FAIL',
          'detail': 'Audit logging is active and capturing events.',
        },
      ],
    };
  }

  /// Save a generated report as a snapshot
  Future<ReportSnapshot> saveGeneratedReport(
    Session session, {
    required Map<String, dynamic> reportData,
    required int incidentId,
    required int generatedById,
  }) async {
    await _checkPermission(session, AppPermission.report_generate);
    
    final snapshot = ReportSnapshot(
      incidentId: incidentId,
      generatedAt: DateTime.now(),
      generatedById: generatedById,
      content: jsonEncode(reportData),
    );
    return await ReportSnapshot.db.insertRow(session, snapshot);
  }
}
