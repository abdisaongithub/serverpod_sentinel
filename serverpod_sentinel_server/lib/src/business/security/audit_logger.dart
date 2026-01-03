import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

class AuditLogger {
  /// Logs a user action to the immutable audit log.
  static Future<void> log({
    required Session session,
    required String action,
    required String entityType,
    required int entityId,
    String? details,
  }) async {
    // Get user ID (0 for system actions)
    int actorId = 0;
    try {
      final authInfo = await session.authenticated;
      actorId = authInfo?.userId ?? 0;
    } catch (_) {
      // System action or anonymous
    }

    // Get IP address from session if available
    String? ipAddress;
    // session.httpRequest?.headers['x-forwarded-for'] or similar
    // For now, we'll leave it null as endpoint context varies.

    final logEntry = AuditLog(
      actorId: actorId,
      action: action,
      entityType: entityType,
      entityId: entityId,
      changes: details,
      ipAddress: ipAddress,
      createdAt: DateTime.now(),
    );

    await AuditLog.db.insertRow(session, logEntry);
  }
}
