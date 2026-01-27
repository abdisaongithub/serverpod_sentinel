import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:crypto/crypto.dart';

/// Service for dispatching outgoing webhooks.
class WebhookService {
  /// Triggers webhooks for a specific event.
  static Future<void> trigger({
    required Session session,
    required String event,
    required Map<String, dynamic> payload,
  }) async {
    final webhooks = await OutgoingWebhook.db.find(
      session,
      where: (t) => t.isEnabled.equals(true),
    );

    for (final webhook in webhooks) {
      if (webhook.events.contains(event) || webhook.events.contains('*')) {
        // Run in background to not block the main request
        _sendWebhook(session, webhook, event, payload);
      }
    }
  }

  static Future<void> _sendWebhook(
    Session session,
    OutgoingWebhook webhook,
    String event,
    Map<String, dynamic> payload,
  ) async {
    final body = jsonEncode({
      'event': event,
      'timestamp': DateTime.now().toIso8601String(),
      'data': payload,
    });

    final headers = {
      'Content-Type': 'application/json',
      'X-Sentinel-Event': event,
      'X-Sentinel-Delivery': Uuid().v4(),
    };

    // Add signature if secret is provided
    if (webhook.secret != null && webhook.secret!.isNotEmpty) {
      final hmac = Hmac(sha256, utf8.encode(webhook.secret!));
      final signature = hmac.convert(utf8.encode(body));
      headers['X-Sentinel-Signature'] = signature.toString();
    }

    try {
      final response = await http.post(
        Uri.parse(webhook.url),
        headers: headers,
        body: body,
      ).timeout(const Duration(seconds: 10));

      webhook.lastTriggeredAt = DateTime.now();
      webhook.lastResponseCode = response.statusCode;
      await OutgoingWebhook.db.updateRow(session, webhook);
    } catch (e) {
      session.log('Webhook failed: ${webhook.url} - $e', level: LogLevel.error);
    }
  }
}
