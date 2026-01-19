import 'package:test/test.dart';
import 'package:serverpod_sentinel_server/src/business/rule_evaluator.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'dart:convert';

void main() {
  group('RuleEvaluator', () {
    final evaluator = RuleEvaluator();

    test('Should match EQUALS operator', () {
      final rule = Rule(
        serviceId: 1, // Required by generated code
        signalId: 1, // Required by generated code
        name: 'CPU Check',
        enabled: true,
        condition: jsonEncode({
          'operator': 'EQUALS',
          'value': 100.0,
        }),
        durationSeconds: 60,
        severity: IncidentSeverity.MEDIUM, // Was WARNING
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final signal = HealthSignal(
        serviceId: 1, // Required
        identifier: 'cpu',
        name: 'CPU',
        type: SignalType.METRIC,
        currentValue: 100.0,
        isHealthy: true, // Required
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(evaluator.evaluate(rule, signal), isTrue);
    });

    test('Should match GREATER_THAN operator', () {
      final rule = Rule(
        serviceId: 1,
        signalId: 1,
        name: 'High CPU',
        enabled: true,
        condition: jsonEncode({
          'operator': 'GREATER_THAN',
          'value': 90.0,
        }),
        durationSeconds: 60,
        severity: IncidentSeverity.CRITICAL,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final signal = HealthSignal(
        serviceId: 1,
        identifier: 'cpu',
        name: 'CPU',
        type: SignalType.METRIC,
        currentValue: 95.0,
        isHealthy: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(evaluator.evaluate(rule, signal), isTrue);
    });

    test('Should fail GREATER_THAN operator when value is lower', () {
      final rule = Rule(
        serviceId: 1,
        signalId: 1,
        name: 'High CPU',
        enabled: true,
        condition: jsonEncode({
          'operator': 'GREATER_THAN',
          'value': 90.0,
        }),
        durationSeconds: 60,
        severity: IncidentSeverity.CRITICAL,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final signal = HealthSignal(
        serviceId: 1,
        identifier: 'cpu',
        name: 'CPU',
        type: SignalType.METRIC,
        currentValue: 80.0,
        isHealthy: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      expect(evaluator.evaluate(rule, signal), isFalse);
    });
  });
}
