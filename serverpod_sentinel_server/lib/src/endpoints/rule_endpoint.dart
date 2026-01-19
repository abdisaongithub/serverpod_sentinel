import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

class RuleEndpoint extends Endpoint {
  /// List all rules
  Future<List<Rule>> list(Session session) async {
    return await Rule.db.find(
      session,
      include: Rule.include(
        service: Service.include(),
        signal: HealthSignal.include(),
      ),
    );
  }

  /// List rules for a service
  Future<List<Rule>> listForService(Session session, int serviceId) async {
    return await Rule.db.find(
      session,
      where: (t) => t.serviceId.equals(serviceId),
      include: Rule.include(signal: HealthSignal.include()),
    );
  }

  /// Get rule by ID
  Future<Rule?> get(Session session, int id) async {
    return await Rule.db.findById(
      session,
      id,
      include: Rule.include(
        service: Service.include(),
        signal: HealthSignal.include(),
      ),
    );
  }

  /// Create rule
  Future<Rule> create(Session session, Rule rule) async {
    rule.createdAt = DateTime.now();
    rule.updatedAt = DateTime.now();
    return await Rule.db.insertRow(session, rule);
  }

  /// Update rule
  Future<Rule> update(Session session, Rule rule) async {
    rule.updatedAt = DateTime.now();
    return await Rule.db.updateRow(session, rule);
  }

  /// Toggle rule enabled/disabled
  Future<Rule> toggleEnabled(Session session, int id, bool enabled) async {
    final rule = await Rule.db.findById(session, id);
    if (rule == null) throw Exception('Rule not found');

    rule.enabled = enabled;
    rule.updatedAt = DateTime.now();
    return await Rule.db.updateRow(session, rule);
  }

  /// Delete rule
  Future<bool> delete(Session session, int id) async {
    final deleted = await Rule.db.deleteWhere(
      session,
      where: (t) => t.id.equals(id),
    );
    return deleted.isNotEmpty;
  }
}
