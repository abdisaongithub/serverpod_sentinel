import 'dart:async';
import 'package:serverpod/serverpod.dart';

enum CircuitState { closed, open, halfOpen }

/// Circuit Breaker to prevent cascading failures when calling external integrations.
class CircuitBreaker {
  final String identifier;
  final int failureThreshold;
  final Duration resetTimeout;
  
  int _failureCount = 0;
  CircuitState _state = CircuitState.closed;
  DateTime? _lastFailureTime;

  CircuitBreaker({
    required this.identifier,
    this.failureThreshold = 5,
    this.resetTimeout = const Duration(minutes: 1),
  });

  Future<T> execute<T>(Future<T> Function() action) async {
    if (_state == CircuitState.open) {
      if (DateTime.now().difference(_lastFailureTime!) > resetTimeout) {
        _state = CircuitState.halfOpen;
      } else {
        throw Exception('Circuit breaker [$identifier] is OPEN. Request rejected.');
      }
    }

    try {
      final result = await action();
      _onSuccess();
      return result;
    } catch (e) {
      _onFailure();
      rethrow;
    }
  }

  void _onSuccess() {
    _failureCount = 0;
    _state = CircuitState.closed;
  }

  void _onFailure() {
    _failureCount++;
    _lastFailureTime = DateTime.now();
    if (_failureCount >= failureThreshold) {
      _state = CircuitState.open;
    }
  }

  CircuitState get state => _state;
}

/// Registry to manage multiple circuit breakers.
class CircuitBreakerRegistry {
  static final Map<String, CircuitBreaker> _breakers = {};

  static CircuitBreaker get(String identifier) {
    return _breakers.putIfAbsent(
      identifier,
      () => CircuitBreaker(identifier: identifier),
    );
  }
}
