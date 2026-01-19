import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import 'client_provider.dart';

/// Fetch all services from the backend.
final servicesProvider = FutureProvider<List<Service>>((ref) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.service.list();
  } catch (e) {
    // Log error and rethrow
    print('Error fetching services: $e');
    rethrow;
  }
});

/// Fetch services filtered by status.
final servicesByStatusProvider =
    FutureProvider.family<List<Service>, ServiceStatus?>((ref, status) async {
      try {
        final client = ref.watch(clientProvider);
        if (status == null) {
          return await client.service.list();
        }
        return await client.service.list(status: status);
      } catch (e) {
        print('Error fetching services by status: $e');
        rethrow;
      }
    });

/// Fetch single service by ID.
final serviceProvider = FutureProvider.family<Service?, int>((ref, id) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.service.get(id);
  } catch (e) {
    print('Error fetching service $id: $e');
    rethrow;
  }
});

/// Health summary for dashboard.
final healthSummaryProvider = FutureProvider<HealthSummary>((ref) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.service.getHealthSummary();
  } catch (e) {
    print('Error fetching health summary: $e');
    rethrow;
  }
});

/// System metrics for dashboard.
final systemMetricsProvider = FutureProvider<SystemMetrics>((ref) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.service.getSystemMetrics();
  } catch (e) {
    print('Error fetching system metrics: $e');
    rethrow;
  }
});

/// Service mutations.
class ServiceMutation extends StateNotifier<AsyncValue<Service?>> {
  final Client _client;
  final Ref _ref;

  ServiceMutation(this._client, this._ref) : super(const AsyncValue.data(null));

  Future<Service?> create(Service service) async {
    state = const AsyncValue.loading();
    try {
      final created = await _client.service.create(service);
      _ref.invalidate(servicesProvider);
      state = AsyncValue.data(created);
      return created;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  Future<Service?> update(Service service) async {
    state = const AsyncValue.loading();
    try {
      final updated = await _client.service.update(service);
      _ref.invalidate(servicesProvider);
      if (service.id != null) {
        _ref.invalidate(serviceProvider(service.id!));
      }
      state = AsyncValue.data(updated);
      return updated;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  Future<bool> delete(int id) async {
    state = const AsyncValue.loading();
    try {
      final success = await _client.service.delete(id);
      if (success) {
        _ref.invalidate(servicesProvider);
        _ref.invalidate(serviceProvider(id));
      }
      state = const AsyncValue.data(null);
      return success;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}

final serviceMutationProvider =
    StateNotifierProvider<ServiceMutation, AsyncValue<Service?>>((ref) {
      final client = ref.watch(clientProvider);
      return ServiceMutation(client, ref);
    });

/// Listen to streaming updates for services
// Note: Using polling as fallback until streaming API is fully integrated
final serviceStreamProvider = StreamProvider<void>((ref) {
  // Poll every 5 seconds
  return Stream.periodic(const Duration(seconds: 5)).map((_) {
    // Invalidate providers to refetch data
    ref.invalidate(servicesProvider);
    ref.invalidate(healthSummaryProvider);
    return;
  });
});
