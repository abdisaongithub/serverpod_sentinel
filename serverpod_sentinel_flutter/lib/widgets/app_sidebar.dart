import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theme/app_theme.dart';
import '../routes.dart';

class AppSidebar extends StatelessWidget {
  final String activeRoute;

  const AppSidebar({super.key, required this.activeRoute});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      width: 260,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        border: Border(
          right: BorderSide(color: colorScheme.outlineVariant, width: 1),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.5 : 0.15),
            blurRadius: 25,
            offset: const Offset(5, 0),
          ),
        ],
      ),
      child: Column(
        children: [
          // Logo Section
          _buildHeader(context),

          // Navigation Items
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(context, 'OBSERVABILITY', [
                    _SidebarItem(
                      icon: LucideIcons.layoutGrid,
                      label: 'Overview',
                      route: AppRoutes.dashboard,
                      isActive: activeRoute == AppRoutes.dashboard,
                    ),
                    _SidebarItem(
                      icon: LucideIcons.alertTriangle,
                      label: 'Incidents',
                      route: AppRoutes.incidents,
                      isActive: activeRoute == AppRoutes.incidents,
                      badge: '3',
                    ),
                    _SidebarItem(
                      icon: LucideIcons.activity,
                      label: 'Live Stream',
                      route: AppRoutes.liveStream,
                      isActive: activeRoute == AppRoutes.liveStream,
                    ),
                  ]),
                  _buildSection(context, 'INFRASTRUCTURE', [
                    _SidebarItem(
                      icon: LucideIcons.network,
                      label: 'Service Registry',
                      route: AppRoutes.serviceRegistry,
                      isActive:
                          activeRoute == AppRoutes.serviceRegistry ||
                          activeRoute == AppRoutes.serviceDetail,
                    ),
                  ]),
                  _buildSection(context, 'AUTOMATION', [
                    _SidebarItem(
                      icon: LucideIcons.playCircle,
                      label: 'Playbooks',
                      route: AppRoutes.playbooks,
                      isActive: activeRoute == AppRoutes.playbooks,
                    ),
                  ]),
                  _buildSection(context, 'INTELLIGENCE', [
                    _SidebarItem(
                      icon: LucideIcons.sparkles,
                      label: 'AI Insights',
                      route: AppRoutes.aiInsights,
                      isActive: activeRoute == AppRoutes.aiInsights,
                    ),
                    _SidebarItem(
                      icon: LucideIcons.barChart3,
                      label: 'Reports',
                      route: AppRoutes.incidentReport,
                      isActive: activeRoute == AppRoutes.incidentReport,
                    ),
                  ]),
                  _buildSection(context, 'SYSTEM', [
                    _SidebarItem(
                      icon: LucideIcons.users,
                      label: 'Team Members',
                      route: AppRoutes.teamMembers,
                      isActive: activeRoute == AppRoutes.teamMembers,
                    ),
                    _SidebarItem(
                      icon: LucideIcons.settings2,
                      label: 'Settings',
                      route: AppRoutes.settings,
                      isActive: activeRoute == AppRoutes.settings,
                    ),
                  ]),
                ],
              ),
            ),
          ),

          // User Profile Section
          _buildUserProfile(context),
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: colorScheme.outlineVariant, width: 1),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: colorScheme.primary.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              LucideIcons.shield,
              color: colorScheme.primary,
              size: 24,
            ),
          ),
          const SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'SENTINEL',
                style: TextStyle(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  letterSpacing: 1,
                ),
              ),
              Text(
                'OPS BUTLER',
                style: theme.textTheme.bodySmall?.copyWith(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSection(BuildContext context, String title, List<Widget> items) {
    if (items.isEmpty) return const SizedBox.shrink();
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 24, 24, 12),
          child: Text(
            title,
            style: theme.textTheme.bodySmall?.copyWith(
              fontSize: 11,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
        ),
        ...items,
      ],
    );
  }

  Widget _buildUserProfile(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: colorScheme.outlineVariant, width: 1),
        ),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 18,
            backgroundColor: colorScheme.outlineVariant,
            child: Text(
              'AM',
              style: TextStyle(
                color: colorScheme.onSurface,
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Alex Morgan',
                  style: TextStyle(
                    color: colorScheme.onSurface,
                    fontWeight: FontWeight.bold,
                    fontSize: 13,
                  ),
                ),
                Text(
                  'Admin Role',
                  style: theme.textTheme.bodySmall?.copyWith(fontSize: 11),
                ),
              ],
            ),
          ),
          Icon(
            LucideIcons.logOut,
            color: theme.textTheme.bodySmall?.color,
            size: 18,
          ),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatefulWidget {
  final IconData icon;
  final String label;
  final String? route;
  final bool isActive;
  final String? badge;

  const _SidebarItem({
    required this.icon,
    required this.label,
    this.route,
    this.isActive = false,
    this.badge,
  });

  @override
  State<_SidebarItem> createState() => _SidebarItemState();
}

class _SidebarItemState extends State<_SidebarItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    final activeColor = colorScheme.primary;
    final inactiveColor = isDark
        ? AppTheme.darkTextMuted
        : AppTheme.lightTextMuted;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 2),
      child: MouseRegion(
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: InkWell(
          onTap: widget.route != null
              ? () {
                  if (!widget.isActive) {
                    context.go(widget.route!);
                  }
                }
              : null,
          borderRadius: BorderRadius.circular(8),
          hoverColor: colorScheme.outlineVariant.withValues(alpha: 0.3),
          splashColor: activeColor.withValues(alpha: 0.1),
          highlightColor: activeColor.withValues(alpha: 0.05),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: widget.isActive
                  ? activeColor.withValues(alpha: 0.1)
                  : (_isHovered
                        ? colorScheme.outlineVariant.withValues(alpha: 0.2)
                        : Colors.transparent),
              borderRadius: BorderRadius.circular(8),
              boxShadow: (widget.isActive || _isHovered)
                  ? [
                      BoxShadow(
                        color: widget.isActive
                            ? activeColor.withValues(alpha: 0.4)
                            : Colors.black.withValues(
                                alpha: isDark ? 0.4 : 0.15,
                              ),
                        blurRadius: widget.isActive ? 12 : 6,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: Row(
              children: [
                Icon(
                  widget.icon,
                  size: 20,
                  color: widget.isActive ? activeColor : inactiveColor,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    widget.label,
                    style: TextStyle(
                      color: widget.isActive
                          ? colorScheme.onSurface
                          : inactiveColor,
                      fontSize: 14,
                      fontWeight: widget.isActive
                          ? FontWeight.bold
                          : FontWeight.w500,
                    ),
                  ),
                ),
                if (widget.badge != null)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.error,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      widget.badge!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
