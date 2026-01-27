import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/business/security/security_checks.dart';
import 'package:serverpod_sentinel_server/src/exceptions/app_exceptions.dart';

class TelemetryEndpoint extends Endpoint {
  
  Future<void> _verifyAgent(Session session) async {
    // Agents must have a valid ServiceToken
    final key = session.authenticationKey;
    if (key == null) throw UnauthorizedException('Missing API Key');

    final validToken = await ServiceToken.db.findFirstRow(
      session,
      where: (t) => t.token.equals(key),
    );
    
    if (validToken == null || (validToken.expiresAt != null && validToken.expiresAt!.isBefore(DateTime.now()))) {
      throw UnauthorizedException('Invalid or expired API Key');
    }
  }

  Future<void> _checkPermission(Session session, AppPermission permission) async {
    await SecurityChecks.requirePermission(session, permission);
  }

  /// Ingest health signal from agent
  Future<void> ingestSignal(
    Session session,
    int serviceId,
    TelemetrySignalPayload payload,
  ) async {
    await _verifyAgent(session);

    // Find or create the health signal
    var signal = await HealthSignal.db.findFirstRow(
      session,
      where: (t) =>
          t.serviceId.equals(serviceId) &
          t.identifier.equals(payload.identifier),
    );

    if (signal == null) {
      signal = HealthSignal(
        serviceId: serviceId,
        identifier: payload.identifier,
        name: payload.identifier, // Default name to identifier
        type: SignalType.METRIC, // Default to METRIC as payload lacks type
        currentValue: payload.value,
        unit: payload.unit,
        isHealthy: payload.isHealthy,
        lastCheckedAt: DateTime.now(),
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      signal = await HealthSignal.db.insertRow(session, signal);
    } else {
      signal.currentValue = payload.value;
      signal.isHealthy = payload.isHealthy;
      signal.lastCheckedAt = DateTime.now();
      signal.updatedAt = DateTime.now();
      signal = await HealthSignal.db.updateRow(session, signal);
    }

    // Store history in MetricPoint
    if (signal.id != null) {
        await MetricPoint.db.insertRow(
          session,
          MetricPoint(
            signalId: signal.id!,
            timestamp: DateTime.now(),
            value: payload.value,
          ),
        );
    }

    // Broadcast service status update
    await session.messages.postMessage(
      'global-service-updates',
      StreamSignalUpdate(
        serviceId: serviceId,
        signalId: signal.id!,
        identifier: payload.identifier,
        value: payload.value,
        timestamp: DateTime.now(),
      ),
    );

    // Also broadcast as a StreamMetric for real-time charts
    await session.messages.postMessage(
      'service-metrics-$serviceId',
      StreamMetric(
        serviceId: serviceId,
        timestamp: DateTime.now(),
        name: payload.identifier,
        value: payload.value,
        unit: payload.unit ?? '',
      ),
    );
  }

  /// Ingest batch of signals
  Future<void> ingestBatch(
    Session session,
    int serviceId,
    TelemetrySignalBatch batch,
  ) async {
    await _verifyAgent(session);
    for (final payload in batch.signals) {
      await ingestSignal(session, serviceId, payload);
    }
  }

  /// Record heartbeat from agent
  Future<void> heartbeat(
    Session session,
    int serviceId,
    TelemetryHeartbeat heartbeat,
  ) async {
    await _verifyAgent(session);

    // Update service status based on heartbeat
    final service = await Service.db.findById(session, serviceId);
    if (service != null) {
      service.status = ServiceStatus.OPERATIONAL;
      service.updatedAt = DateTime.now();
      await Service.db.updateRow(session, service);
    }

    // Store heartbeat record
    await TelemetryHeartbeat.db.insertRow(session, heartbeat);
  }

  /// Get signals for a service
  Future<List<HealthSignal>> getSignals(Session session, int serviceId) async {
    await _checkPermission(session, AppPermission.telemetry_view);
    
    return await HealthSignal.db.find(
      session,
      where: (t) => t.serviceId.equals(serviceId),
      orderBy: (t) => t.identifier,
    );
  }

  /// Get historical metric points for a signal
  Future<List<MetricPoint>> getHistory(
    Session session,
    int signalId, {
    int? limit,
    DateTime? after,
  }) async {
    await _checkPermission(session, AppPermission.telemetry_view);

    return await MetricPoint.db.find(
      session,
      where: (t) {
        var conditions = t.signalId.equals(signalId);
        if (after != null) {
          conditions = conditions & (t.timestamp > after);
        }
        return conditions;
      },
      orderBy: (t) => t.timestamp,
      orderDescending: true,
      limit: limit ?? 100,
    );
  }
}

