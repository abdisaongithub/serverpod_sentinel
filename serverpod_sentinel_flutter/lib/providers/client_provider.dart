import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import '../services/serverpod_client.dart';

/// Provides the Serverpod client instance.
final clientProvider = Provider<Client>((ref) {
  return ServerpodClientSingleton.client;
});

/// Provides the session manager for authentication.
final sessionManagerProvider = Provider((ref) {
  return ServerpodClientSingleton.sessionManager;
});

/// Provides whether the user is currently authenticated.
final isAuthenticatedProvider = Provider<bool>((ref) {
  return ServerpodClientSingleton.isAuthenticated;
});
