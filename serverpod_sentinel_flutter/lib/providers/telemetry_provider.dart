import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import 'client_provider.dart';
import 'streaming_provider.dart';

/// Fetch historical metrics for a specific signal
final metricHistoryProvider = FutureProvider.family<List<MetricPoint>, int>((ref, signalId) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.telemetry.getHistory(signalId);
  } catch (e) {
    print('Error fetching metric history: $e');
    rethrow;
  }
});

/// Fetch current signals for a service
final serviceSignalsProvider = FutureProvider.family<List<HealthSignal>, int>((ref, serviceId) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.telemetry.getSignals(serviceId);
  } catch (e) {
    print('Error fetching service signals: $e');
    rethrow;
  }
});

/// Real-time metrics for a specific signal
final liveSignalProvider = StreamProvider.family<StreamMetric, ({int serviceId, String identifier})>((ref, arg) {
  final streamingService = ref.watch(streamingServiceProvider);
  
  // Ensure we are subscribed to metrics for this service
  streamingService.subscribeToMetrics(arg.serviceId);
  
  return streamingService.metricStream.where((m) => 
    m.serviceId == arg.serviceId && m.name == arg.identifier
  );
});
