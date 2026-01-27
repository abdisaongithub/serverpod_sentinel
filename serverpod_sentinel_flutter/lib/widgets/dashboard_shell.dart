import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';
import 'sentinel_sidebar.dart';

class DashboardShell extends StatelessWidget {
  final Widget child;
  final GoRouterState state;

  const DashboardShell({super.key, required this.child, required this.state});

  @override
  Widget build(BuildContext context) {
    final String activeRoute = state.uri.toString();

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;

        if (isDesktop) {
          return Scaffold(
            backgroundColor: AppTheme.darkBackground,
            body: Row(
              children: [
                SentinelSidebar(
                  activeRoute: activeRoute,
                  onRouteSelected: (route) => context.go(route),
                ),
                Expanded(
                  child: ClipRect(
                    child: child,
                  ),
                ),
              ],
            ),
          );
        }

        // Mobile Layout (Unchanged for now, focusing on Desktop excellence)
        return Scaffold(
          backgroundColor: AppTheme.darkBackground,
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            backgroundColor: AppTheme.darkSurface,
            selectedItemColor: AppTheme.primary,
            unselectedItemColor: AppTheme.darkTextMuted,
            currentIndex: _getMobileIndex(activeRoute),
            type: BottomNavigationBarType.fixed,
            onTap: (index) => _onMobileTap(context, index),
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.dashboard_rounded), label: 'Dash'),
              BottomNavigationBarItem(icon: Icon(Icons.notifications_active_rounded), label: 'Incidents'),
              BottomNavigationBarItem(icon: Icon(Icons.layers_rounded), label: 'Registry'),
              BottomNavigationBarItem(icon: Icon(Icons.settings_rounded), label: 'Settings'),
            ],
          ),
        );
      },
    );
  }

  int _getMobileIndex(String route) {
    if (route == '/') return 0;
    if (route.startsWith('/incidents')) return 1;
    if (route.startsWith('/registry')) return 2;
    if (route.startsWith('/settings')) return 3;
    return 0;
  }

  void _onMobileTap(BuildContext context, int index) {
    final routes = ['/', '/incidents', '/registry', '/settings'];
    context.go(routes[index]);
  }
}
