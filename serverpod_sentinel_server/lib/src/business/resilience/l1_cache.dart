import 'package:serverpod/serverpod.dart';

/// L1 (In-Memory) Caching Service for extreme low-latency access to static data.
/// Complements the distributed L2 cache.
class L1Cache {
  /// Wraps a fetcher with in-memory caching.
  /// Suitable for configuration data that rarely changes.
  static Future<T?> wrap<T extends SerializableModel>(
    Session session,
    String key,
    Duration lifetime,
    Future<T?> Function() fetcher,
  ) async {
    // Try local cache first
    final localCached = await session.caches.local.get<T>(key);
    if (localCached != null) return localCached;

    // Fetch from source (L2 or DB)
    final data = await fetcher();

    // Store in local cache
    if (data != null) {
      await session.caches.local.put(
        key,
        data,
        lifetime: lifetime,
      );
    }

    return data;
  }

  /// Invalidates a key in the local cache.
  static Future<void> invalidate(Session session, String key) async {
    await session.caches.local.invalidateKey(key);
  }
}
