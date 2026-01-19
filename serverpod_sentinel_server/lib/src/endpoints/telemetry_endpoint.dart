import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

class TelemetryEndpoint extends Endpoint {
  /// Ingest health signal from agent
  Future<void> ingestSignal(
    Session session,
    int serviceId,
    TelemetrySignalPayload payload,
  ) async {
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
      await HealthSignal.db.insertRow(session, signal);
    } else {
      signal.currentValue = payload.value;
      signal.isHealthy = payload.isHealthy;
      signal.lastCheckedAt = DateTime.now();
      signal.updatedAt = DateTime.now();
      await HealthSignal.db.updateRow(session, signal);
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
  }

  /// Ingest batch of signals
  Future<void> ingestBatch(
    Session session,
    int serviceId,
    TelemetrySignalBatch batch,
  ) async {
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
    // Update service status based on heartbeat
    final service = await Service.db.findById(session, serviceId);
    if (service != null) {
      service.status = ServiceStatus.OPERATIONAL;
      service.updatedAt = DateTime.now();
      await Service.db.updateRow(session, service);
    }

    // Store heartbeat record
    // Note: TelemetryHeartbeat protocol doesn't have serviceId field,
    // assuming it might be added or we just track it via service update above.
    // However, we can't insert it effectively without serviceId linkage if needed.
    // For now, we just insert as is since protocol matches.
    await TelemetryHeartbeat.db.insertRow(session, heartbeat);
  }

  /// Get signals for a service
  Future<List<HealthSignal>> getSignals(Session session, int serviceId) async {
    return await HealthSignal.db.find(
      session,
      where: (t) => t.serviceId.equals(serviceId),
      orderBy: (t) => t.identifier,
    );
  }
}
