import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import 'notification_preferences_screen.dart';
import 'integrations_manager_screen.dart';
import 'environment_settings_screen.dart';

class SystemSettingsScreen extends StatefulWidget {
  const SystemSettingsScreen({super.key});

  @override
  State<SystemSettingsScreen> createState() => _SystemSettingsScreenState();
}

class _SystemSettingsScreenState extends State<SystemSettingsScreen> {
  bool _guardrailsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'System Settings',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text(
              'Done',
              style: TextStyle(
                color: AppTheme.primary,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ),
        ],
        leading:
            const SizedBox.shrink(), // Hiding back button as it's a modal-like full screen
        leadingWidth: 0,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < AppTheme.mobileBreakpoint;
          return Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 1000),
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextField(
                      decoration: InputDecoration(
                        hintText: 'Search settings, integrations...',
                        prefixIcon: const Icon(
                          LucideIcons.search,
                          color: AppTheme.textMuted,
                        ),
                        filled: true,
                        fillColor: AppTheme.surface,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),

                    const Text(
                      'NOTIFICATION PREFERENCES',
                      style: TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Container(
                      decoration: BoxDecoration(
                        color: AppTheme.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppTheme.surfaceHighlight),
                      ),
                      child: Column(
                        children: [
                          _buildSettingsTile(
                            context,
                            title: 'Alert Policies',
                            subtitle: 'Critical alerts: PagerDuty',
                            icon: LucideIcons.bell,
                            iconColor: AppTheme.primary,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const NotificationPreferencesScreen(),
                              ),
                            ),
                          ),
                          const Divider(
                            height: 1,
                            color: AppTheme.surfaceHighlight,
                          ),
                          _buildSettingsTile(
                            context,
                            title: 'Delivery Channels',
                            subtitle: 'Email, Slack, SMS enabled',
                            icon: LucideIcons.mail,
                            iconColor: Colors.deepPurpleAccent,
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const NotificationPreferencesScreen(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'AUTOMATION SAFETY',
                          style: TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF10b981).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: const Text(
                            'Active',
                            style: TextStyle(
                              color: Color(0xFF10b981),
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.surface,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: AppTheme.surfaceHighlight),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.orange.withOpacity(0.2),
                                  shape: BoxShape.circle,
                                ),
                                child: const Icon(
                                  LucideIcons.shieldAlert,
                                  color: Colors.orange,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(
                                      'Guardrails',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                      ),
                                    ),
                                    Text(
                                      'Production environments',
                                      style: TextStyle(
                                        color: AppTheme.textMuted.withOpacity(
                                          0.8,
                                        ),
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Switch(
                                value: _guardrailsEnabled,
                                onChanged: (v) =>
                                    setState(() => _guardrailsEnabled = v),
                                activeColor: AppTheme.primary,
                              ),
                            ],
                          ),
                          const SizedBox(height: 16),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Safety Level',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Standard',
                                style: TextStyle(
                                  color: AppTheme.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          SliderTheme(
                            data: SliderTheme.of(context).copyWith(
                              trackHeight: 6,
                              activeTrackColor: AppTheme.surfaceHighlight,
                              inactiveTrackColor: AppTheme.surfaceHighlight,
                              thumbColor: AppTheme.primary,
                              overlayShape: const RoundSliderOverlayShape(
                                overlayRadius: 0,
                              ),
                              thumbShape: const RoundSliderThumbShape(
                                enabledThumbRadius: 8,
                              ),
                            ),
                            child: Slider(
                              value: 1,
                              min: 0,
                              max: 2,
                              divisions: 2,
                              onChanged: (v) {},
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Permissive',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: AppTheme.textMuted,
                                  ),
                                ),
                                Text(
                                  'Standard',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: AppTheme.textMuted,
                                  ),
                                ),
                                Text(
                                  'Strict',
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: AppTheme.textMuted,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 16),
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppTheme.background,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: RichText(
                              text: const TextSpan(
                                style: TextStyle(fontSize: 12, height: 1.4),
                                children: [
                                  TextSpan(
                                    text: 'Standard Mode: ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        'Manual approval required for destructive actions on ',
                                    style: TextStyle(color: AppTheme.textMuted),
                                  ),
                                  TextSpan(
                                    text: 'production databases.',
                                    style: TextStyle(color: AppTheme.textMuted),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'INTEGRATIONS',
                          style: TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 1.2,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text('Manage'),
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    if (isMobile)
                      Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: _buildIntegrationCard(
                              'GitHub',
                              'Connected',
                              LucideIcons.github,
                              const Color(0xFF10b981),
                            ),
                          ),
                          const SizedBox(height: 12),
                          SizedBox(
                            width: double.infinity,
                            child: _buildIntegrationCard(
                              'AWS',
                              'Synced (2m ago)',
                              LucideIcons.cloud,
                              const Color(0xFF10b981),
                              iconColor: Colors.purple,
                            ),
                          ),
                        ],
                      )
                    else
                      Row(
                        children: [
                          Expanded(
                            child: _buildIntegrationCard(
                              'GitHub',
                              'Connected',
                              LucideIcons.github,
                              const Color(0xFF10b981),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: _buildIntegrationCard(
                              'AWS',
                              'Synced (2m ago)',
                              LucideIcons.cloud,
                              const Color(0xFF10b981),
                              iconColor: Colors.purple,
                            ),
                          ),
                        ],
                      ),
                    const SizedBox(height: 12),
                    const SizedBox(height: 12),
                    if (isMobile)
                      Column(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            child: _buildIntegrationCard(
                              'Jira',
                              'Re-auth needed',
                              LucideIcons.bug,
                              Colors.amber,
                              iconColor: Colors.red,
                            ),
                          ),
                          const SizedBox(height: 12),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) =>
                                    const IntegrationsManagerScreen(),
                              ),
                            ),
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              height: 110,
                              decoration: BoxDecoration(
                                color: AppTheme.surface.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: AppTheme.primary,
                                  // style: BorderStyle.dashed, TODO: find a way to make it work
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: const Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  CircleAvatar(
                                    radius: 18,
                                    backgroundColor: AppTheme.primary,
                                    child: Icon(
                                      LucideIcons.plus,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 8),
                                  Text(
                                    'Add Service',
                                    style: TextStyle(
                                      color: AppTheme.primary,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    else
                      Row(
                        children: [
                          Expanded(
                            child: _buildIntegrationCard(
                              'Jira',
                              'Re-auth needed',
                              LucideIcons.bug,
                              Colors.amber,
                              iconColor: Colors.red,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) =>
                                      const IntegrationsManagerScreen(),
                                ),
                              ),
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                height: 110,
                                decoration: BoxDecoration(
                                  color: AppTheme.surface.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                    color: AppTheme.primary,
                                    // style: BorderStyle.dashed, TODO: find a way to make it work
                                    style: BorderStyle.solid,
                                  ),
                                ),
                                child: const Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 18,
                                      backgroundColor: AppTheme.primary,
                                      child: Icon(
                                        LucideIcons.plus,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      'Add Service',
                                      style: TextStyle(
                                        color: AppTheme.primary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                    const SizedBox(height: 32),
                    const Text(
                      'ENVIRONMENTS',
                      style: TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 12),
                    _buildEnvironmentTile(
                      context,
                      'Production (US-East)',
                      'v4.2.0 • 12 Nodes',
                      const Color(0xFF10b981),
                    ),
                    const SizedBox(height: 8),
                    _buildEnvironmentTile(
                      context,
                      'Staging',
                      'v4.2.1-rc • 4 Nodes',
                      Colors.amber,
                    ),

                    const SizedBox(height: 32),
                    OutlinedButton.icon(
                      onPressed: () {},
                      icon: const Icon(LucideIcons.refreshCw, size: 16),
                      label: const Text('Reset to Defaults'),
                      style: OutlinedButton.styleFrom(
                        foregroundColor: AppTheme.error,
                        side: BorderSide(
                          color: AppTheme.error.withOpacity(0.5),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Center(
                      child: Text(
                        'System Version 2.4.0 (Build 8921)',
                        style: TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildSettingsTile(
    BuildContext context, {
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: iconColor.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: iconColor),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(
        subtitle,
        style: const TextStyle(color: AppTheme.textMuted, fontSize: 12),
      ),
      trailing: const Icon(
        LucideIcons.chevronRight,
        size: 16,
        color: AppTheme.textMuted,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }

  Widget _buildIntegrationCard(
    String name,
    String status,
    IconData icon,
    Color statusColor, {
    Color? iconColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      height: 110,
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceHighlight),
      ),
      child: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: AppTheme.background,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(icon, color: iconColor ?? Colors.white),
                ),
                const SizedBox(height: 8),
                Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  status,
                  style: const TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 10,
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: statusColor,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEnvironmentTile(
    BuildContext context,
    String name,
    String details,
    Color color,
  ) {
    return GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const EnvironmentSettingsScreen()),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.surfaceHighlight),
        ),
        child: Row(
          children: [
            Container(
              width: 4,
              height: 32,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                  Text(
                    details,
                    style: const TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 12,
                      fontFamily: 'monospace',
                    ),
                  ),
                ],
              ),
            ),
            const Icon(LucideIcons.settings, color: AppTheme.textMuted),
          ],
        ),
      ),
    );
  }
}
