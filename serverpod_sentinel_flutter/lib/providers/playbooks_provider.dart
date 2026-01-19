import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import 'client_provider.dart';

/// Fetch all playbooks from the backend.
final playbooksProvider = FutureProvider<List<Playbook>>((ref) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.playbook.list();
  } catch (e) {
    print('Error fetching playbooks: $e');
    rethrow;
  }
});

/// Fetch single playbook by ID.
final playbookProvider = FutureProvider.family<Playbook?, int>((ref, id) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.playbook.get(id);
  } catch (e) {
    print('Error fetching playbook $id: $e');
    rethrow;
  }
});

/// Fetch playbook execution status.
final playbookExecutionProvider =
    FutureProvider.family<PlaybookExecution?, int>((ref, executionId) async {
      try {
        final client = ref.watch(clientProvider);
        return await client.playbook.getExecution(executionId);
      } catch (e) {
        print('Error fetching playbook execution $executionId: $e');
        rethrow;
      }
    });

/// Playbook mutations.
class PlaybookMutation extends StateNotifier<AsyncValue<Playbook?>> {
  final Client _client;
  final Ref _ref;

  PlaybookMutation(this._client, this._ref)
    : super(const AsyncValue.data(null));

  /// Create a new playbook
  Future<Playbook?> create(Playbook playbook) async {
    state = const AsyncValue.loading();
    try {
      final created = await _client.playbook.create(playbook);
      _ref.invalidate(playbooksProvider);
      state = AsyncValue.data(created);
      return created;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  /// Update an existing playbook
  Future<Playbook?> update(Playbook playbook) async {
    state = const AsyncValue.loading();
    try {
      final updated = await _client.playbook.update(playbook);
      _ref.invalidate(playbooksProvider);
      if (playbook.id != null) {
        _ref.invalidate(playbookProvider(playbook.id!));
      }
      state = AsyncValue.data(updated);
      return updated;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  /// Delete a playbook
  Future<bool> delete(int id) async {
    state = const AsyncValue.loading();
    try {
      final success = await _client.playbook.delete(id);
      if (success) {
        _ref.invalidate(playbooksProvider);
        _ref.invalidate(playbookProvider(id));
      }
      state = const AsyncValue.data(null);
      return success;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  /// Execute a playbook for an incident
  Future<PlaybookExecution?> execute(
    int playbookId,
    int incidentId,
    int initiatorId,
  ) async {
    state = const AsyncValue.loading();
    try {
      final execution = await _client.playbook.execute(
        playbookId,
        incidentId,
        initiatorId,
      );
      state = const AsyncValue.data(null);
      return execution;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }
}

final playbookMutationProvider =
    StateNotifierProvider<PlaybookMutation, AsyncValue<Playbook?>>((ref) {
      final client = ref.watch(clientProvider);
      return PlaybookMutation(client, ref);
    });
