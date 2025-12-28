import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import 'notification_preferences_screen.dart';
import 'team_members_screen.dart';
import 'audit_log_screen.dart';
import 'configure_rule_screen.dart';
import '../reports/incident_report_screen.dart';
import 'system_settings_screen.dart';
import 'integrations_manager_screen.dart';
import 'environment_settings_screen.dart';
import '../intelligence/ai_insights_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Settings & Admin',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        automaticallyImplyLeading:
            false, // Managed by BottomNav usually, but here we push it
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Verification Links (Batch 3)',
            style: TextStyle(
              color: AppTheme.textMuted,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildNavTile(
            context,
            'Team Members',
            LucideIcons.users,
            const TeamMembersScreen(),
          ),
          _buildNavTile(
            context,
            'Audit Log',
            LucideIcons.fileText,
            const AuditLogScreen(),
          ),
          _buildNavTile(
            context,
            'Configure Rule',
            LucideIcons.settings,
            const ConfigureRuleScreen(),
          ),
          _buildNavTile(
            context,
            'Incident Report',
            LucideIcons.clipboardList,
            const IncidentReportScreen(),
          ),
          const SizedBox(height: 24),
          const Text(
            'Verification Links (Batch 4)',
            style: TextStyle(
              color: AppTheme.textMuted,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          _buildNavTile(
            context,
            'System Settings',
            LucideIcons.settings,
            const SystemSettingsScreen(),
          ),
          _buildNavTile(
            context,
            'Notification Prefs',
            LucideIcons.bellRing,
            NotificationPreferencesScreen(),
          ),
          _buildNavTile(
            context,
            'AI Insights',
            LucideIcons.sparkles,
            const AIInsightsScreen(),
          ),
          _buildNavTile(
            context,
            'Integrations',
            LucideIcons.toyBrick, // TODO: find blocks icon
            const IntegrationsManagerScreen(),
          ),
          _buildNavTile(
            context,
            'Env Settings',
            LucideIcons.server,
            const EnvironmentSettingsScreen(),
          ),
        ],
      ),
    );
  }

  Widget _buildNavTile(
    BuildContext context,
    String title,
    IconData icon,
    Widget screen,
  ) {
    return Card(
      color: AppTheme.surface,
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Icon(icon, color: AppTheme.primary),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: const Icon(
          LucideIcons.chevronRight,
          color: AppTheme.textMuted,
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
        },
      ),
    );
  }
}
