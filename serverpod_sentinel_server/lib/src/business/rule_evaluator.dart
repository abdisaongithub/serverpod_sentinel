import 'dart:convert';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

class RuleEvaluator {
  /// Evaluates a rule against a health signal.
  /// Returns true if the rule condition is MET (breached).
  bool evaluate(Rule rule, HealthSignal signal) {
    try {
      final config = parseConfig(rule.condition);
      final condition = config['condition'];

      if (condition == null) return false;

      // Check if this rule applies to this signal
      // In a real system, we might query by signal identifier specifically,
      // but here we verify match.
      // Assumes Rule -> one signal identifier mapping or similar logic.
      // For now, we assume the caller has matched the signal to the rule.

      final operator = condition['operator'];
      final threshold = condition['value'];

      if (operator == null || threshold == null) return false;

      // Values are usually double for metrics
      final signalValue = signal.currentValue;
      if (signalValue == null) return false;

      switch (operator) {
        case 'GREATER_THAN':
          return signalValue > (threshold as num);
        case 'LESS_THAN':
          return signalValue < (threshold as num);
        case 'EQUALS':
          return signalValue == (threshold as num);
        case 'NOT_EQUALS':
          return signalValue != (threshold as num);
        default:
          return false;
      }
    } catch (e) {
      print('Error evaluating rule ${rule.id}: $e');
      return false;
    }
  }

  Map<String, dynamic> parseConfig(String jsonConfig) {
    return jsonDecode(jsonConfig);
  }
}
