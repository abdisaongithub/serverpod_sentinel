import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';

class NotificationPreferencesEndpoint extends Endpoint {
  /// Get notification preferences for a user
  Future<List<NotificationPreference>> getForUser(
    Session session,
    int userId,
  ) async {
    return await NotificationPreference.db.find(
      session,
      where: (t) => t.userId.equals(userId),
      orderBy: (t) => t.channel,
    );
  }

  /// Get or create a preference for a user and channel
  Future<NotificationPreference> getOrCreate(
    Session session,
    int userId,
    String channel,
  ) async {
    var pref = await NotificationPreference.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId) & t.channel.equals(channel),
    );

    if (pref == null) {
      pref = NotificationPreference(
        userId: userId,
        channel: channel,
        enabled: true,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      pref = await NotificationPreference.db.insertRow(session, pref);
    }

    return pref;
  }

  /// Update notification preference
  Future<NotificationPreference> update(
    Session session,
    NotificationPreference preference,
  ) async {
    preference.updatedAt = DateTime.now();
    return await NotificationPreference.db.updateRow(session, preference);
  }

  /// Toggle a preference enabled/disabled
  Future<NotificationPreference> toggleEnabled(
    Session session,
    int userId,
    String channel,
    bool enabled,
  ) async {
    var pref = await NotificationPreference.db.findFirstRow(
      session,
      where: (t) => t.userId.equals(userId) & t.channel.equals(channel),
    );

    if (pref == null) {
      pref = NotificationPreference(
        userId: userId,
        channel: channel,
        enabled: enabled,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );
      return await NotificationPreference.db.insertRow(session, pref);
    }

    pref.enabled = enabled;
    pref.updatedAt = DateTime.now();
    return await NotificationPreference.db.updateRow(session, pref);
  }

  /// Send test notification
  Future<Map<String, dynamic>> testNotification(
    Session session,
    int userId,
    String channel,
  ) async {
    // TODO: Implement actual notification sending based on channel
    return {
      'success': true,
      'message': 'Test notification sent to $channel',
      'sentAt': DateTime.now().toIso8601String(),
    };
  }

  /// Get all available notification channels
  Future<List<String>> getAvailableChannels(Session session) async {
    return ['email', 'slack', 'sms', 'push', 'webhook'];
  }
}
