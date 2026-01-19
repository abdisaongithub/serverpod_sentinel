import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import 'client_provider.dart';

/// Fetch all rules from the backend.
final rulesProvider = FutureProvider<List<Rule>>((ref) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.rule.list();
  } catch (e) {
    print('Error fetching rules: $e');
    rethrow;
  }
});

/// Fetch rules for a specific service.
final rulesForServiceProvider = FutureProvider.family<List<Rule>, int>((
  ref,
  serviceId,
) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.rule.listForService(serviceId);
  } catch (e) {
    print('Error fetching rules for service $serviceId: $e');
    rethrow;
  }
});

/// Fetch single rule by ID.
final ruleProvider = FutureProvider.family<Rule?, int>((ref, id) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.rule.get(id);
  } catch (e) {
    print('Error fetching rule $id: $e');
    rethrow;
  }
});

/// Rule mutations.
class RuleMutation extends StateNotifier<AsyncValue<Rule?>> {
  final Client _client;
  final Ref _ref;

  RuleMutation(this._client, this._ref) : super(const AsyncValue.data(null));

  /// Create a new rule
  Future<Rule?> create(Rule rule) async {
    state = const AsyncValue.loading();
    try {
      final created = await _client.rule.create(rule);
      _ref.invalidate(rulesProvider);
      _ref.invalidate(rulesForServiceProvider(rule.serviceId));
      state = AsyncValue.data(created);
      return created;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  /// Update an existing rule
  Future<Rule?> update(Rule rule) async {
    state = const AsyncValue.loading();
    try {
      final updated = await _client.rule.update(rule);
      _ref.invalidate(rulesProvider);
      if (rule.id != null) {
        _ref.invalidate(ruleProvider(rule.id!));
      }
      _ref.invalidate(rulesForServiceProvider(rule.serviceId));
      state = AsyncValue.data(updated);
      return updated;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  /// Toggle rule enabled/disabled
  Future<Rule?> toggleEnabled(int id, bool enabled) async {
    state = const AsyncValue.loading();
    try {
      final updated = await _client.rule.toggleEnabled(id, enabled);
      _ref.invalidate(rulesProvider);
      _ref.invalidate(ruleProvider(id));
      state = AsyncValue.data(updated);
      return updated;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  /// Delete a rule
  Future<bool> delete(int id) async {
    state = const AsyncValue.loading();
    try {
      final success = await _client.rule.delete(id);
      if (success) {
        _ref.invalidate(rulesProvider);
        _ref.invalidate(ruleProvider(id));
      }
      state = const AsyncValue.data(null);
      return success;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}

final ruleMutationProvider =
    StateNotifierProvider<RuleMutation, AsyncValue<Rule?>>((ref) {
      final client = ref.watch(clientProvider);
      return RuleMutation(client, ref);
    });
