import 'dart:async';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Connection status.
enum ConnectionStatus { online, offline }

/// Notifier that tracks connectivity state.
class ConnectivityNotifier extends StateNotifier<ConnectionStatus> {
  StreamSubscription<List<ConnectivityResult>>? _subscription;

  ConnectivityNotifier() : super(ConnectionStatus.online) {
    _init();
  }

  Future<void> _init() async {
    final result = await Connectivity().checkConnectivity();
    state = _mapResult(result);

    _subscription = Connectivity().onConnectivityChanged.listen((result) {
      state = _mapResult(result);
    });
  }

  ConnectionStatus _mapResult(List<ConnectivityResult> result) {
    if (result.isEmpty || result.contains(ConnectivityResult.none)) {
      return ConnectionStatus.offline;
    }
    return ConnectionStatus.online;
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}

/// Provides connectivity state.
final connectivityProvider =
    StateNotifierProvider<ConnectivityNotifier, ConnectionStatus>((ref) {
      return ConnectivityNotifier();
    });

/// Convenience provider for checking if online.
final isOnlineProvider = Provider<bool>((ref) {
  return ref.watch(connectivityProvider) == ConnectionStatus.online;
});
