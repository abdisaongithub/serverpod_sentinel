import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

class HealthEndpoint extends Endpoint {
  /// Simple health check - always returns true if server is responding
  Future<bool> ping(Session session) async {
    return true;
  }

  /// Detailed health check including dependencies
  Future<Map<String, dynamic>> check(Session session) async {
    final checks = <String, dynamic>{
      'status': 'healthy',
      'timestamp': DateTime.now().toIso8601String(),
      'checks': <String, dynamic>{},
    };

    // Database check using a simple count query
    try {
      await Service.db.count(session);
      checks['checks']['database'] = {'status': 'up'};
    } catch (e) {
      checks['checks']['database'] = {'status': 'down', 'error': e.toString()};
      checks['status'] = 'unhealthy';
    }

    // Service count (application-specific)
    try {
      final serviceCount = await Service.db.count(session);
      checks['checks']['services'] = {
        'status': 'up',
        'count': serviceCount,
      };
    } catch (e) {
      checks['checks']['services'] = {'status': 'error', 'error': e.toString()};
    }

    // Incident count
    try {
      final incidentCount = await Incident.db.count(session);
      final activeCount = await Incident.db.count(
        session,
        where: (t) =>
            t.status.notEquals(IncidentStatus.RESOLVED) &
            t.status.notEquals(IncidentStatus.CLOSED),
      );
      checks['checks']['incidents'] = {
        'status': 'up',
        'total': incidentCount,
        'active': activeCount,
      };
    } catch (e) {
      checks['checks']['incidents'] = {
        'status': 'error',
        'error': e.toString(),
      };
    }

    return checks;
  }

  /// Readiness check for Kubernetes
  Future<Map<String, dynamic>> ready(Session session) async {
    // Check if server has completed initialization by doing a simple DB operation
    try {
      await Service.db.count(session);
      return {'ready': true};
    } catch (e) {
      return {'ready': false, 'reason': e.toString()};
    }
  }

  /// Liveness check for Kubernetes
  Future<Map<String, dynamic>> live(Session session) async {
    return {
      'live': true,
      'timestamp': DateTime.now().toIso8601String(),
    };
  }
}
