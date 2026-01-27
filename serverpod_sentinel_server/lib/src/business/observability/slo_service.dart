import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

/// Service to calculate Service Level Objectives (SLOs) and SLIs.
class SloService {
  /// Calculates availability SLI for a service over a period.
  /// Availability = (Healthy Metrics / Total Metrics) * 100
  static Future<Map<String, dynamic>> calculateAvailability(
    Session session,
    int serviceId,
    Duration period,
  ) async {
    final startTime = DateTime.now().subtract(period);
    
    final signals = await HealthSignal.db.find(
      session,
      where: (t) => t.serviceId.equals(serviceId),
    );

    int totalPoints = 0;
    int healthyPoints = 0;

    for (final signal in signals) {
      final points = await MetricPoint.db.find(
        session,
        where: (t) => t.signalId.equals(signal.id!) & (t.timestamp > startTime),
      );

      // Simple heuristic: if signal was healthy at that point.
      // Since MetricPoint doesn't store isHealthy, we rely on the threshold rule if it exists.
      final rule = await Rule.db.findFirstRow(
        session,
        where: (t) => t.signalId.equals(signal.id!),
      );

      for (final p in points) {
        totalPoints++;
        if (rule != null) {
          if (!_isViolating(p.value, rule.condition)) {
            healthyPoints++;
          }
        } else {
          // If no rule, assume healthy for now
          healthyPoints++;
        }
      }
    }

    final availability = totalPoints > 0 ? (healthyPoints / totalPoints) * 100 : 100.0;
    
    return {
      'serviceId': serviceId,
      'sliName': 'Availability',
      'value': availability,
      'period': period.inDays,
      'totalDataPoints': totalPoints,
      'healthyDataPoints': healthyPoints,
      'errorBudgetRemaining': availability - 99.9, // Target 99.9%
    };
  }

  static bool _isViolating(double? value, String condition) {
    if (value == null) return true;
    try {
      // Basic parser for "var > threshold"
      final parts = condition.split(' ');
      if (parts.length < 3) return false;
      final threshold = double.parse(parts[2]);
      final op = parts[1];

      if (op == '>') return value > threshold;
      if (op == '<') return value < threshold;
      if (op == '>=') return value >= threshold;
      if (op == '<=') return value <= threshold;
      if (op == '==') return value == threshold;
      
      return false;
    } catch (e) {
      return false;
    }
  }
}
