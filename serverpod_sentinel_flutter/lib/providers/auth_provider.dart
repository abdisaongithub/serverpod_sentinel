import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'package:serverpod_client/serverpod_client.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import '../services/serverpod_client.dart';
import 'client_provider.dart';

/// Authentication status.
enum AuthStatus { initial, loading, authenticated, unauthenticated, error }

/// Authentication state.
class AuthState {
  final AuthStatus status;
  final String? error;

  const AuthState({this.status = AuthStatus.initial, this.error});

  AuthState copyWith({AuthStatus? status, String? error}) {
    return AuthState(status: status ?? this.status, error: error);
  }

  bool get isAuthenticated => status == AuthStatus.authenticated;
  bool get isLoading => status == AuthStatus.loading;
}

/// Authentication notifier managing sign-in/sign-out.
class AuthNotifier extends StateNotifier<AuthState> {
  final Client _client;

  AuthNotifier(this._client) : super(const AuthState());

  /// Check current authentication status.
  Future<void> checkAuthStatus() async {
    state = state.copyWith(status: AuthStatus.loading);

    try {
      if (ServerpodClientSingleton.isAuthenticated) {
        state = state.copyWith(status: AuthStatus.authenticated);
      } else {
        state = state.copyWith(status: AuthStatus.unauthenticated);
      }
    } catch (e) {
      state = state.copyWith(status: AuthStatus.error, error: e.toString());
    }
  }

  /// Sign in with email and password.
  Future<bool> signIn(String email, String password) async {
    state = state.copyWith(status: AuthStatus.loading, error: null);

    try {
      await _client.emailIdp.login(email: email, password: password);
      state = state.copyWith(status: AuthStatus.authenticated);
      return true;
    } catch (e) {
      state = state.copyWith(status: AuthStatus.error, error: e.toString());
      return false;
    }
  }

  /// Start account creation (sign-up).
  /// Returns the accountRequestId if successful.
  Future<UuidValue?> startRegistration(String email) async {
    state = state.copyWith(status: AuthStatus.loading, error: null);

    try {
      final id = await _client.emailIdp.startRegistration(email: email);
      state = state.copyWith(status: AuthStatus.unauthenticated);
      return id;
    } catch (e) {
      state = state.copyWith(status: AuthStatus.error, error: _formatError(e));
      return null;
    }
  }

  /// Verify registration code.
  /// Returns the registration token if successful.
  Future<String?> verifyRegistration(
    UuidValue accountRequestId,
    String code,
  ) async {
    state = state.copyWith(status: AuthStatus.loading, error: null);

    try {
      final token = await _client.emailIdp.verifyRegistrationCode(
        accountRequestId: accountRequestId,
        verificationCode: code,
      );
      return token;
    } catch (e) {
      state = state.copyWith(status: AuthStatus.error, error: _formatError(e));
      return null;
    }
  }

  /// Finish registration and sign in.
  Future<bool> finishRegistration(String token, String password) async {
    state = state.copyWith(status: AuthStatus.loading, error: null);

    try {
      await _client.emailIdp.finishRegistration(
        registrationToken: token,
        password: password,
      );
      // Automatically update state happens via session manager listener
      // But we can double check auth status
      await checkAuthStatus();
      return true;
    } catch (e) {
      state = state.copyWith(status: AuthStatus.error, error: _formatError(e));
      return false;
    }
  }

  /// Request password reset.
  Future<UuidValue?> startPasswordReset(String email) async {
    state = state.copyWith(status: AuthStatus.loading, error: null);
    try {
      final id = await _client.emailIdp.startPasswordReset(email: email);
      state = state.copyWith(status: AuthStatus.unauthenticated);
      return id;
    } catch (e) {
      state = state.copyWith(status: AuthStatus.error, error: _formatError(e));
      return null;
    }
  }

  /// Verify password reset code.
  Future<String?> verifyPasswordReset(UuidValue requestId, String code) async {
    state = state.copyWith(status: AuthStatus.loading, error: null);
    try {
      final token = await _client.emailIdp.verifyPasswordResetCode(
        passwordResetRequestId: requestId,
        verificationCode: code,
      );
      state = state.copyWith(status: AuthStatus.unauthenticated);
      return token;
    } catch (e) {
      state = state.copyWith(status: AuthStatus.error, error: _formatError(e));
      return null;
    }
  }

  /// Complete password reset.
  Future<bool> finishPasswordReset(String token, String newPassword) async {
    state = state.copyWith(status: AuthStatus.loading, error: null);
    try {
      await _client.emailIdp.finishPasswordReset(
        finishPasswordResetToken: token,
        newPassword: newPassword,
      );
      state = state.copyWith(status: AuthStatus.unauthenticated);
      return true;
    } catch (e) {
      state = state.copyWith(status: AuthStatus.error, error: _formatError(e));
      return false;
    }
  }

  /// Sign out the current user.
  Future<void> signOut() async {
    await (ServerpodClientSingleton.sessionManager as dynamic).signOut();
    state = const AuthState(status: AuthStatus.unauthenticated);
  }

  /// Clear any error state.
  void clearError() {
    state = state.copyWith(error: null);
  }

  String _formatError(dynamic e) {
    if (e.toString().contains('EmailAccountRequestException')) {
      return 'Invalid code or expired session.';
    }
    return e.toString().replaceAll('Exception: ', '');
  }
}

/// The main auth provider.
final authProvider = StateNotifierProvider<AuthNotifier, AuthState>((ref) {
  final client = ref.watch(clientProvider);
  return AuthNotifier(client);
});
