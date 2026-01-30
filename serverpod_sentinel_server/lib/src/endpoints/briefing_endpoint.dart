import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/business/ai/ai_service.dart';
import 'package:serverpod_sentinel_server/src/business/security/security_checks.dart';

/// Briefing Endpoint - Daily summary generation
class BriefingEndpoint extends Endpoint {
  /// Gets a daily briefing summary for the current user.
  Future<DailyBriefing> getDailyBriefing(Session session) async {
    await SecurityChecks.requireAuthentication(session);

    final since = DateTime.now().subtract(const Duration(hours: 24));

    // Gather data
    final incidents = await Incident.db.find(
      session,
      where: (t) => t.createdAt > since,
    );

    final auditLogs = await AuditLog.db.find(
      session,
      where: (t) => t.createdAt > since,
    );

    final alertCount = auditLogs.where((l) => l.action == 'ALERT').length;
    final automatedActionsCount = auditLogs
        .where((l) => l.action == 'EXECUTE')
        .length;

    // Find the most critical/recent issue
    String? topIssue;
    if (incidents.isNotEmpty) {
      final criticals = incidents.where(
        (i) => i.severity == IncidentSeverity.CRITICAL,
      );
      if (criticals.isNotEmpty) {
        topIssue = criticals.first.title;
      } else {
        topIssue = incidents.first.title;
      }
    }

    // Generate AI summary
    String summary;
    final summaryData =
        '''
In the last 24 hours:
- ${incidents.length} incidents occurred
- $alertCount alerts were triggered
- $automatedActionsCount automated actions were executed
- ${incidents.where((i) => i.status == IncidentStatus.RESOLVED || i.status == IncidentStatus.CLOSED).length} incidents were resolved
- ${incidents.where((i) => i.status == IncidentStatus.OPEN || i.status == IncidentStatus.ACKNOWLEDGED).length} incidents are still active

Top issue: ${topIssue ?? 'None'}
''';

    try {
      final aiResponse = await AiService.chat(
        session: session,
        messages: [
          {
            'role': 'system',
            'content':
                'You are Sentinel, a DevOps Butler. Summarize the following data in 2-3 friendly, professional sentences for a developer starting their day. Be concise and helpful.',
          },
          {'role': 'user', 'content': summaryData},
        ],
      );

      if (aiResponse['error'] == null) {
        summary =
            aiResponse['content'] ??
            _generateFallbackSummary(
              incidents.length,
              alertCount,
              automatedActionsCount,
            );
      } else {
        summary = _generateFallbackSummary(
          incidents.length,
          alertCount,
          automatedActionsCount,
        );
      }
    } catch (e) {
      summary = _generateFallbackSummary(
        incidents.length,
        alertCount,
        automatedActionsCount,
      );
    }

    return DailyBriefing(
      summary: summary,
      incidentCount: incidents.length,
      alertCount: alertCount,
      automatedActionsCount: automatedActionsCount,
      topIssue: topIssue,
      generatedAt: DateTime.now(),
    );
  }

  String _generateFallbackSummary(int incidents, int alerts, int actions) {
    if (incidents == 0 && alerts == 0) {
      return 'All clear! No incidents or alerts in the last 24 hours. Your systems are running smoothly.';
    }

    final parts = <String>[];
    if (incidents > 0) {
      parts.add('$incidents incident${incidents > 1 ? 's' : ''}');
    }
    if (alerts > 0) {
      parts.add('$alerts alert${alerts > 1 ? 's' : ''}');
    }
    if (actions > 0) {
      parts.add('$actions automated action${actions > 1 ? 's' : ''}');
    }

    return 'In the last 24 hours: ${parts.join(', ')}. Check the dashboard for details.';
  }
}
