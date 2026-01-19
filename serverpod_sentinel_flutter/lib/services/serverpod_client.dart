import 'package:serverpod_flutter/serverpod_flutter.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import '../config/app_config.dart';

/// Singleton wrapper for the Serverpod client and session manager.
class ServerpodClientSingleton {
  ServerpodClientSingleton._();

  static Client? _client;
  static SessionManager? _sessionManager;

  /// The Serverpod client instance.
  /// Throws if [initialize] has not been called.
  static Client get client {
    if (_client == null) {
      throw StateError('Client not initialized. Call initialize() first.');
    }
    return _client!;
  }

  /// The session manager for authentication.
  /// Throws if [initialize] has not been called.
  static SessionManager get sessionManager {
    if (_sessionManager == null) {
      throw StateError(
        'SessionManager not initialized. Call initialize() first.',
      );
    }
    return _sessionManager!;
  }

  /// Initialize the Serverpod client.
  /// Should be called once at app startup.
  static Future<void> initialize() async {
    // 1. Initialize Key Manager
    final keyManager = FlutterAuthenticationKeyManager();

    // 2. Initialize Client with key manager
    _client = Client(AppConfig.apiUrl, authenticationKeyManager: keyManager)
      ..connectivityMonitor = FlutterConnectivityMonitor();

    // 3. Initialize SessionManager with the client's auth module
    try {
      _sessionManager = SessionManager(caller: _client!.modules.auth);
      await _sessionManager!.initialize();
    } catch (e) {
      // Auth module may not be fully configured, but we're bypassing auth anyway
      if (AppConfig.enableLogging) {
        print('Warning: SessionManager initialization failed: $e');
      }
    }

    // Open streaming connection for real-time updates
    try {
      await _client!.openStreamingConnection();
    } catch (e) {
      // Streaming connection may fail if server is not available
      if (AppConfig.enableLogging) {
        print('Warning: Could not open streaming connection: $e');
      }
    }
  }

  /// Dispose of the client connection.
  static Future<void> dispose() async {
    await _client?.closeStreamingConnection();
    _client?.close();
    _client = null;
    _sessionManager = null;
  }

  /// Whether the user is currently authenticated.
  static bool get isAuthenticated => true; // Bypassed for development
}
