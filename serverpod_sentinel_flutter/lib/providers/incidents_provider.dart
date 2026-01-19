import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import 'client_provider.dart';

/// Fetch all incidents from the backend.
final incidentsProvider = FutureProvider<List<Incident>>((ref) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.incident.list();
  } catch (e) {
    print('Error fetching incidents: $e');
    rethrow;
  }
});

/// Fetch incidents by status.
final incidentsByStatusProvider =
    FutureProvider.family<List<Incident>, IncidentStatus?>((ref, status) async {
      try {
        final client = ref.watch(clientProvider);
        return await client.incident.list(status: status);
      } catch (e) {
        print('Error fetching incidents by status: $e');
        rethrow;
      }
    });

/// Active incidents (not resolved/closed).
final activeIncidentsProvider = FutureProvider<List<Incident>>((ref) async {
  try {
    final client = ref.watch(clientProvider);
    // Fetch all and filter - could be optimized with backend support
    final incidents = await client.incident.list();
    return incidents
        .where(
          (i) =>
              i.status != IncidentStatus.RESOLVED &&
              i.status != IncidentStatus.CLOSED,
        )
        .toList();
  } catch (e) {
    print('Error fetching active incidents: $e');
    rethrow;
  }
});

/// Fetch single incident by ID.
final incidentProvider = FutureProvider.family<Incident?, int>((ref, id) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.incident.get(id);
  } catch (e) {
    print('Error fetching incident $id: $e');
    rethrow;
  }
});

/// Incident statistics for dashboard.
final incidentStatsProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.incident.getStats();
  } catch (e) {
    print('Error fetching incident stats: $e');
    rethrow;
  }
});

/// Incident mutations.
class IncidentMutation extends StateNotifier<AsyncValue<Incident?>> {
  final Client _client;
  final Ref _ref;

  IncidentMutation(this._client, this._ref)
    : super(const AsyncValue.data(null));

  /// Create a new incident
  Future<Incident?> create(Incident incident) async {
    state = const AsyncValue.loading();
    try {
      final created = await _client.incident.create(incident);
      _ref.invalidate(incidentsProvider);
      _ref.invalidate(incidentStatsProvider);
      _ref.invalidate(activeIncidentsProvider);
      state = AsyncValue.data(created);
      return created;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  /// Update incident status
  Future<Incident?> updateStatus(int id, IncidentStatus status) async {
    state = const AsyncValue.loading();
    try {
      final updated = await _client.incident.updateStatus(id, status);
      _ref.invalidate(incidentsProvider);
      _ref.invalidate(incidentProvider(id));
      _ref.invalidate(incidentStatsProvider);
      _ref.invalidate(activeIncidentsProvider);
      state = AsyncValue.data(updated);
      return updated;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  /// Acknowledge an incident
  Future<Incident?> acknowledge(int id, int userId) async {
    state = const AsyncValue.loading();
    try {
      final updated = await _client.incident.acknowledge(id, userId);
      _ref.invalidate(incidentsProvider);
      _ref.invalidate(incidentProvider(id));
      _ref.invalidate(incidentStatsProvider);
      _ref.invalidate(activeIncidentsProvider);
      state = AsyncValue.data(updated);
      return updated;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  /// Acknowledge all open incidents
  Future<int> acknowledgeAll(int userId) async {
    state = const AsyncValue.loading();
    try {
      final count = await _client.incident.acknowledgeAll(userId);
      _ref.invalidate(incidentsProvider);
      _ref.invalidate(incidentStatsProvider);
      _ref.invalidate(activeIncidentsProvider);
      state = const AsyncValue.data(null);
      return count;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return 0;
    }
  }

  /// Close an incident
  Future<Incident?> close(int id) async {
    state = const AsyncValue.loading();
    try {
      final closed = await _client.incident.close(id);
      _ref.invalidate(incidentsProvider);
      _ref.invalidate(incidentProvider(id));
      _ref.invalidate(incidentStatsProvider);
      _ref.invalidate(activeIncidentsProvider);
      state = AsyncValue.data(closed);
      return closed;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  /// Assign incident commander
  Future<Incident?> assignCommander(int id, int commanderId) async {
    state = const AsyncValue.loading();
    try {
      final updated = await _client.incident.assignCommander(id, commanderId);
      _ref.invalidate(incidentProvider(id));
      state = AsyncValue.data(updated);
      return updated;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  /// Add timeline item to incident
  Future<IncidentTimelineItem?> addTimelineItem(
    IncidentTimelineItem item,
  ) async {
    state = const AsyncValue.loading();
    try {
      final created = await _client.incident.addTimelineItem(item);
      _ref.invalidate(incidentProvider(item.incidentId));
      state = const AsyncValue.data(null);
      return created;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  /// Delete an incident
  Future<bool> delete(int id) async {
    state = const AsyncValue.loading();
    try {
      final success = await _client.incident.delete(id);
      if (success) {
        _ref.invalidate(incidentsProvider);
        _ref.invalidate(incidentProvider(id));
        _ref.invalidate(incidentStatsProvider);
        _ref.invalidate(activeIncidentsProvider);
      }
      state = const AsyncValue.data(null);
      return success;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}

final incidentMutationProvider =
    StateNotifierProvider<IncidentMutation, AsyncValue<Incident?>>((ref) {
      final client = ref.watch(clientProvider);
      return IncidentMutation(client, ref);
    });

/// Listen to streaming updates for incidents
// Note: Using polling as fallback until streaming API is fully integrated
final incidentStreamProvider = StreamProvider<void>((ref) {
  // Poll every 5 seconds
  return Stream.periodic(const Duration(seconds: 5)).map((_) {
    // Invalidate providers to refetch data
    ref.invalidate(incidentsProvider);
    ref.invalidate(activeIncidentsProvider);
    ref.invalidate(incidentStatsProvider);
    return;
  });
});
