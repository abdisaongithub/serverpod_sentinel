import 'package:serverpod/serverpod.dart';

/// Distributed L2 Caching Service to reduce database load on frequent queries.
class CacheService {
  static const String prefix = 'sentinel:cache:';

  /// Wraps a database fetch with a cache-aside pattern.
  static Future<T?> wrap<T extends SerializableModel>(
    Session session,
    String key,
    Duration lifetime,
    Future<T?> Function() fetcher,
  ) async {
    final cacheKey = '$prefix$key';
    
    // Try cache first
    final cached = await session.caches.global.get<T>(cacheKey);
    if (cached != null) return cached;

    // Fetch from DB
    final data = await fetcher();
    
    // Store in cache
    if (data != null) {
      await session.caches.global.put(
        cacheKey,
        data,
        lifetime: lifetime,
      );
    }
    
    return data;
  }

  /// Invalidates a specific cache key.
  static Future<void> invalidate(Session session, String key) async {
    await session.caches.global.invalidateKey('$prefix$key');
  }
}
