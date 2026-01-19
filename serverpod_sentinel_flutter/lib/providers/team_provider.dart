import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import 'client_provider.dart';

/// Fetch all team members from the backend.
final teamMembersProvider = FutureProvider<List<TeamMember>>((ref) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.user.listTeamMembers();
  } catch (e) {
    print('Error fetching team members: $e');
    rethrow;
  }
});

/// Fetch current user (skipped if auth is bypassed).
final currentUserProvider = FutureProvider<TeamMember?>((ref) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.user.getCurrentUser();
  } catch (e) {
    print('Error fetching current user: $e');
    // Return null instead of throwing for auth bypass
    return null;
  }
});

/// Fetch single user by ID.
final userProvider = FutureProvider.family<TeamMember?, int>((ref, id) async {
  try {
    final client = ref.watch(clientProvider);
    return await client.user.get(id);
  } catch (e) {
    print('Error fetching user $id: $e');
    rethrow;
  }
});

/// User mutations.
class UserMutation extends StateNotifier<AsyncValue<OpsUser?>> {
  final Client _client;
  final Ref _ref;

  UserMutation(this._client, this._ref) : super(const AsyncValue.data(null));

  /// Update user profile
  Future<OpsUser?> update(OpsUser user) async {
    state = const AsyncValue.loading();
    try {
      final updated = await _client.user.update(user);
      _ref.invalidate(teamMembersProvider);
      if (user.id != null) {
        _ref.invalidate(userProvider(user.id!));
      }
      state = AsyncValue.data(updated);
      return updated;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  /// Assign a role to a user
  Future<UserRole?> assignRole(int userId, int roleId) async {
    state = const AsyncValue.loading();
    try {
      final userRole = await _client.user.assignRole(userId, roleId);
      _ref.invalidate(teamMembersProvider);
      _ref.invalidate(userProvider(userId));
      state = const AsyncValue.data(null);
      return userRole;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }

  /// Remove a role from a user
  Future<bool> removeRole(int userId, int roleId) async {
    state = const AsyncValue.loading();
    try {
      final success = await _client.user.removeRole(userId, roleId);
      if (success) {
        _ref.invalidate(teamMembersProvider);
        _ref.invalidate(userProvider(userId));
      }
      state = const AsyncValue.data(null);
      return success;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }
}

final userMutationProvider =
    StateNotifierProvider<UserMutation, AsyncValue<OpsUser?>>((ref) {
      final client = ref.watch(clientProvider);
      return UserMutation(client, ref);
    });
