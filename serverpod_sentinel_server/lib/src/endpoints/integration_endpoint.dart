import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

class IntegrationEndpoint extends Endpoint {
  /// List all integrations
  Future<List<Integration>> list(Session session, {String? type}) async {
    return await Integration.db.find(
      session,
      where: type != null ? (t) => t.type.equals(type) : null,
      orderBy: (t) => t.name,
    );
  }

  /// Get single integration by ID
  Future<Integration?> get(Session session, int id) async {
    return await Integration.db.findById(session, id);
  }

  /// Create new integration
  Future<Integration> create(Session session, Integration integration) async {
    integration.createdAt = DateTime.now();
    integration.updatedAt = DateTime.now();
    return await Integration.db.insertRow(session, integration);
  }

  /// Update integration
  Future<Integration> update(Session session, Integration integration) async {
    integration.updatedAt = DateTime.now();
    return await Integration.db.updateRow(session, integration);
  }

  /// Delete integration
  Future<bool> delete(Session session, int id) async {
    final deleted = await Integration.db.deleteWhere(
      session,
      where: (t) => t.id.equals(id),
    );
    return deleted.isNotEmpty;
  }

  /// Toggle integration enabled/disabled
  Future<Integration> toggleEnabled(
    Session session,
    int id,
    bool enabled,
  ) async {
    final integration = await Integration.db.findById(session, id);
    if (integration == null) throw Exception('Integration not found');

    integration.isEnabled = enabled;
    integration.updatedAt = DateTime.now();
    return await Integration.db.updateRow(session, integration);
  }

  /// Test integration connection
  Future<Map<String, dynamic>> testConnection(Session session, int id) async {
    final integration = await Integration.db.findById(session, id);
    if (integration == null) throw Exception('Integration not found');

    // TODO: Implement actual connection testing based on provider
    // For now, return a mock success response
    return {
      'success': true,
      'message': 'Connection successful',
      'testedAt': DateTime.now().toIso8601String(),
    };
  }

  /// Sync integration data
  Future<Integration> sync(Session session, int id) async {
    final integration = await Integration.db.findById(session, id);
    if (integration == null) throw Exception('Integration not found');

    // TODO: Implement actual sync based on provider
    integration.lastSyncAt = DateTime.now();
    integration.updatedAt = DateTime.now();
    return await Integration.db.updateRow(session, integration);
  }
}
