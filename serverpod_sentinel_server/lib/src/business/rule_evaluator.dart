import 'dart:convert';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

class RuleEvaluator {
  /// Evaluates a rule against a health signal.
  /// Returns true if the rule condition is MET (breached).
  bool evaluate(Rule rule, HealthSignal signal) {
    try {
      final config = parseConfig(rule.condition);

      // Removed nested 'condition' check to support flat JSON
      final operator = config['operator'];
      final threshold = config['value'];

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
