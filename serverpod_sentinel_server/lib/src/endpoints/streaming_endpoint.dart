import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

/// Enhanced Streaming Endpoint
///
/// Handles real-time streaming for:
/// - Global service updates
/// - Incident rooms (per-incident collaboration)
/// - Playbook execution progress
/// - Service metrics (real-time charts)
/// - Service logs (live log streaming)
/// - AI insights (anomaly detection, predictions)
/// - Alerts (real-time notifications)
class StreamingEndpoint extends Endpoint {
  @override
  Future<void> streamOpened(StreamingSession session) async {
    print('Stream opened: ${session.sessionId}');
  }

  @override
  Future<void> streamClosed(StreamingSession session) async {
    print('Stream closed: ${session.sessionId}');
  }

  @override
  Future<void> handleStreamMessage(
    StreamingSession session,
    SerializableModel message,
  ) async {
    if (message is StreamSubscription) {
      await _handleSubscription(session, message);
    }
  }

  Future<void> _handleSubscription(
    StreamingSession session,
    StreamSubscription sub,
  ) async {
    String? channel;
    switch (sub.type) {
      case StreamSubscriptionType.GLOBAL_SERVICE_UPDATES:
        channel = 'global-service-updates';
        break;
      case StreamSubscriptionType.INCIDENT_ROOM:
        if (sub.targetId != null) {
          channel = 'incident-room-${sub.targetId}';
        }
        break;
      case StreamSubscriptionType.PLAYBOOK_EXECUTION:
        if (sub.targetId != null) {
          channel = 'playbook-execution-${sub.targetId}';
        }
        break;
      case StreamSubscriptionType.SERVICE_METRICS:
        if (sub.targetId != null) {
          channel = 'service-metrics-${sub.targetId}';
        } else {
          channel = 'service-metrics-global';
        }
        break;
      case StreamSubscriptionType.SERVICE_LOGS:
        if (sub.targetId != null) {
          channel = 'service-logs-${sub.targetId}';
        } else {
          channel = 'service-logs-global';
        }
        break;
      case StreamSubscriptionType.AI_INSIGHTS:
        if (sub.targetId != null) {
          channel = 'ai-insights-${sub.targetId}';
        } else {
          channel = 'ai-insights-global';
        }
        break;
      case StreamSubscriptionType.ALERTS:
        channel = 'alerts-global';
        break;
    }

    if (channel != null) {
      print('Session ${session.sessionId} subscribing to $channel');
      session.messages.addListener(channel, (msg) {
        sendStreamMessage(session, msg);
      });
    }
  }
}

/// Helper class for broadcasting stream messages
class StreamBroadcaster {
  /// Broadcast a metric update to subscribers
  static Future<void> broadcastMetric(
    Session session,
    int serviceId,
    StreamMetric metric,
  ) async {
    // Broadcast to service-specific channel
    await session.messages.postMessage(
      'service-metrics-$serviceId',
      metric,
    );
    // Also broadcast to global metrics channel
    await session.messages.postMessage(
      'service-metrics-global',
      metric,
    );
  }

  /// Broadcast a log entry to subscribers
  static Future<void> broadcastLog(
    Session session,
    int serviceId,
    StreamLogEntry logEntry,
  ) async {
    await session.messages.postMessage(
      'service-logs-$serviceId',
      logEntry,
    );
    await session.messages.postMessage(
      'service-logs-global',
      logEntry,
    );
  }

  /// Broadcast an alert to subscribers
  static Future<void> broadcastAlert(
    Session session,
    StreamAlert alert,
  ) async {
    await session.messages.postMessage(
      'alerts-global',
      alert,
    );
    // If service-specific, also broadcast there
    if (alert.serviceId != null) {
      await session.messages.postMessage(
        'service-alerts-${alert.serviceId}',
        alert,
      );
    }
  }

  /// Broadcast an AI insight to subscribers
  static Future<void> broadcastAiInsight(
    Session session,
    AiInsight insight,
  ) async {
    // Broadcast to service-specific or global channel
    if (insight.serviceId != null) {
      await session.messages.postMessage(
        'ai-insights-${insight.serviceId}',
        insight,
      );
    }
    await session.messages.postMessage(
      'ai-insights-global',
      insight,
    );
  }

  /// Broadcast a service status change
  static Future<void> broadcastServiceUpdate(
    Session session,
    Service service,
    ServiceStatus previousStatus,
  ) async {
    await session.messages.postMessage(
      'global-service-updates',
      StreamServiceStatus(
        serviceId: service.id!,
        previousStatus: previousStatus,
        newStatus: service.status,
        timestamp: DateTime.now(),
      ),
    );
  }
}
