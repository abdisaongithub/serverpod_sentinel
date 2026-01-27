import 'dart:math';
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

/// Service for detecting anomalies in telemetry data.
class AnomalyDetectionService {
  /// Simple Z-Score based anomaly detection.
  static Future<List<AiInsight>> scanForAnomalies(
    Session session,
    int serviceId, {
    double threshold = 3.0,
  }) async {
    final signals = await HealthSignal.db.find(
      session,
      where: (t) => t.serviceId.equals(serviceId),
    );

    final insights = <AiInsight>[];

    for (final signal in signals) {
      final history = await MetricPoint.db.find(
        session,
        where: (t) => t.signalId.equals(signal.id!),
        orderBy: (t) => t.timestamp,
        orderDescending: true,
        limit: 100,
      );

      final values = history.map((m) => m.value).whereType<double>().toList();
      if (values.length < 10) continue;

      final latestValue = signal.currentValue;
      if (latestValue == null) continue;

      final mean = values.reduce((a, b) => a + b) / values.length;
      final variance = values.map((v) => pow(v - mean, 2)).reduce((a, b) => a + b) / values.length;
      final stdDev = sqrt(variance);

      if (stdDev == 0) continue;

      final zScore = (latestValue - mean).abs() / stdDev;

      if (zScore > threshold) {
        insights.add(AiInsight(
          type: 'anomaly',
          title: 'Anomaly Detected: ${signal.name}',
          content: 'The current value ($latestValue) is ${zScore.toStringAsFixed(2)} SDs from the mean ($mean).',
          severity: zScore > threshold * 2 ? 'critical' : 'warning',
          serviceId: serviceId,
          confidence: min(0.99, 0.5 + (zScore / 10)),
          createdAt: DateTime.now(),
        ));
      }
    }

    if (insights.isNotEmpty) {
      await AiInsight.db.insert(session, insights);
    }

    return insights;
  }
}
