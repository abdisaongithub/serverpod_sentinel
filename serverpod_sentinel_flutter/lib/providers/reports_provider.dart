import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import 'client_provider.dart';

/// Fetch report snapshots from the backend.
final reportSnapshotsProvider = FutureProvider<List<ReportSnapshot>>((
  ref,
) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.report.listSnapshots();
  } catch (e) {
    print('Error fetching report snapshots: $e');
    rethrow;
  }
});

/// Fetch a single report snapshot.
final reportSnapshotProvider = FutureProvider.family<ReportSnapshot?, int>((
  ref,
  id,
) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.report.getSnapshot(id);
  } catch (e) {
    print('Error fetching report snapshot: $e');
    rethrow;
  }
});

/// Report generation mutations.
class ReportMutation extends StateNotifier<AsyncValue<Map<String, dynamic>?>> {
  final Client _client;
  final Ref _ref;

  ReportMutation(this._client, this._ref) : super(const AsyncValue.data(null));

  /// Generate an incident report
  Future<Map<String, dynamic>?> generateIncidentReport({
    required DateTime from,
    required DateTime to,
    List<int>? serviceIds,
  }) async {
    state = const AsyncValue.loading();
    try {
      final report = await _client.report.generateIncidentReport(
        from: from,
        to: to,
        serviceIds: serviceIds,
      );
      state = AsyncValue.data(report);
      return report;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  /// Generate a health report
  Future<Map<String, dynamic>?> generateHealthReport({
    List<int>? serviceIds,
  }) async {
    state = const AsyncValue.loading();
    try {
      final report = await _client.report.generateHealthReport(
        serviceIds: serviceIds,
      );
      state = AsyncValue.data(report);
      return report;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  /// Save a report snapshot
  Future<ReportSnapshot?> saveSnapshot(ReportSnapshot snapshot) async {
    state = const AsyncValue.loading();
    try {
      final saved = await _client.report.saveSnapshot(snapshot);
      _ref.invalidate(reportSnapshotsProvider);
      state = const AsyncValue.data(null);
      return saved;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  /// Delete a report snapshot
  Future<bool> deleteSnapshot(int id) async {
    state = const AsyncValue.loading();
    try {
      final success = await _client.report.deleteSnapshot(id);
      if (success) {
        _ref.invalidate(reportSnapshotsProvider);
      }
      state = const AsyncValue.data(null);
      return success;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}

final reportMutationProvider =
    StateNotifierProvider<ReportMutation, AsyncValue<Map<String, dynamic>?>>((
      ref,
    ) {
      final client = ref.watch(clientProvider);
      return ReportMutation(client, ref);
    });
