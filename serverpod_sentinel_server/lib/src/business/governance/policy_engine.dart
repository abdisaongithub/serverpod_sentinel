import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

/// Evaluates governance policies against platform state.
class PolicyEngine {
  /// Checks if all services comply with organizational standards.
  static Future<List<Map<String, dynamic>>> auditCompliance(Session session) async {
    final services = await Service.db.find(session);
    final violations = <Map<String, dynamic>>[];

    for (final service in services) {
      // Rule 1: Production services (Tier 1) MUST have at least 3 health signals.
      if (service.tier == ServiceTier.TIER_1) {
        final signals = await HealthSignal.db.find(session, where: (t) => t.serviceId.equals(service.id!));
        if (signals.length < 3) {
          violations.add({
            'service': service.name,
            'policy': 'Minimum Observability',
            'detail': 'Critical services must have >= 3 signals. Found ${signals.length}.',
            'severity': 'HIGH',
          });
        }
      }

      // Rule 2: Every service must have an owner.
      if (service.ownerId == null) {
        violations.add({
          'service': service.name,
          'policy': 'Ownership',
          'detail': 'Service has no designated owner.',
          'severity': 'MEDIUM',
        });
      }
    }

    return violations;
  }
}
