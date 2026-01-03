import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

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
    }

    if (channel != null) {
      print('Session ${session.sessionId} subscribing to $channel');
      // session.messages is MessageCentral, widely available
      session.messages.addListener(channel, (msg) {
        // msg is SerializableEntity
        sendStreamMessage(session, msg);
      });
    }
  }
}
