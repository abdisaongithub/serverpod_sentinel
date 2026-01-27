import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/business/security/security_checks.dart';
import 'package:serverpod_sentinel_server/src/business/observability/slo_service.dart';

class SloEndpoint extends Endpoint {
  Future<void> _checkPermission(Session session, AppPermission permission) async {
    await SecurityChecks.requirePermission(session, permission);
  }

  /// Get availability SLI for a service
  Future<Map<String, dynamic>> getAvailability(
    Session session,
    int serviceId, {
    int days = 30,
  }) async {
    await _checkPermission(session, AppPermission.telemetry_view);
    return await SloService.calculateAvailability(
      session,
      serviceId,
      Duration(days: days),
    );
  }

  /// Get status of all SLOs for a service
  Future<List<Map<String, dynamic>>> getServiceSloStatus(
    Session session,
    int serviceId,
  ) async {
    await _checkPermission(session, AppPermission.telemetry_view);
    
    // For now, only availability is implemented
    final availability = await SloService.calculateAvailability(
      session,
      serviceId,
      const Duration(days: 30),
    );

    return [availability];
  }
}
