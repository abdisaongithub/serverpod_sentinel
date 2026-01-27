import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'router.dart';
import 'theme/app_theme.dart';
import 'services/serverpod_client.dart';
import 'providers/theme_provider.dart';
import 'widgets/command_palette.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      usePathUrlStrategy();

      FlutterError.onError = (details) {
        FlutterError.presentError(details);
        _logError(details.exception, details.stack);
      };

      PlatformDispatcher.instance.onError = (error, stack) {
        _logError(error, stack);
        return true;
      };

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
}

class SentinelApp extends ConsumerWidget {
  const SentinelApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final themeMode = ref.watch(themeProvider);

    return MaterialApp.router(
      title: 'Serverpod Sentinel',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme, // Simplified to dark only for modern enterprise feel
      darkTheme: AppTheme.darkTheme,
      themeMode: themeMode,
      routerConfig: router,
      builder: (context, child) {
        return _GlobalKeyboardListener(child: child!);
      },
    );
  }
}

class _GlobalKeyboardListener extends StatefulWidget {
  final Widget child;
  const _GlobalKeyboardListener({required this.child});

  @override
  State<_GlobalKeyboardListener> createState() => _GlobalKeyboardListenerState();
}

class _GlobalKeyboardListenerState extends State<_GlobalKeyboardListener> {
  bool _showPalette = false;

  void _togglePalette() {
    setState(() => _showPalette = !_showPalette);
  }

  @override
  Widget build(BuildContext context) {
    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.keyK, control: true): _togglePalette,
        const SingleActivator(LogicalKeyboardKey.keyK, meta: true): _togglePalette,
        const SingleActivator(LogicalKeyboardKey.escape): () {
          if (_showPalette) setState(() => _showPalette = false);
        },
      },
      child: Focus(
        autofocus: true,
        child: Stack(
          children: [
            widget.child,
            if (_showPalette)
              Positioned.fill(
                child: GestureDetector(
                  onTap: _togglePalette,
                  child: Container(
                    color: Colors.black.withOpacity(0.6),
                    child: const CommandPalette(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
