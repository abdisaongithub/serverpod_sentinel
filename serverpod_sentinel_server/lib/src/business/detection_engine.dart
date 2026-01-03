import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'rule_evaluator.dart';

class DetectionEngine {
  final RuleEvaluator _evaluator = RuleEvaluator();

  Future<void> run(Session session) async {
    // 1. Fetch active rules with their signals included
    final rules = await Rule.db.find(
      session,
      include: Rule.include(signal: HealthSignal.include()),
      where: (t) => t.enabled.equals(true),
    );

    for (var rule in rules) {
      if (rule.signal == null) continue;

      try {
        await _evaluateRule(session, rule, rule.signal!);
      } catch (e, stack) {
        print('Error evaluating rule ${rule.id}: $e');
        print(stack);
      }
    }
  }

  Future<void> _evaluateRule(
    Session session,
    Rule rule,
    HealthSignal signal,
  ) async {
    // 3. Evaluate
    final isBreach = _evaluator.evaluate(rule, signal);

    // 4. Incident Management
    if (isBreach) {
      await _handleBreach(session, rule, signal);
    }
  }

  Future<void> _handleBreach(
    Session session,
    Rule rule,
    HealthSignal signal,
  ) async {
    // Check for OPEN incident for this Rule + Service
    final existingIncident = await Incident.db.findFirstRow(
      session,
      where: (t) =>
          t.ruleId.equals(rule.id) &
          t.serviceId.equals(rule.serviceId) &
          t.status.notEquals(IncidentStatus.RESOLVED) &
          t.status.notEquals(IncidentStatus.CLOSED),
    );

    if (existingIncident != null) {
      // Logic for existing incident
    } else {
      print(
        'Creating new Incident for Rule ${rule.id} on Service ${rule.serviceId}',
      );

      final newIncident = Incident(
        title: 'Rule Breach: ${rule.name}',
        summary:
            'Signal ${signal.identifier} value ${signal.currentValue} breached rule.',
        serviceId: rule.serviceId,
        ruleId: rule.id!,
        status: IncidentStatus.OPEN,
        severity:
            IncidentSeverity.HIGH, // Should parse from rule config defaults
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
        commanderId: rule.service?.ownerId ?? 0, // Default to service owner
        startedAt: DateTime.now(),
      );

      await Incident.db.insertRow(session, newIncident);

      // Add initial timeline item
      final timelineItem = IncidentTimelineItem(
        incidentId: newIncident.id!,
        type: TimelineItemType.SYSTEM_ALERT,
        content: 'Incident automatically created by Detection Engine.',
        createdAt: DateTime.now(),
        authorId: 0,
      );
      await IncidentTimelineItem.db.insertRow(session, timelineItem);
    }
  }
}
