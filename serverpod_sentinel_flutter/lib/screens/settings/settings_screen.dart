import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_sidebar.dart';
import '../../routes.dart';
import '../../providers/theme_provider.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;

        if (isDesktop) {
          return Scaffold(
            body: Column(
              children: [
                _buildDesktopHeader(context),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(32),
                    child: _buildDesktopGrid(context, ref),
                  ),
                ),
              ],
            ),
          );
        }

        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Settings & Admin',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            leading: IconButton(
              icon: const Icon(LucideIcons.arrowLeft),
              onPressed: () => context.pop(),
            ),
          ),
          drawer: const Drawer(
            child: AppSidebar(activeRoute: AppRoutes.settings),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: _buildMobileList(context, ref),
          ),
        );
      },
    );
  }

  Widget _buildDesktopHeader(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        border: Border(bottom: BorderSide(color: colorScheme.outlineVariant)),
      ),
      child: Row(
        children: [
          Icon(LucideIcons.settings, size: 28, color: colorScheme.primary),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings & Administration',
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                'Manage system configuration, users, and integrations',
                style: theme.textTheme.bodyMedium,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopGrid(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Theme Toggle Section
        _buildThemeToggle(context, ref),
        const SizedBox(height: 32),

        _buildSectionTitle(context, 'Operational'),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          childAspectRatio: 1.5,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          children: [
            _buildGridCard(
              context,
              'Team Members',
              'Manage access and roles',
              LucideIcons.users,
              Colors.blue,
              AppRoutes.teamMembers,
            ),
            _buildGridCard(
              context,
              'Audit Log',
              'View system activities',
              LucideIcons.fileText,
              Colors.orange,
              AppRoutes.auditLog,
            ),
            _buildGridCard(
              context,
              'Configure Rule',
              'Set up automation rules',
              LucideIcons.sliders,
              Colors.purple,
              AppRoutes.configureRule,
            ),
            _buildGridCard(
              context,
              'Incident Report',
              'View post-mortem reports',
              LucideIcons.clipboardList,
              Colors.red,
              AppRoutes.incidentReport,
            ),
          ],
        ),
        const SizedBox(height: 48),
        _buildSectionTitle(context, 'System & Management'),
        const SizedBox(height: 16),
        GridView.count(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 3,
          childAspectRatio: 1.5,
          crossAxisSpacing: 24,
          mainAxisSpacing: 24,
          children: [
            _buildGridCard(
              context,
              'System Settings',
              'Global configuration',
              LucideIcons.settings,
              Colors.grey,
              AppRoutes.systemSettings,
            ),
            _buildGridCard(
              context,
              'Notification Preferences',
              'Manage alert channels',
              LucideIcons.bellRing,
              Colors.teal,
              AppRoutes.notifications,
            ),
            _buildGridCard(
              context,
              'AI Insights',
              'Intelligence dashboard',
              LucideIcons.sparkles,
              Colors.indigo,
              AppRoutes.aiInsights,
            ),
            _buildGridCard(
              context,
              'Integrations',
              'Manage external services',
              LucideIcons.toyBrick,
              const Color(0xFF10b981),
              AppRoutes.integrations,
            ),
            _buildGridCard(
              context,
              'Environment Settings',
              'Production config & scaling',
              LucideIcons.server,
              Colors.amber,
              AppRoutes.environmentSettings,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildThemeToggle(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;
    final themeNotifier = ref.read(themeProvider.notifier);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: colorScheme.outlineVariant),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.3 : 0.08),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              isDark ? LucideIcons.moon : LucideIcons.sun,
              color: colorScheme.primary,
              size: 24,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Appearance',
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  isDark ? 'Dark mode enabled' : 'Light mode enabled',
                  style: theme.textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          // Theme toggle buttons
          Container(
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: colorScheme.surfaceContainerHighest,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                _buildThemeButton(
                  context,
                  icon: LucideIcons.sun,
                  label: 'Light',
                  isSelected: !isDark,
                  onTap: () => themeNotifier.setTheme(ThemeMode.light),
                ),
                const SizedBox(width: 4),
                _buildThemeButton(
                  context,
                  icon: LucideIcons.moon,
                  label: 'Dark',
                  isSelected: isDark,
                  onTap: () => themeNotifier.setTheme(ThemeMode.dark),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildThemeButton(
    BuildContext context, {
    required IconData icon,
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? colorScheme.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 18,
              color: isSelected ? Colors.white : colorScheme.onSurfaceVariant,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileList(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Theme Toggle Section
        _buildThemeToggle(context, ref),
        const SizedBox(height: 24),

        _buildSectionTitle(context, 'Operational'),
        const SizedBox(height: 12),
        _buildNavTile(
          context,
          'Team Members',
          LucideIcons.users,
          AppRoutes.teamMembers,
        ),
        _buildNavTile(
          context,
          'Audit Log',
          LucideIcons.fileText,
          AppRoutes.auditLog,
        ),
        _buildNavTile(
          context,
          'Configure Rule',
          LucideIcons.sliders,
          AppRoutes.configureRule,
        ),
        _buildNavTile(
          context,
          'Incident Report',
          LucideIcons.clipboardList,
          AppRoutes.incidentReport,
        ),
        const SizedBox(height: 24),
        _buildSectionTitle(context, 'System & Management'),
        const SizedBox(height: 12),
        _buildNavTile(
          context,
          'System Settings',
          LucideIcons.settings,
          AppRoutes.systemSettings,
        ),
        _buildNavTile(
          context,
          'Notification Prefs',
          LucideIcons.bellRing,
          AppRoutes.notifications,
        ),
        _buildNavTile(
          context,
          'AI Insights',
          LucideIcons.sparkles,
          AppRoutes.aiInsights,
        ),
        _buildNavTile(
          context,
          'Integrations',
          LucideIcons.toyBrick,
          AppRoutes.integrations,
        ),
        _buildNavTile(
          context,
          'Env Settings',
          LucideIcons.server,
          AppRoutes.environmentSettings,
        ),
      ],
    );
  }

  Widget _buildGridCard(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
    String routeName,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return Material(
      color: colorScheme.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: () => context.go(routeName),
        borderRadius: BorderRadius.circular(16),
        hoverColor: colorScheme.outlineVariant.withOpacity(0.5),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            border: Border.all(color: colorScheme.outlineVariant),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(isDark ? 0.3 : 0.08),
                blurRadius: 12,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const Spacer(),
              Text(
                title,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(subtitle, style: theme.textTheme.bodySmall),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavTile(
    BuildContext context,
    String title,
    IconData icon,
    String routeName,
  ) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: colorScheme.outlineVariant),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(isDark ? 0.2 : 0.06),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: colorScheme.primary, size: 20),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: Icon(
          LucideIcons.chevronRight,
          size: 16,
          color: theme.textTheme.bodySmall?.color,
        ),
        onTap: () => context.go(routeName),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    final theme = Theme.of(context);
    return Text(
      title,
      style: theme.textTheme.bodySmall?.copyWith(
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    );
  }
}
