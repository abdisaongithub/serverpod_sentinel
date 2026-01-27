import 'package:serverpod/serverpod.dart';

/// Distributed Lock service using database advisory locks.
/// Ensures tasks only run on one server instance at a time.
class DistributedLock {
  /// Attempts to acquire a lock and run [action].
  /// Returns null if lock could not be acquired.
  static Future<T?> runLocked<T>(
    Session session,
    String lockKey,
    Future<T> Function() action,
  ) async {
    // Generate a stable integer ID for the key (Postgres advisory locks use ints)
    final lockId = lockKey.hashCode;
    
    final result = await session.db.unsafeQuery(
      'SELECT pg_try_advisory_lock($lockId)',
    );
    
    final acquired = result.first.first as bool;
    if (!acquired) return null;

    try {
      return await action();
    } finally {
      await session.db.unsafeQuery(
        'SELECT pg_advisory_unlock($lockId)',
      );
    }
  }
}
