import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/business/security/security_checks.dart';

class AuditLogEndpoint extends Endpoint {
  /// Helper to verify permission
  Future<void> _checkPermission(Session session, AppPermission permission) async {
    await SecurityChecks.requirePermission(session, permission);
  }

  /// List audit logs with filtering
  Future<List<AuditLog>> list(
    Session session, {
    int? actorId,
    String? action,
    String? entityType,
    DateTime? from,
    DateTime? to,
    int? limit,
    int? offset,
  }) async {
    await _checkPermission(session, AppPermission.audit_log_view);
    return await AuditLog.db.find(
      session,
      where: (t) {
        var conditions = t.id.notEquals(null);
        if (actorId != null) conditions = conditions & t.actorId.equals(actorId);
        if (action != null) conditions = conditions & t.action.equals(action);
        if (entityType != null) conditions = conditions & t.entityType.equals(entityType);
        if (from != null) conditions = conditions & (t.createdAt >= from);
        if (to != null) conditions = conditions & (t.createdAt <= to);
        return conditions;
      },
      include: AuditLog.include(actor: OpsUser.include()),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
      limit: limit ?? 100,
      offset: offset ?? 0,
    );
  }

  /// Get single audit log entry
  Future<AuditLog?> get(Session session, int id) async {
    await _checkPermission(session, AppPermission.audit_log_view);
    return await AuditLog.db.findById(
      session,
      id,
      include: AuditLog.include(actor: OpsUser.include()),
    );
  }

  /// Get audit logs for a specific entity
  Future<List<AuditLog>> getForEntity(
    Session session,
    String entityType,
    int entityId,
  ) async {
    await _checkPermission(session, AppPermission.audit_log_view);
    return await AuditLog.db.find(
      session,
      where: (t) => t.entityType.equals(entityType) & t.entityId.equals(entityId),
      include: AuditLog.include(actor: OpsUser.include()),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );
  }

  /// Get available action types
  Future<List<String>> getActionTypes(Session session) async {
    await _checkPermission(session, AppPermission.audit_log_view);
    return ['CREATE', 'UPDATE', 'DELETE', 'LOGIN', 'LOGOUT', 'EXECUTE', 'ACKNOWLEDGE', 'RESOLVE'];
  }

  /// Get available entity types
  Future<List<String>> getEntityTypes(Session session) async {
    await _checkPermission(session, AppPermission.audit_log_view);
    return ['Service', 'Incident', 'Playbook', 'Rule', 'User', 'Integration', 'SystemSetting'];
  }
}
