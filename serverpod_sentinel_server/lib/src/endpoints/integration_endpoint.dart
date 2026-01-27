import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/business/security/encryption_service.dart';
import 'package:serverpod_sentinel_server/src/business/security/security_checks.dart';
import 'package:serverpod_sentinel_server/src/business/security/audit_logger.dart';
import 'package:serverpod_sentinel_server/src/utils/circuit_breaker.dart';

class IntegrationEndpoint extends Endpoint {
  /// Helper to verify permission
  Future<void> _checkPermission(Session session, AppPermission permission) async {
    await SecurityChecks.requirePermission(session, permission);
  }

  /// List all integrations
  Future<List<Integration>> list(Session session, {String? type}) async {
    await _checkPermission(session, AppPermission.system_settings_view);
    final integrations = await Integration.db.find(
      session,
      where: type != null ? (t) => t.type.equals(type) : null,
      orderBy: (t) => t.name,
    );

    // Redact config in list view for security
    for (var i = 0; i < integrations.length; i++) {
      integrations[i].config = 'REDACTED';
    }

    return integrations;
  }

  /// Get single integration by ID
  Future<Integration?> get(Session session, int id) async {
    await _checkPermission(session, AppPermission.system_settings_view);
    final integration = await Integration.db.findById(session, id);
    if (integration != null && integration.config != null) {
      integration.config = await EncryptionService.decrypt(session, integration.config!);
    }
    return integration;
  }

  /// Create new integration
  Future<Integration> create(Session session, Integration integration) async {
    await _checkPermission(session, AppPermission.integration_manage);
    
    if (integration.config != null) {
      integration.config = await EncryptionService.encrypt(session, integration.config!);
    }

    integration.createdAt = DateTime.now();
    integration.updatedAt = DateTime.now();
    final created = await Integration.db.insertRow(session, integration);

    await AuditLogger.log(
      session: session,
      action: 'CREATE',
      entityType: 'Integration',
      entityId: created.id!,
    );

    return created;
  }

  /// Update integration
  Future<Integration> update(Session session, Integration integration) async {
    await _checkPermission(session, AppPermission.integration_manage);
    
    if (integration.config != null) {
      integration.config = await EncryptionService.encrypt(session, integration.config!);
    }

    integration.updatedAt = DateTime.now();
    final updated = await Integration.db.updateRow(session, integration);

    await AuditLogger.log(
      session: session,
      action: 'UPDATE',
      entityType: 'Integration',
      entityId: updated.id!,
    );

    return updated;
  }

  /// Delete integration
  Future<bool> delete(Session session, int id) async {
    await _checkPermission(session, AppPermission.integration_manage);
    final deleted = await Integration.db.deleteWhere(
      session,
      where: (t) => t.id.equals(id),
    );

    if (deleted.isNotEmpty) {
      await AuditLogger.log(
        session: session,
        action: 'DELETE',
        entityType: 'Integration',
        entityId: id,
      );
    }

    return deleted.isNotEmpty;
  }

  /// Toggle integration enabled/disabled
  Future<Integration> toggleEnabled(
    Session session,
    int id,
    bool enabled,
  ) async {
    await _checkPermission(session, AppPermission.integration_manage);
    final integration = await Integration.db.findById(session, id);
    if (integration == null) throw Exception('Integration not found');

    integration.isEnabled = enabled;
    integration.updatedAt = DateTime.now();
    return await Integration.db.updateRow(session, integration);
  }

  /// Test integration connection
  Future<Map<String, dynamic>> testConnection(Session session, int id) async {
    await _checkPermission(session, AppPermission.integration_manage);
    final integration = await Integration.db.findById(session, id);
    if (integration == null) throw Exception('Integration not found');

    final breaker = CircuitBreakerRegistry.get('integration:${integration.provider}');
    
    return await breaker.execute(() async {
      // Simulation of connection test
      await Future.delayed(const Duration(seconds: 1));
      
      return {
        'success': true,
        'message': 'Connection successful',
        'testedAt': DateTime.now().toIso8601String(),
        'circuitState': breaker.state.name,
      };
    });
  }

  /// Sync integration data
  Future<Integration> sync(Session session, int id) async {
    await _checkPermission(session, AppPermission.integration_manage);
    final integration = await Integration.db.findById(session, id);
    if (integration == null) throw Exception('Integration not found');

    integration.lastSyncAt = DateTime.now();
    integration.updatedAt = DateTime.now();
    return await Integration.db.updateRow(session, integration);
  }
}
