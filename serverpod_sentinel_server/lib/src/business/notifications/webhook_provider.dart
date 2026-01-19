import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';
import 'notification_service.dart';

class WebhookProvider extends NotificationProvider {
  @override
  bool supports(NotificationChannel channel) =>
      channel == NotificationChannel.webhook;

  @override
  Future<void> send({
    required Session session,
    required String title,
    required String message,
    Map<String, dynamic>? metadata,
  }) async {
    final webhookUrl = metadata?['webhookUrl'] as String?;
    if (webhookUrl == null) {
      throw Exception('webhookUrl required in metadata');
    }

    final payload = {
      'title': title,
      'message': message,
      'timestamp': DateTime.now().toIso8601String(),
      ...?metadata?['extra'] as Map<String, dynamic>?,
    };

    final response = await http.post(
      Uri.parse(webhookUrl),
      headers: {
        'Content-Type': 'application/json',
        ...?metadata?['headers'] as Map<String, String>?,
      },
      body: jsonEncode(payload),
    );

    if (response.statusCode >= 400) {
      throw Exception(
        'Webhook failed: ${response.statusCode} - ${response.body}',
      );
    }
  }
}
