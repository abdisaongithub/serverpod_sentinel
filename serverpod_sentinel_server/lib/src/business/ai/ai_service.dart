import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/endpoints/system_settings_endpoint.dart';

/// Service to interact with AI providers (OpenAI, Gemini).
class AiService {
  /// Analyzes an incident using an LLM.
  static Future<Map<String, dynamic>> analyzeIncident({
    required Session session,
    required Incident incident,
    required List<AuditLog> auditLogs,
    required List<MetricPoint> metrics,
  }) async {
    final apiKey = await _getApiKey(session);
    if (apiKey == null || apiKey == 'sk-xxxxxxxx') {
      return {'error': 'AI provider not configured (API key missing)'};
    }

    final context = _buildContext(incident, auditLogs, metrics);
    final prompt = '''
You are an expert SRE (Site Reliability Engineer). Analyze the following incident and provide a structured JSON response.
Incident: ${incident.title}
Summary: ${incident.summary}
Service: ${incident.service?.name}
Severity: ${incident.severity.name}

Recent Changes (Audit Logs):
${context['auditLogs']}

Recent Metrics:
${context['metrics']}

Return a JSON object with:
- probableRootCause (string)
- factors (list of strings)
- recommendations (list of objects with 'action', 'priority', 'rationale')
- impact (object with 'description')
''';

    try {
      // Logic for OpenAI API call (simplified)
      final response = await http.post(
        Uri.parse('https://api.openai.com/v1/chat/completions'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $apiKey',
        },
        body: jsonEncode({
          'model': 'gpt-4o',
          'messages': [
            {'role': 'system', 'content': 'You are a professional incident responder.'},
            {'role': 'user', 'content': prompt}
          ],
          'response_format': {'type': 'json_object'},
        }),
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        final content = data['choices'][0]['message']['content'];
        return jsonDecode(content);
      } else {
        session.log('AI API Error: ${response.body}', level: LogLevel.error);
        return {'error': 'AI API returned status ${response.statusCode}'};
      }
    } catch (e) {
      session.log('AI Service Error: $e', level: LogLevel.error);
      return {'error': 'Failed to reach AI provider'};
    }
  }

  static Future<String?> _getApiKey(Session session) async {
    // Use the endpoint logic to get the decrypted key
    final settings = SystemSettingsEndpoint();
    final keySetting = await settings.getByKey(session, 'openai_api_key');
    return keySetting?.value;
  }

  static Map<String, String> _buildContext(
    Incident incident,
    List<AuditLog> auditLogs,
    List<MetricPoint> metrics,
  ) {
    final logsStr = auditLogs.map((l) => '- ${l.action} on ${l.entityType} (ID: ${l.entityId}) at ${l.createdAt}').join('\n');
    final metricsStr = metrics.take(20).map((m) => '${m.timestamp.toIso8601String()}: ${m.value}').join(', ');
    
    return {
      'auditLogs': logsStr.isEmpty ? 'No recent changes recorded.' : logsStr,
      'metrics': metricsStr.isEmpty ? 'No recent metrics available.' : metricsStr,
    };
  }
}
