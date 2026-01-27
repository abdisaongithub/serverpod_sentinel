import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import 'client_provider.dart';

// ============ Environment Settings ============

/// Fetch all environments from the backend.
final environmentsProvider = FutureProvider<List<Environment>>((ref) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.environment.list();
  } catch (e) {
    print('Error fetching environments: $e');
    rethrow;
  }
});

/// Fetch the active environment.
final activeEnvironmentProvider = FutureProvider<Environment?>((ref) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.environment.getActive();
  } catch (e) {
    print('Error fetching active environment: $e');
    rethrow;
  }
});

// ============ Integrations ============

/// Fetch all integrations from the backend.
final integrationsProvider = FutureProvider<List<Integration>>((ref) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.integration.list();
  } catch (e) {
    print('Error fetching integrations: $e');
    rethrow;
  }
});

/// Fetch integrations by type.
final integrationsByTypeProvider =
    FutureProvider.family<List<Integration>, String>((ref, type) async {
      try {
        final client = ref.watch(clientProvider);
        return await client.integration.list(type: type);
      } catch (e) {
        print('Error fetching integrations by type: $e');
        rethrow;
      }
    });

// ============ Notification Preferences ============

/// Fetch notification preferences for a user.
final notificationPreferencesProvider =
    FutureProvider.family<List<NotificationPreference>, int>((
      ref,
      userId,
    ) async {
      try {
        final client = ref.watch(clientProvider);
        return await client.notificationPreferences.getForUser(userId);
      } catch (e) {
        print('Error fetching notification preferences: $e');
        rethrow;
      }
    });

/// Fetch available notification channels.
final notificationChannelsProvider = FutureProvider<List<String>>((ref) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.notificationPreferences.getAvailableChannels();
  } catch (e) {
    print('Error fetching notification channels: $e');
    rethrow;
  }
});

// ============ System Settings ============


/// Fetch all system settings.
final systemSettingsProvider = FutureProvider<List<SystemSetting>>((ref) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.systemSettings.list();
  } catch (e) {
    print('Error fetching system settings: $e');
    rethrow;
  }
});

/// Fetch system settings by category.
final systemSettingsByCategoryProvider =
    FutureProvider.family<List<SystemSetting>, String>((ref, category) async {
      try {
        final client = ref.watch(clientProvider);
        return await client.systemSettings.list(category: category);
      } catch (e) {
        print('Error fetching system settings by category: $e');
        rethrow;
      }
    });

/// Fetch public settings only.
final publicSettingsProvider = FutureProvider<List<SystemSetting>>((ref) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.systemSettings.getPublic();
  } catch (e) {
    print('Error fetching public settings: $e');
    rethrow;
  }
});

// ============ Settings Mutations ============

class SettingsMutation extends StateNotifier<AsyncValue<void>> {
  final Client _client;
  final Ref _ref;

  SettingsMutation(this._client, this._ref)
    : super(const AsyncValue.data(null));

  // Environment mutations
  Future<Environment?> createEnvironment(Environment env) async {
    state = const AsyncValue.loading();
    try {
      final created = await _client.environment.create(env);
      _ref.invalidate(environmentsProvider);
      state = const AsyncValue.data(null);
      return created;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  Future<Environment?> setActiveEnvironment(int id) async {
    state = const AsyncValue.loading();
    try {
      final active = await _client.environment.setActive(id);
      _ref.invalidate(environmentsProvider);
      _ref.invalidate(activeEnvironmentProvider);
      state = const AsyncValue.data(null);
      return active;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  Future<Environment?> updateEnvironment(Environment env) async {
    state = const AsyncValue.loading();
    try {
      final updated = await _client.environment.update(env);
      _ref.invalidate(environmentsProvider);
      _ref.invalidate(activeEnvironmentProvider);
      state = const AsyncValue.data(null);
      return updated;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  // Integration mutations
  Future<Integration?> createIntegration(Integration integration) async {
    state = const AsyncValue.loading();
    try {
      final created = await _client.integration.create(integration);
      _ref.invalidate(integrationsProvider);
      state = const AsyncValue.data(null);
      return created;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  Future<Integration?> toggleIntegration(int id, bool enabled) async {
    state = const AsyncValue.loading();
    try {
      final updated = await _client.integration.toggleEnabled(id, enabled);
      _ref.invalidate(integrationsProvider);
      state = const AsyncValue.data(null);
      return updated;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  Future<Map<String, dynamic>> testIntegration(int id) async {
    state = const AsyncValue.loading();
    try {
      final result = await _client.integration.testConnection(id);
      state = const AsyncValue.data(null);
      return result;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return {'success': false, 'error': e.toString()};
    }
  }

  // Notification preference mutations
  Future<NotificationPreference?> toggleNotificationChannel(
    int userId,
    String channel,
    bool enabled,
  ) async {
    state = const AsyncValue.loading();
    try {
      final updated = await _client.notificationPreferences.toggleEnabled(
        userId,
        channel,
        enabled,
      );
      _ref.invalidate(notificationPreferencesProvider(userId));
      state = const AsyncValue.data(null);
      return updated;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  // System setting mutations
  Future<SystemSetting?> upsertSetting(
    String key,
    String value, {
    String? description,
    String category = 'general',
  }) async {
    state = const AsyncValue.loading();
    try {
      final updated = await _client.systemSettings.upsert(
        key,
        value,
        description: description,
        category: category,
        isSecret: false,
      );
      _ref.invalidate(systemSettingsProvider);
      state = const AsyncValue.data(null);
      return updated;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }
}

final settingsMutationProvider =
    StateNotifierProvider<SettingsMutation, AsyncValue<void>>((ref) {
      final client = ref.watch(clientProvider);
      return SettingsMutation(client, ref);
    });
