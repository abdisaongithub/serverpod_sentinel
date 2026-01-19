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

/// Available insight types.
final insightTypesProvider = FutureProvider<List<String>>((ref) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.aiInsights.getInsightTypes();
  } catch (e) {
    print('Error fetching insight types: $e');
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

  /// Get suggested actions for an incident
  Future<List<Map<String, dynamic>>> suggestActions(int incidentId) async {
    state = const AsyncValue.loading();
    try {
      final suggestions = await _client.aiInsights.suggestActions(incidentId);
      state = const AsyncValue.data(null);
      return suggestions;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return [];
    }
  }

  /// Get health prediction for a service
  Future<Map<String, dynamic>?> predictServiceHealth(int serviceId) async {
    state = const AsyncValue.loading();
    try {
      final prediction = await _client.aiInsights.predictServiceHealth(
        serviceId,
      );
      state = AsyncValue.data(prediction);
      return prediction;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
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
