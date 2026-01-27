import 'dart:convert';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

class AuditLogger {
  /// Logs a user action to the immutable audit log.
  static Future<void> log({
    required Session session,
    required String action,
    required String entityType,
    required int entityId,
    Map<String, dynamic>? changes,
  }) async {
    final authInfo = await session.authenticated;
    final actorUserId = (authInfo as dynamic)?.userId;

    // Map Auth User ID to OpsUser ID
    int? opsUserId;
    if (actorUserId != null) {
      final opsUser = await OpsUser.db.findFirstRow(
        session,
        where: (t) => t.userInfoId.equals(actorUserId),
      );
      opsUserId = opsUser?.id;
    }

    // Fallback to first available user if no authenticated user (System action)
    // In a real production system, you'd have a dedicated System user.
    if (opsUserId == null) {
      final firstUser = await OpsUser.db.findFirstRow(session);
      opsUserId = firstUser?.id ?? 0; // Should ideally never be 0 due to FK
    }

    final logEntry = AuditLog(
      actorId: opsUserId,
      action: action.toUpperCase(),
      entityType: entityType,
      entityId: entityId,
      changes: changes != null ? jsonEncode(changes) : null,
      ipAddress: null, // Session doesn't easily expose IP in all contexts
      createdAt: DateTime.now(),
    );

    await AuditLog.db.insertRow(session, logEntry);
  }
}
