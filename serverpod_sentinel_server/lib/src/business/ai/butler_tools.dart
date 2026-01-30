import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/endpoints/playbook_endpoint.dart';

/// Defines the tools (functions) that the Butler AI can invoke.
/// These are structured as OpenAI function-calling schemas.
class ButlerTools {
  /// Returns the list of tool definitions for the LLM.
  static List<Map<String, dynamic>> getToolDefinitions() {
    return [
      {
        'type': 'function',
        'function': {
          'name': 'get_service_status',
          'description':
              'Get the current status and health of a monitored service by its name.',
          'parameters': {
            'type': 'object',
            'properties': {
              'service_name': {
                'type': 'string',
                'description': 'The name of the service to check.',
              },
            },
            'required': ['service_name'],
          },
        },
      },
      {
        'type': 'function',
        'function': {
          'name': 'list_all_services',
          'description':
              'List all monitored services and their current statuses.',
          'parameters': {
            'type': 'object',
            'properties': {},
          },
        },
      },
      {
        'type': 'function',
        'function': {
          'name': 'execute_playbook',
          'description':
              'Execute an automated remediation playbook by name for a specific incident.',
          'parameters': {
            'type': 'object',
            'properties': {
              'playbook_name': {
                'type': 'string',
                'description': 'The name of the playbook to execute.',
              },
              'incident_id': {
                'type': 'integer',
                'description': 'The ID of the incident to remediate.',
              },
            },
            'required': ['playbook_name', 'incident_id'],
          },
        },
      },
      {
        'type': 'function',
        'function': {
          'name': 'get_daily_summary',
          'description':
              'Get a summary of all incidents, alerts, and automated actions from the last 24 hours.',
          'parameters': {
            'type': 'object',
            'properties': {},
          },
        },
      },
      {
        'type': 'function',
        'function': {
          'name': 'get_active_incidents',
          'description':
              'Get a list of all currently active (unresolved) incidents.',
          'parameters': {
            'type': 'object',
            'properties': {},
          },
        },
      },
    ];
  }

  /// Executes a tool call from the LLM and returns the result as a JSON string.
  static Future<String> executeTool(
    Session session,
    String toolName,
    Map<String, dynamic> args,
  ) async {
    switch (toolName) {
      case 'get_service_status':
        return await _getServiceStatus(session, args['service_name'] as String);
      case 'list_all_services':
        return await _listAllServices(session);
      case 'execute_playbook':
        return await _executePlaybook(
          session,
          args['playbook_name'] as String,
          args['incident_id'] as int,
        );
      case 'get_daily_summary':
        return await _getDailySummary(session);
      case 'get_active_incidents':
        return await _getActiveIncidents(session);
      default:
        return '{"error": "Unknown tool: $toolName"}';
    }
  }

  static Future<String> _getServiceStatus(
    Session session,
    String serviceName,
  ) async {
    try {
      final services = await Service.db.find(
        session,
        where: (t) => t.name.ilike('%$serviceName%'),
        limit: 1,
      );
      if (services.isEmpty) {
        return '{"error": "Service not found", "searched_for": "$serviceName"}';
      }
      final s = services.first;
      return '''
{
  "id": ${s.id},
  "name": "${s.name}",
  "status": "${s.status.name}",
  "tier": "${s.tier.name}",
  "tags": ${s.tags}
}
''';
    } catch (e) {
      return '{"error": "Failed to fetch service: $e"}';
    }
  }

  static Future<String> _listAllServices(Session session) async {
    try {
      final services = await Service.db.find(session, limit: 20);
      final list = services
          .map(
            (s) =>
                '{"id": ${s.id}, "name": "${s.name}", "status": "${s.status.name}"}',
          )
          .join(', ');
      return '{"services": [$list], "count": ${services.length}}';
    } catch (e) {
      return '{"error": "Failed to list services: $e"}';
    }
  }

  static Future<String> _executePlaybook(
    Session session,
    String playbookName,
    int incidentId,
  ) async {
    try {
      // Find playbook by name
      final playbooks = await Playbook.db.find(
        session,
        where: (t) => t.name.ilike('%$playbookName%'),
        limit: 1,
      );
      if (playbooks.isEmpty) {
        return '{"error": "Playbook not found", "searched_for": "$playbookName"}';
      }

      final playbookEndpoint = PlaybookEndpoint();
      // Use a system initiator ID (0 or a dedicated bot user)
      final execution = await playbookEndpoint.execute(
        session,
        playbooks.first.id!,
        incidentId,
        0, // System/Butler initiator
      );
      return '''
{
  "status": "triggered",
  "execution_id": ${execution.id},
  "playbook_name": "${playbooks.first.name}",
  "incident_id": $incidentId
}
''';
    } catch (e) {
      return '{"error": "Failed to execute playbook: $e"}';
    }
  }

  static Future<String> _getDailySummary(Session session) async {
    try {
      final since = DateTime.now().subtract(const Duration(hours: 24));

      final incidents = await Incident.db.find(
        session,
        where: (t) => t.createdAt > since,
      );
      // Count alerts via AuditLog with ALERT action
      final alertAuditLogs = await AuditLog.db.find(
        session,
        where: (t) => t.createdAt > since,
      );

      return '''
{
  "period": "last_24_hours",
  "incidents_count": ${incidents.length},
  "alerts_count": ${alertAuditLogs.where((l) => l.action == 'ALERT').length},
  "automated_actions_count": ${alertAuditLogs.where((l) => l.action == 'EXECUTE').length},
  "critical_incidents": ${incidents.where((i) => i.severity == IncidentSeverity.CRITICAL).length}
}
''';
    } catch (e) {
      return '{"error": "Failed to get summary: $e"}';
    }
  }

  static Future<String> _getActiveIncidents(Session session) async {
    try {
      final incidents = await Incident.db.find(
        session,
        where: (t) =>
            t.status.equals(IncidentStatus.OPEN) |
            t.status.equals(IncidentStatus.ACKNOWLEDGED),
        orderBy: (t) => t.createdAt,
        orderDescending: true,
        limit: 10,
      );

      if (incidents.isEmpty) {
        return '{"message": "No active incidents. All systems appear to be operating normally."}';
      }

      final list = incidents
          .map(
            (i) =>
                '''
  {"id": ${i.id}, "title": "${i.title}", "severity": "${i.severity.name}", "status": "${i.status.name}"}
''',
          )
          .join(',');
      return '{"active_incidents": [$list], "count": ${incidents.length}}';
    } catch (e) {
      return '{"error": "Failed to get incidents: $e"}';
    }
  }
}
