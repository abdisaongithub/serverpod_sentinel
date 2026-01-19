import 'dart:async' as async;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart'
    as protocol;
import 'package:serverpod_auth_shared_flutter/serverpod_auth_shared_flutter.dart';
import 'client_provider.dart';

/// Provider for the StreamingService
final streamingServiceProvider = Provider<StreamingService>((ref) {
  final client = ref.watch(clientProvider);
  final sessionManager = ref.watch(sessionManagerProvider);
  return StreamingService(client, sessionManager);
});

/// Stream of NEW alerts (emitted as they arrive/poll)
final liveAlertsStreamProvider =
    StreamProvider.autoDispose<protocol.StreamAlert>((ref) {
      final service = ref.watch(streamingServiceProvider);
      final sub = service.subscribeToAlerts();
      ref.onDispose(() {
        sub.cancel();
        service.stopPolling();
      });
      return service.alertStream;
    });

/// Unified List of Alerts (Recent + Live Updates)
/// Use this in the UI instead of 'alertsProvider'
final unifiedAlertsProvider =
    StateNotifierProvider.autoDispose<
      UnifiedAlertsNotifier,
      AsyncValue<List<protocol.StreamAlert>>
    >((ref) {
      final service = ref.watch(streamingServiceProvider);
      return UnifiedAlertsNotifier(service);
    });

class UnifiedAlertsNotifier
    extends StateNotifier<AsyncValue<List<protocol.StreamAlert>>> {
  final StreamingService _service;
  late final async.StreamSubscription _sub;
  final Set<int> _knownIds = {};

  UnifiedAlertsNotifier(this._service) : super(const AsyncValue.loading()) {
    _init();
  }

  void _init() {
    // Start listening to the stream (which triggers polling)
    _sub = _service.alertStream.listen((alert) {
      _addAlert(alert);
    });
    // Ensure subscription is active (kickstart polling if not already)
    _service.subscribeToAlerts();
  }

  void _addAlert(protocol.StreamAlert alert) {
    state.whenData((currentList) {
      // Prepend new alert
      if (!_knownIds.contains(alert.id)) {
        _knownIds.add(alert.id);
        state = AsyncValue.data([alert, ...currentList]);
      }
    });

    // If loading, set initial state
    if (state.isLoading) {
      _knownIds.add(alert.id);
      state = AsyncValue.data([alert]);
    }
  }

  @override
  void dispose() {
    _sub.cancel();
    super.dispose();
  }
}

/// Stream of Global Service Updates
final globalServiceUpdatesProvider =
    StreamProvider.autoDispose<protocol.StreamServiceStatus>((ref) {
      final service = ref.watch(streamingServiceProvider);
      final sub = service.subscribeToGlobalUpdates();
      ref.onDispose(() {
        sub.cancel();
      });
      return service.serviceStatusStream;
    });

class StreamingService {
  final protocol.Client client;
  final SessionManager sessionManager;
  final async.StreamController<protocol.StreamAlert> _alertController =
      async.StreamController.broadcast();
  final async.StreamController<protocol.StreamServiceStatus>
  _serviceStatusController = async.StreamController.broadcast();

  async.Timer? _pollingTimer;
  final Set<int> _polledAlertIds = {};

  StreamingService(this.client, this.sessionManager);

  async.Stream<protocol.StreamAlert> get alertStream => _alertController.stream;
  async.Stream<protocol.StreamServiceStatus> get serviceStatusStream =>
      _serviceStatusController.stream;

  async.StreamSubscription<dynamic> subscribeToAlerts() {
    try {
      client.streaming.sendStreamMessage(
        protocol.StreamSubscription(
          type: protocol.StreamSubscriptionType.ALERTS,
        ),
      );
    } catch (_) {}

    _startPolling();
    return async.Stream.empty().listen((_) {});
  }

  async.StreamSubscription<dynamic> subscribeToGlobalUpdates() {
    try {
      client.streaming.sendStreamMessage(
        protocol.StreamSubscription(
          type: protocol.StreamSubscriptionType.GLOBAL_SERVICE_UPDATES,
        ),
      );
    } catch (_) {}

    _startPolling();
    return async.Stream.empty().listen((_) {});
  }

  void _startPolling() {
    if (_pollingTimer != null && _pollingTimer!.isActive) return;

    // Poll immediately, then periodic
    _pollAlerts();
    _pollServices();

    _pollingTimer = async.Timer.periodic(const Duration(seconds: 3), (
      timer,
    ) async {
      await _pollAlerts();
      await _pollServices();
    });
  }

  void stopPolling() {
    _pollingTimer?.cancel();
    _pollingTimer = null;
    _polledAlertIds.clear();
  }

  Future<void> _pollAlerts() async {
    try {
      final alerts = await client.alert.getRecent(limit: 20);

      // Emit oldest to newest to maintain order logically
      for (var alert in alerts.reversed) {
        if (!_polledAlertIds.contains(alert.id)) {
          _polledAlertIds.add(alert.id);
          _alertController.add(alert);
        }
      }
    } catch (_) {}
  }

  Future<void> _pollServices() async {
    try {
      final services = await client.service.list();
      for (var service in services) {
        // Emit logic: Just emit current status.
        // We trust the provider consuming this to handle updates or invalidation
        _serviceStatusController.add(
          protocol.StreamServiceStatus(
            serviceId: service.id ?? 0,
            previousStatus: service.status, // Assumption for poll
            newStatus: service.status,
            timestamp: service.updatedAt,
          ),
        );
      }
    } catch (_) {}
  }
}
