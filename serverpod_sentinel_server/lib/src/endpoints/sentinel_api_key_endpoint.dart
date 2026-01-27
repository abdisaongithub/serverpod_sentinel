import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/business/security/security_checks.dart';
import 'package:serverpod_sentinel_server/src/business/extensibility/api_key_service.dart';
import 'package:serverpod_sentinel_server/src/business/security/audit_logger.dart';

class SentinelApiKeyEndpoint extends Endpoint {
  Future<void> _checkPermission(Session session, AppPermission permission) async {
    await SecurityChecks.requirePermission(session, permission);
  }

  /// List all API keys for the current user (or all if SuperAdmin)
  Future<List<SentinelApiKey>> list(Session session) async {
    final userId = await SecurityChecks.requireAuthentication(session);
    
    // Check if user is SuperAdmin to see all keys
    bool isSuper = false;
    try {
      await SecurityChecks.requireRole(session, 'SuperAdmin');
      isSuper = true;
    } catch (_) {}

    if (isSuper) {
      return await SentinelApiKey.db.find(session, orderBy: (t) => t.createdAt);
    } else {
      // Return only keys owned by the user
      final opsUser = await OpsUser.db.findFirstRow(session, where: (t) => t.userInfoId.equals(userId));
      if (opsUser == null) return [];
      return await SentinelApiKey.db.find(
        session, 
        where: (t) => t.userId.equals(opsUser.id),
        orderBy: (t) => t.createdAt,
      );
    }
  }

  /// Create a new scoped API key
  Future<String> create(
    Session session, {
    required String name,
    required List<String> scopes,
    DateTime? expiresAt,
  }) async {
    await _checkPermission(session, AppPermission.user_manage);
    final userId = await SecurityChecks.requireAuthentication(session);
    final opsUser = await OpsUser.db.findFirstRow(session, where: (t) => t.userInfoId.equals(userId));

    final rawKey = await ApiKeyService.generate(
      session,
      name: name,
      scopes: scopes,
      userId: opsUser?.id,
    );

    await AuditLogger.log(
      session: session,
      action: 'CREATE_API_KEY',
      entityType: 'SentinelApiKey',
      entityId: 0, // ID not available for raw key return
      changes: {'name': name, 'scopes': scopes},
    );

    return rawKey;
  }

  /// Delete an API key
  Future<bool> delete(Session session, int id) async {
    await _checkPermission(session, AppPermission.user_manage);
    
    final deleted = await SentinelApiKey.db.deleteWhere(
      session,
      where: (t) => t.id.equals(id),
    );

    if (deleted.isNotEmpty) {
      await AuditLogger.log(
        session: session,
        action: 'DELETE_API_KEY',
        entityType: 'SentinelApiKey',
        entityId: id,
      );
    }

    return deleted.isNotEmpty;
  }
}
