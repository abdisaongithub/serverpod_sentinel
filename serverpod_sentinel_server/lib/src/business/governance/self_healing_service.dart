import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/endpoints/playbook_endpoint.dart';

/// Service responsible for "Closed-loop" autonomous remediation.
class SelfHealingService {
  /// Evaluates if an incident should trigger automated remediation.
  static Future<void> evaluateIncident(Session session, Incident incident) async {
    // 1. Find applicable policies
    final policies = await RemediationPolicy.db.find(
      session,
      where: (t) => t.isEnabled.equals(true) & 
                    (t.serviceId.equals(incident.serviceId) | t.serviceId.equals(null)),
    );

    for (final policy in policies) {
      if (policy.autoExecute) {
        // Trigger Playbook
        await _executeRemediation(session, policy, incident);
      }
    }
  }

  static Future<void> _executeRemediation(
    Session session,
    RemediationPolicy policy,
    Incident incident,
  ) async {
    final playbookEndpoint = PlaybookEndpoint();
    
    // In a real scenario, we might want to check for cooldowns or retry counts first.
    
    try {
      final execution = await playbookEndpoint.execute(
        session,
        policy.playbookId,
        incident.id!,
        0, // System Initiator ID
      );

      // Add timeline item
      await IncidentTimelineItem.db.insertRow(
        session,
        IncidentTimelineItem(
          incidentId: incident.id!,
          type: TimelineItemType.PLAYBOOK_ACTION,
          content: 'Autonomous Remediation Triggered: ${policy.name}. Executing Playbook #${policy.playbookId}.',
          createdAt: DateTime.now(),
          authorId: 0,
        ),
      );

      session.log('SelfHealing: Triggered policy [${policy.name}] for incident [${incident.id}]');
    } catch (e) {
      session.log('SelfHealing Error: Failed to execute policy [${policy.name}] - $e', level: LogLevel.error);
    }
  }
}
