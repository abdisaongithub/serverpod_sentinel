import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/business/security/security_checks.dart';
import 'package:serverpod_sentinel_server/src/business/security/audit_logger.dart';

class OutgoingWebhookEndpoint extends Endpoint {
  Future<void> _checkPermission(Session session, AppPermission permission) async {
    await SecurityChecks.requirePermission(session, permission);
  }

  /// List all outgoing webhooks
  Future<List<OutgoingWebhook>> list(Session session) async {
    await _checkPermission(session, AppPermission.integration_manage);
    return await OutgoingWebhook.db.find(session, orderBy: (t) => t.name);
  }

  /// Create a new outgoing webhook
  Future<OutgoingWebhook> create(Session session, OutgoingWebhook webhook) async {
    await _checkPermission(session, AppPermission.integration_manage);
    webhook.createdAt = DateTime.now();
    webhook.updatedAt = DateTime.now();
    
    // Auto-generate secret if not provided
    webhook.secret ??= Uuid().v4();

    final created = await OutgoingWebhook.db.insertRow(session, webhook);

    await AuditLogger.log(
      session: session,
      action: 'CREATE_WEBHOOK',
      entityType: 'OutgoingWebhook',
      entityId: created.id!,
      changes: {'url': webhook.url, 'events': webhook.events},
    );

    return created;
  }

  /// Update a webhook
  Future<OutgoingWebhook> update(Session session, OutgoingWebhook webhook) async {
    await _checkPermission(session, AppPermission.integration_manage);
    webhook.updatedAt = DateTime.now();
    final updated = await OutgoingWebhook.db.updateRow(session, webhook);

    await AuditLogger.log(
      session: session,
      action: 'UPDATE_WEBHOOK',
      entityType: 'OutgoingWebhook',
      entityId: updated.id!,
    );

    return updated;
  }

  /// Delete a webhook
  Future<bool> delete(Session session, int id) async {
    await _checkPermission(session, AppPermission.integration_manage);
    final deleted = await OutgoingWebhook.db.deleteWhere(
      session,
      where: (t) => t.id.equals(id),
    );

    if (deleted.isNotEmpty) {
      await AuditLogger.log(
        session: session,
        action: 'DELETE_WEBHOOK',
        entityType: 'OutgoingWebhook',
        entityId: id,
      );
    }

    return deleted.isNotEmpty;
  }
}
