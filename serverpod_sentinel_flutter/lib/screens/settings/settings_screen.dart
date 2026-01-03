import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_sidebar.dart';

import '../../routes.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;

        if (isDesktop) {
          return Scaffold(
            backgroundColor: AppTheme.background,
            body: Column(
              children: [
                _buildDesktopHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(32),
                    child: _buildDesktopGrid(context),
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
            backgroundColor: Colors.transparent,
            elevation: 0,
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
            child: _buildMobileList(context),
          ),
        );
      },
    );
  }

  Widget _buildDesktopHeader() {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: const BoxDecoration(
        color: AppTheme.surface,
        border: Border(bottom: BorderSide(color: AppTheme.surfaceHighlight)),
      ),
      child: const Row(
        children: [
          Icon(LucideIcons.settings, size: 28, color: AppTheme.primary),
          SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Settings & Administration',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'Manage system configuration, users, and integrations',
                style: TextStyle(color: AppTheme.textMuted, fontSize: 14),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopGrid(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('VERIFICATION LINKS (BATCH 3)'),
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
        _buildSectionTitle('VERIFICATION LINKS (BATCH 4)'),
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

  Widget _buildMobileList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('VERIFICATION LINKS (BATCH 3)'),
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
        _buildSectionTitle('VERIFICATION LINKS (BATCH 4)'),
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
    return Material(
      color: AppTheme.surface,
      borderRadius: BorderRadius.circular(16),
      child: InkWell(
        onTap: () => context.go(routeName),
        borderRadius: BorderRadius.circular(16),
        hoverColor: AppTheme.surfaceHighlight.withValues(alpha: 0.5),
        child: Container(
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            border: Border.all(color: AppTheme.surfaceHighlight),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.3),
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
                  color: color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: color, size: 28),
              ),
              const Spacer(),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: const TextStyle(color: AppTheme.textMuted, fontSize: 13),
              ),
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
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceHighlight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.2),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: AppTheme.primary, size: 20),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600)),
        trailing: const Icon(
          LucideIcons.chevronRight,
          size: 16,
          color: AppTheme.textMuted,
        ),
        onTap: () => context.go(routeName),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: AppTheme.textMuted,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    );
  }
}
