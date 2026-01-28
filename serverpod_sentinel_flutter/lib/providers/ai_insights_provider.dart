import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import 'client_provider.dart';

/// Fetch AI insights from the backend.
final aiInsightsProvider = FutureProvider<List<AiInsight>>((ref) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.aiInsights.getInsights();
  } catch (e) {
    print('Error fetching AI insights: $e');
    rethrow;
  }
});

/// Fetch AI insights for a specific service.
final aiInsightsForServiceProvider =
    FutureProvider.family<List<AiInsight>, int>((ref, serviceId) async {
      try {
        final client = ref.watch(clientProvider);
        return await client.aiInsights.getInsights(serviceId: serviceId);
      } catch (e) {
        print('Error fetching AI insights for service: $e');
        rethrow;
      }
    });

/// AI Analysis mutations.
class AiAnalysisMutation
    extends StateNotifier<AsyncValue<Map<String, dynamic>?>> {
  final Client _client;

  AiAnalysisMutation(this._client) : super(const AsyncValue.data(null));

  /// Analyze an incident
  Future<Map<String, dynamic>?> analyzeIncident(int incidentId) async {
    state = const AsyncValue.loading();
    try {
      final analysis = await _client.aiInsights.analyzeIncident(incidentId);
      state = AsyncValue.data(analysis);
      return analysis;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  /// Trigger anomaly scan for a service
  Future<List<AiInsight>> scanForAnomalies(int serviceId) async {
    state = const AsyncValue.loading();
    try {
      final insights = await _client.aiInsights.scanForAnomalies(serviceId);
      state = const AsyncValue.data(null);
      return insights;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return [];
    }
  }
}

final aiAnalysisMutationProvider =
    StateNotifierProvider<
      AiAnalysisMutation,
      AsyncValue<Map<String, dynamic>?>
    >((ref) {
      final client = ref.watch(clientProvider);
      return AiAnalysisMutation(client);
    });
