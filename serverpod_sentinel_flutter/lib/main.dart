import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'router.dart';
import 'theme/app_theme.dart';
import 'services/serverpod_client.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      usePathUrlStrategy();

      // Configure Flutter error handling
      FlutterError.onError = (details) {
        FlutterError.presentError(details);
        _logError(details.exception, details.stack);
      };

      // Handle platform errors
      PlatformDispatcher.instance.onError = (error, stack) {
        _logError(error, stack);
        return true;
      };

      // Initialize Serverpod client
      await ServerpodClientSingleton.initialize();

      runApp(const ProviderScope(child: SentinelApp()));
    },
    (error, stack) {
      _logError(error, stack);
    },
  );
}

void _logError(Object error, StackTrace? stack) {
  if (kDebugMode) {
    print('ERROR: $error');
    if (stack != null) print('STACK: $stack');
  }
  // TODO: Send to crash reporting service (Sentry, Firebase Crashlytics)
}

class SentinelApp extends ConsumerWidget {
  const SentinelApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'Serverpod Sentinel',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      routerConfig: router,
    );
  }
}
