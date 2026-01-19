import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

class EnvironmentEndpoint extends Endpoint {
  /// List all environments
  Future<List<Environment>> list(Session session) async {
    return await Environment.db.find(
      session,
      orderBy: (t) => t.name,
    );
  }

  /// Get single environment by ID
  Future<Environment?> get(Session session, int id) async {
    return await Environment.db.findById(session, id);
  }

  /// Create new environment
  Future<Environment> create(Session session, Environment environment) async {
    environment.createdAt = DateTime.now();
    environment.updatedAt = DateTime.now();
    return await Environment.db.insertRow(session, environment);
  }

  /// Update environment
  Future<Environment> update(Session session, Environment environment) async {
    environment.updatedAt = DateTime.now();
    return await Environment.db.updateRow(session, environment);
  }

  /// Delete environment
  Future<bool> delete(Session session, int id) async {
    final deleted = await Environment.db.deleteWhere(
      session,
      where: (t) => t.id.equals(id),
    );
    return deleted.isNotEmpty;
  }

  /// Get active environment
  Future<Environment?> getActive(Session session) async {
    return await Environment.db.findFirstRow(
      session,
      where: (t) => t.isActive.equals(true),
    );
  }

  /// Set active environment
  Future<Environment> setActive(Session session, int id) async {
    // Deactivate all environments first
    final allEnvs = await Environment.db.find(session);
    for (final env in allEnvs) {
      if (env.isActive) {
        env.isActive = false;
        env.updatedAt = DateTime.now();
        await Environment.db.updateRow(session, env);
      }
    }

    // Activate the specified environment
    final environment = await Environment.db.findById(session, id);
    if (environment == null) throw Exception('Environment not found');

    environment.isActive = true;
    environment.updatedAt = DateTime.now();
    return await Environment.db.updateRow(session, environment);
  }
}
