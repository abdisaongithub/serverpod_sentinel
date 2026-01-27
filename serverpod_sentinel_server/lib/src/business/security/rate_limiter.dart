import 'package:serverpod/serverpod.dart';
import 'package:serverpod_sentinel_server/src/generated/protocol.dart';
import 'package:serverpod_sentinel_server/src/exceptions/app_exceptions.dart';

/// Simple rate limiting service using Serverpod's global cache.
class RateLimiter {
  /// Limits requests per key (e.g. user ID or IP).
  /// Throws ValidationException if limit exceeded.
  static Future<void> checkLimit({
    required Session session,
    required String key,
    required int maxRequests,
    required Duration window,
  }) async {
    final cacheKey = 'ratelimit:$key';
    final current = await session.caches.global.get<RateLimitCount>(cacheKey);

    if (current != null && current.count >= maxRequests) {
      if (current.resetAt.isAfter(DateTime.now())) {
        throw ValidationException('Rate limit exceeded. Try again after ${current.resetAt}');
      }
    }

    // Increment count. If first request or expired, reset.
    if (current == null || current.resetAt.isBefore(DateTime.now())) {
      final newCount = RateLimitCount(
        count: 1,
        resetAt: DateTime.now().add(window),
      );
      await session.caches.global.put(
        cacheKey,
        newCount,
        lifetime: window,
      );
    } else {
      current.count += 1;
      await session.caches.global.put(
        cacheKey,
        current,
        // Keep original lifetime or set new one? 
        // We use the remaining time.
        lifetime: current.resetAt.difference(DateTime.now()),
      );
    }
  }
}
