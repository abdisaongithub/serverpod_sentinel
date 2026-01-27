import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../theme/app_theme.dart';
import '../theme/sentinel_motion.dart';

/// Provider to manage the global sidebar state.
final sidebarCollapsedProvider = StateProvider<bool>((ref) => false);

class SentinelSidebar extends ConsumerWidget {
  final String activeRoute;
  final Function(String) onRouteSelected;

  const SentinelSidebar({
    super.key,
    required this.activeRoute,
    required this.onRouteSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isCollapsed = ref.watch(sidebarCollapsedProvider);
    
    return AnimatedContainer(
      duration: SentinelMotion.slow,
      curve: SentinelMotion.curveLayout,
      width: isCollapsed ? 80 : 280,
      decoration: BoxDecoration(
        color: AppTheme.darkSurface,
        border: Border(right: BorderSide(color: AppTheme.darkBorder, width: 1)),
      ),
      child: Column(
        children: [
          _SidebarHeader(isCollapsed: isCollapsed),
          const SizedBox(height: 24),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              children: [
                _SidebarItem(
                  icon: Icons.dashboard_rounded,
                  label: 'Dashboard',
                  route: '/',
                  isActive: activeRoute == '/',
                  isCollapsed: isCollapsed,
                  onTap: () => onRouteSelected('/'),
                ),
                _SidebarItem(
                  icon: Icons.notifications_active_rounded,
                  label: 'Incidents',
                  route: '/incidents',
                  isActive: activeRoute.startsWith('/incidents'),
                  isCollapsed: isCollapsed,
                  onTap: () => onRouteSelected('/incidents'),
                ),
                _SidebarItem(
                  icon: Icons.layers_rounded,
                  label: 'Registry',
                  route: '/registry',
                  isActive: activeRoute.startsWith('/registry'),
                  isCollapsed: isCollapsed,
                  onTap: () => onRouteSelected('/registry'),
                ),
                _SidebarItem(
                  icon: Icons.insights_rounded,
                  label: 'Intelligence',
                  route: '/intelligence',
                  isActive: activeRoute.startsWith('/intelligence'),
                  isCollapsed: isCollapsed,
                  onTap: () => onRouteSelected('/intelligence'),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 16),
                  child: Divider(),
                ),
                _SidebarItem(
                  icon: Icons.settings_suggest_rounded,
                  label: 'Settings',
                  route: '/settings',
                  isActive: activeRoute.startsWith('/settings'),
                  isCollapsed: isCollapsed,
                  onTap: () => onRouteSelected('/settings'),
                ),
              ],
            ),
          ),
          _SidebarFooter(isCollapsed: isCollapsed),
        ],
      ),
    );
  }
}

class _SidebarHeader extends ConsumerWidget {
  final bool isCollapsed;
  const _SidebarHeader({required this.isCollapsed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.only(top: 24, left: 16, right: 16),
      child: Row(
        mainAxisAlignment: isCollapsed ? MainAxisAlignment.center : MainAxisAlignment.spaceBetween,
        children: [
          if (!isCollapsed)
            Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: AppTheme.primary,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.security, color: Colors.white, size: 20),
                ),
                const SizedBox(width: 12),
                Text(
                  'SENTINEL',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                    letterSpacing: 2,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          IconButton(
            onPressed: () => ref.read(sidebarCollapsedProvider.notifier).state = !isCollapsed,
            icon: Icon(
              isCollapsed ? Icons.menu_open_rounded : Icons.menu_rounded,
              color: AppTheme.darkTextMuted,
            ),
          ),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final String route;
  final bool isActive;
  final bool isCollapsed;
  final VoidCallback onTap;

  const _SidebarItem({
    required this.icon,
    required this.label,
    required this.route,
    required this.isActive,
    required this.isCollapsed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 4),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: SentinelMotion.fast,
          padding: EdgeInsets.symmetric(
            horizontal: isCollapsed ? 0 : 16,
            vertical: 12,
          ),
          decoration: BoxDecoration(
            color: isActive ? AppTheme.primary.withOpacity(0.1) : Colors.transparent,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isActive ? AppTheme.primary.withOpacity(0.2) : Colors.transparent,
            ),
          ),
          child: Row(
            mainAxisAlignment: isCollapsed ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              Icon(
                icon,
                color: isActive ? AppTheme.primary : AppTheme.darkTextMuted,
                size: 24,
              ),
              if (!isCollapsed) ...[
                const SizedBox(width: 16),
                Text(
                  label,
                  style: TextStyle(
                    color: isActive ? AppTheme.darkText : AppTheme.darkTextSecondary,
                    fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _SidebarFooter extends StatelessWidget {
  final bool isCollapsed;
  const _SidebarFooter({required this.isCollapsed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: isCollapsed 
        ? const CircleAvatar(radius: 16, backgroundColor: AppTheme.darkSurfaceVariant, child: Icon(Icons.person, size: 16))
        : Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.darkSurfaceVariant.withOpacity(0.5),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                const CircleAvatar(radius: 16, backgroundColor: AppTheme.darkSurfaceVariant, child: Icon(Icons.person, size: 16)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Ops Admin',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'SuperAdmin',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                Icon(Icons.more_vert_rounded, color: AppTheme.darkTextMuted, size: 18),
              ],
            ),
          ),
    );
  }
}
