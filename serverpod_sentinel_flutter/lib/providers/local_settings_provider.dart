import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import '../../services/serverpod_client.dart';
import 'client_provider.dart';

class LocalSettingsState {
  final String alertSeverity;
  final bool quietHoursEnabled;
  final String quietHoursStart;
  final String quietHoursEnd;

  LocalSettingsState({
    this.alertSeverity = 'Critical Only',
    this.quietHoursEnabled = false,
    this.quietHoursStart = '22:00',
    this.quietHoursEnd = '07:00',
  });

  LocalSettingsState copyWith({
    String? alertSeverity,
    bool? quietHoursEnabled,
    String? quietHoursStart,
    String? quietHoursEnd,
  }) {
    return LocalSettingsState(
      alertSeverity: alertSeverity ?? this.alertSeverity,
      quietHoursEnabled: quietHoursEnabled ?? this.quietHoursEnabled,
      quietHoursStart: quietHoursStart ?? this.quietHoursStart,
      quietHoursEnd: quietHoursEnd ?? this.quietHoursEnd,
    );
  }

  Map<String, dynamic> toJson() => {
    'alertSeverity': alertSeverity,
    'quietHoursEnabled': quietHoursEnabled,
    'quietHoursStart': quietHoursStart,
    'quietHoursEnd': quietHoursEnd,
  };

  factory LocalSettingsState.fromJson(Map<String, dynamic> json) {
    return LocalSettingsState(
      alertSeverity: json['alertSeverity'] ?? 'Critical Only',
      quietHoursEnabled: json['quietHoursEnabled'] ?? false,
      quietHoursStart: json['quietHoursStart'] ?? '22:00',
      quietHoursEnd: json['quietHoursEnd'] ?? '07:00',
    );
  }
}

class LocalSettingsNotifier
    extends StateNotifier<AsyncValue<LocalSettingsState>> {
  final Client client;

  LocalSettingsNotifier(this.client) : super(const AsyncValue.loading()) {
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    try {
      // 1. Load Local
      final prefs = await SharedPreferences.getInstance();
      final severity = prefs.getString('alertSeverity') ?? 'Critical Only';
      final quietEnabled = prefs.getBool('quietHoursEnabled') ?? false;
      final quietStart = prefs.getString('quietHoursStart') ?? '22:00';
      final quietEnd = prefs.getString('quietHoursEnd') ?? '07:00';

      var newState = LocalSettingsState(
        alertSeverity: severity,
        quietHoursEnabled: quietEnabled,
        quietHoursStart: quietStart,
        quietHoursEnd: quietEnd,
      );

      // 2. Load Remote (if authenticated)
      if (ServerpodClientSingleton.sessionManager.isSignedIn) {
        try {
          final userId =
              ServerpodClientSingleton.sessionManager.signedInUser?.id;
          if (userId != null) {
            final remotePref = await client.notificationPreferences.getOrCreate(
              userId,
              'app_settings',
            );

            if (remotePref.settings != null &&
                remotePref.settings!.isNotEmpty) {
              final remoteJson = jsonDecode(remotePref.settings!);
              newState = LocalSettingsState.fromJson(remoteJson);
              // Update local cache to match remote
              await _saveToPrefs(newState);
            }
          }
        } catch (e) {
          print('Failed to sync settings from backend: $e');
        }
      }

      state = AsyncValue.data(newState);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> _saveToPrefs(LocalSettingsState s) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('alertSeverity', s.alertSeverity);
    await prefs.setBool('quietHoursEnabled', s.quietHoursEnabled);
    await prefs.setString('quietHoursStart', s.quietHoursStart);
    await prefs.setString('quietHoursEnd', s.quietHoursEnd);
  }

  Future<void> _syncToBackend(LocalSettingsState s) async {
    if (!ServerpodClientSingleton.sessionManager.isSignedIn) return;
    try {
      final userId = ServerpodClientSingleton.sessionManager.signedInUser?.id;
      if (userId == null) return;

      final pref = await client.notificationPreferences.getOrCreate(
        userId,
        'app_settings',
      );
      pref.settings = jsonEncode(s.toJson());
      await client.notificationPreferences.update(pref);
    } catch (e) {
      print('Failed to sync settings to backend: $e');
    }
  }

  Future<void> setAlertSeverity(String severity) async {
    if (state.value == null) return;
    final newState = state.value!.copyWith(alertSeverity: severity);
    state = AsyncValue.data(newState);
    await _saveToPrefs(newState);
    _syncToBackend(newState);
  }

  Future<void> setQuietHoursEnabled(bool enabled) async {
    if (state.value == null) return;
    final newState = state.value!.copyWith(quietHoursEnabled: enabled);
    state = AsyncValue.data(newState);
    await _saveToPrefs(newState);
    _syncToBackend(newState);
  }
}

final localSettingsProvider =
    StateNotifierProvider<
      LocalSettingsNotifier,
      AsyncValue<LocalSettingsState>
    >((ref) {
      final client = ref.watch(clientProvider);
      return LocalSettingsNotifier(client);
    });
