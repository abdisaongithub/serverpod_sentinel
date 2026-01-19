import 'package:serverpod/serverpod.dart';

enum NotificationChannel { email, slack, webhook }

abstract class NotificationService {
  Future<void> send({
    required Session session,
    required String title,
    required String message,
    required NotificationChannel channel,
    Map<String, dynamic>? metadata,
  });
}

class NotificationManager implements NotificationService {
  final List<NotificationProvider> _providers = [];

  void registerProvider(NotificationProvider provider) {
    _providers.add(provider);
  }

  @override
  Future<void> send({
    required Session session,
    required String title,
    required String message,
    required NotificationChannel channel,
    Map<String, dynamic>? metadata,
  }) async {
    for (final provider in _providers) {
      if (provider.supports(channel)) {
        try {
          await provider.send(
            session: session,
            title: title,
            message: message,
            metadata: metadata,
          );
        } catch (e, stack) {
          session.log(
            'Notification failed: $e',
            level: LogLevel.error,
            stackTrace: stack,
          );
        }
      }
    }
  }
}

abstract class NotificationProvider {
  bool supports(NotificationChannel channel);

  Future<void> send({
    required Session session,
    required String title,
    required String message,
    Map<String, dynamic>? metadata,
  });
}
