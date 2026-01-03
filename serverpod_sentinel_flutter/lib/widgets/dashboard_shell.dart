import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../theme/app_theme.dart';
import 'app_sidebar.dart';

class DashboardShell extends StatelessWidget {
  final Widget child;
  final GoRouterState state;

  const DashboardShell({super.key, required this.child, required this.state});

  @override
  Widget build(BuildContext context) {
    // Current route path for sidebar highlighting
    final String activeRoute = state.uri.toString();

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;

        if (isDesktop) {
          return Scaffold(
            body: Row(
              children: [
                AppSidebar(activeRoute: activeRoute),
                Expanded(child: child),
              ],
            ),
          );
        }

        // Mobile Layout: just return the child.
        // Individual screens handle their own Scaffold/AppBar/Drawer.
        return child;
      },
    );
  }
}
