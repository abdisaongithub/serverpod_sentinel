import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import 'client_provider.dart';

/// Fetch recent alerts for live stream view
final alertsProvider = FutureProvider<List<StreamAlert>>((ref) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.alert.getRecent(limit: 20);
  } catch (e) {
    print('Error fetching alerts: $e');
    rethrow;
  }
});

/// Fetch alerts filtered by severity
final alertsBySeverityProvider =
    FutureProvider.family<List<StreamAlert>, String?>((ref, severity) async {
      try {
        final client = ref.watch(clientProvider);
        return await client.alert.getRecent(limit: 20, severity: severity);
      } catch (e) {
        print('Error fetching alerts by severity: $e');
        rethrow;
      }
    });

/// Stream provider for auto-refreshing alerts (polls every 5 seconds)
final alertsStreamProvider = StreamProvider<void>((ref) {
  return Stream.periodic(const Duration(seconds: 5)).map((_) {
    ref.invalidate(alertsProvider);
    return;
  });
});
