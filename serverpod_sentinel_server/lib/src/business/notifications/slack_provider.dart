import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';
import 'notification_service.dart';

class SlackProvider extends NotificationProvider {
  final String webhookUrl;

  SlackProvider({required this.webhookUrl});

  @override
  bool supports(NotificationChannel channel) =>
      channel == NotificationChannel.slack;

  @override
  Future<void> send({
    required Session session,
    required String title,
    required String message,
    Map<String, dynamic>? metadata,
  }) async {
    final payload = {
      'blocks': [
        {
          'type': 'header',
          'text': {'type': 'plain_text', 'text': title},
        },
        {
          'type': 'section',
          'text': {'type': 'mrkdwn', 'text': message},
        },
      ],
    };

    final response = await http.post(
      Uri.parse(webhookUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(payload),
    );

    if (response.statusCode != 200) {
      throw Exception('Slack notification failed: ${response.body}');
    }
  }
}
