import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

class AuditLogEndpoint extends Endpoint {
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
    return await AuditLog.db.find(
      session,
      where: (t) {
        var conditions = t.id.notEquals(null);
        if (actorId != null) {
          conditions = conditions & t.actorId.equals(actorId);
        }
        if (action != null) {
          conditions = conditions & t.action.equals(action);
        }
        if (entityType != null) {
          conditions = conditions & t.entityType.equals(entityType);
        }
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
    return await AuditLog.db.find(
      session,
      where: (t) =>
          t.entityType.equals(entityType) & t.entityId.equals(entityId),
      include: AuditLog.include(actor: OpsUser.include()),
      orderBy: (t) => t.createdAt,
      orderDescending: true,
    );
  }

  /// Get available action types
  Future<List<String>> getActionTypes(Session session) async {
    return [
      'create',
      'update',
      'delete',
      'login',
      'logout',
      'assign',
      'acknowledge',
      'resolve',
      'execute',
    ];
  }

  /// Get available entity types
  Future<List<String>> getEntityTypes(Session session) async {
    return [
      'service',
      'incident',
      'playbook',
      'rule',
      'user',
      'integration',
      'environment',
    ];
  }

  /// Create an audit log entry (typically called internally)
  Future<AuditLog> create(Session session, AuditLog log) async {
    log.createdAt = DateTime.now();
    return await AuditLog.db.insertRow(session, log);
  }
}
