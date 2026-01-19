import 'environment.dart';

/// Application configuration facade.
class AppConfig {
  AppConfig._();

  /// API base URL for the current environment.
  static String get apiUrl => EnvConfig.current.apiUrl;

  /// WebSocket URL for real-time streaming.
  static String get webSocketUrl => EnvConfig.current.wsUrl;

  /// Whether debug logging is enabled.
  static bool get enableLogging => EnvConfig.current.enableLogging;

  /// Current environment.
  static Environment get environment => EnvConfig.current.environment;

  /// Whether running in production mode.
  static bool get isProduction => environment == Environment.prod;
}
