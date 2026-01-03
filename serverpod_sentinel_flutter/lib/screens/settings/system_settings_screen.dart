import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';
import '../../widgets/app_sidebar.dart';

class SystemSettingsScreen extends StatefulWidget {
  const SystemSettingsScreen({super.key});

  @override
  State<SystemSettingsScreen> createState() => _SystemSettingsScreenState();
}

class _SystemSettingsScreenState extends State<SystemSettingsScreen> {
  bool _guardrailsEnabled = true;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < AppTheme.tabletBreakpoint;
        final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;

        return Scaffold(
          backgroundColor: AppTheme.background,
          drawer: isMobile
              ? const Drawer(
                  child: AppSidebar(activeRoute: AppRoutes.systemSettings),
                )
              : null,
          appBar: isMobile
              ? AppBar(
                  title: const Text(
                    'System Settings',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  backgroundColor: AppTheme.background,
                  elevation: 0,
                  actions: [
                    TextButton(
                      onPressed: () => context.pop(),
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
                )
              : null,
          body: Column(
            children: [
              if (isDesktop) _buildDesktopHeader(context),
              Expanded(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1200),
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(24.0),
                      child: isDesktop
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Left Column
                                Expanded(
                                  flex: 4,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
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
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          border: Border.all(
                                            color: AppTheme.surfaceHighlight,
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            _buildSettingsTile(
                                              context,
                                              title: 'Alert Policies',
                                              subtitle:
                                                  'Critical alerts: PagerDuty',
                                              icon: LucideIcons.bell,
                                              iconColor: Colors.blue,
                                              onTap: () => context.go(
                                                AppRoutes.notifications,
                                              ),
                                            ),
                                            const Divider(
                                              height: 1,
                                              color: AppTheme.surfaceHighlight,
                                            ),
                                            _buildSettingsTile(
                                              context,
                                              title: 'Delivery Channels',
                                              subtitle:
                                                  'Email, Slack, SMS enabled',
                                              icon: LucideIcons.mail,
                                              iconColor: Colors.purple,
                                              onTap: () => context.go(
                                                AppRoutes.notifications,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 32),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'ENVIRONMENTS',
                                            style: TextStyle(
                                              color: AppTheme.textMuted,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold,
                                              letterSpacing: 1.2,
                                            ),
                                          ),
                                          TextButton(
                                            onPressed: () {},
                                            child: const Text('Add New'),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 4),
                                      _buildEnvironmentTile(
                                        context,
                                        'Production (US-East)',
                                        '# v4.2.0   12 Nodes',
                                        const Color(0xFF10b981),
                                        isLive: true,
                                      ),
                                      const SizedBox(height: 12),
                                      _buildEnvironmentTile(
                                        context,
                                        'Staging',
                                        '# v4.2.1-rc   4 Nodes',
                                        Colors.amber,
                                        isBeta: true,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 24),
                                // Right Column
                                Expanded(
                                  flex: 6,
                                  child: Column(
                                    children: [
                                      _buildAutomationSafetyCard(),
                                      const SizedBox(height: 32),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
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
                                          TextButton.icon(
                                            onPressed: () {},
                                            icon: const Icon(
                                              LucideIcons.arrowRight,
                                              size: 16,
                                            ),
                                            label: const Text('Manage All'),
                                            style: TextButton.styleFrom(
                                              iconColor: AppTheme.primary,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(height: 12),
                                      GridView.count(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 16,
                                        mainAxisSpacing: 16,
                                        childAspectRatio: 1.5,
                                        children: [
                                          _buildIntegrationCard(
                                            'GitHub',
                                            'Connected',
                                            LucideIcons.github,
                                            const Color(0xFF10b981),
                                            footer: 'Last sync: 1m',
                                          ),
                                          _buildIntegrationCard(
                                            'AWS',
                                            'Synced (2m ago)',
                                            LucideIcons.cloud,
                                            const Color(0xFF10b981),
                                            iconColor: Colors.purple,
                                            footer: 'us-east-1',
                                          ),
                                          _buildIntegrationCard(
                                            'Jira',
                                            'Re-auth needed',
                                            LucideIcons.bug,
                                            Colors.amber,
                                            iconColor: Colors.red,
                                            footer: 'FIX NOW',
                                            footerColor: Colors.red,
                                          ),
                                          _buildAddServiceCard(context),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              // Mobile Layout
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextField(
                                  decoration: InputDecoration(
                                    hintText:
                                        'Search settings, integrations...',
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
                                const SizedBox(height: 32),
                                // ... Rest of mobile implementation (omitted for brevity, can reuse components)
                                // For now, mirroring desktop sections in vertical stack
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
                                    border: Border.all(
                                      color: AppTheme.surfaceHighlight,
                                    ),
                                  ),
                                  child: Column(
                                    children: [
                                      _buildSettingsTile(
                                        context,
                                        title: 'Alert Policies',
                                        subtitle: 'Critical alerts: PagerDuty',
                                        icon: LucideIcons.bell,
                                        iconColor: Colors.blue,
                                        onTap: () =>
                                            context.go(AppRoutes.notifications),
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
                                        iconColor: Colors.purple,
                                        onTap: () =>
                                            context.go(AppRoutes.notifications),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 32),
                                _buildAutomationSafetyCard(),
                                const SizedBox(height: 32),
                                // Integrations List
                                const Text(
                                  'INTEGRATIONS',
                                  style: TextStyle(
                                    color: AppTheme.textMuted,
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1.2,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                _buildIntegrationCard(
                                  'GitHub',
                                  'Connected',
                                  LucideIcons.github,
                                  const Color(0xFF10b981),
                                  footer: 'Last sync: 1m',
                                ),
                                const SizedBox(height: 12),
                                _buildIntegrationCard(
                                  'AWS',
                                  'Synced (2m ago)',
                                  LucideIcons.cloud,
                                  const Color(0xFF10b981),
                                  iconColor: Colors.purple,
                                  footer: 'us-east-1',
                                ),
                              ],
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildDesktopHeader(BuildContext context) {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: AppTheme.background,
        border: const Border(
          bottom: BorderSide(color: AppTheme.surfaceHighlight),
        ),
      ),
      child: Row(
        children: [
          const Text(
            'System Settings',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(width: 48),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search settings, integrations...',
                hintStyle: const TextStyle(color: AppTheme.textMuted),
                prefixIcon: const Icon(
                  LucideIcons.search,
                  color: AppTheme.textMuted,
                  size: 20,
                ),
                filled: true,
                fillColor: const Color(0xFF0F1219),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: AppTheme.surfaceHighlight,
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(
                    color: AppTheme.surfaceHighlight,
                  ),
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 0,
                  horizontal: 16,
                ),
              ),
            ),
          ),
          const SizedBox(width: 24),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(
              LucideIcons.helpCircle,
              size: 16,
              color: AppTheme.textMuted,
            ),
            label: const Text(
              'Documentation',
              style: TextStyle(color: AppTheme.textMuted),
            ),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppTheme.surfaceHighlight),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
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
    String? footer,
    Color? footerColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceHighlight),
      ),
      child: Stack(
        children: [
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.background,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor ?? Colors.white, size: 20),
              ),
              const SizedBox(height: 16),
              Text(
                name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                status,
                style: const TextStyle(color: AppTheme.textMuted, fontSize: 12),
              ),
              const Spacer(),
              if (footer != null) ...[
                const Divider(height: 24, color: AppTheme.surfaceHighlight),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      footer,
                      style: TextStyle(
                        color: footerColor ?? AppTheme.textMuted,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      LucideIcons.settings,
                      size: 14,
                      color: AppTheme.textDim,
                    ),
                  ],
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAddServiceCard(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go(AppRoutes.integrations),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.background.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppTheme.surfaceHighlight,
            style: BorderStyle.solid,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 20,
              backgroundColor: const Color(0xFF1E293B), // Match dark background
              child: const Icon(
                LucideIcons.plus,
                color: AppTheme.primary,
                size: 20,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Add Service',
              style: TextStyle(
                color: AppTheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 4),
            const Text(
              'Browse catalog',
              style: TextStyle(color: AppTheme.textMuted, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEnvironmentTile(
    BuildContext context,
    String name,
    String details,
    Color color, {
    bool isLive = false,
    bool isBeta = false,
  }) {
    return GestureDetector(
      onTap: () => context.go(AppRoutes.environmentSettings),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.surfaceHighlight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
                if (isLive)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFF10b981).withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'LIVE',
                      style: TextStyle(
                        color: Color(0xFF10b981),
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                if (isBeta)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.amber.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'BETA',
                      style: TextStyle(
                        color: Colors.amber,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
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
    );
  }

  Widget _buildAutomationSafetyCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.surfaceHighlight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
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
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF10b981).withOpacity(0.1),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(
                    color: const Color(0xFF10b981).withOpacity(0.2),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: const BoxDecoration(
                        color: Color(0xFF10b981),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    const Text(
                      'Active',
                      style: TextStyle(
                        color: Color(0xFF10b981),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.orange.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  LucideIcons.shieldAlert,
                  color: Colors.orange,
                  size: 24,
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
                        fontSize: 18,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Enforce safety checks on production environments.',
                      style: TextStyle(
                        color: AppTheme.textMuted.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    const Text(
                      'Enable Safety',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Switch(
                      value: _guardrailsEnabled,
                      onChanged: (v) => setState(() => _guardrailsEnabled = v),
                      activeColor: Colors.white,
                      activeTrackColor: AppTheme.primary,
                      inactiveTrackColor: AppTheme.surfaceHighlight,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          // Safety Level
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: AppTheme.background.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Safety Sensitivity Level',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Adjust the strictness of automation approvals.',
                          style: TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.primary.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: const Text(
                        'Standard',
                        style: TextStyle(
                          color: AppTheme.primary,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    trackHeight: 4,
                    activeTrackColor: AppTheme.primary,
                    inactiveTrackColor: AppTheme.surfaceHighlight,
                    thumbColor: AppTheme.primary,
                    thumbShape: const RoundSliderThumbShape(
                      enabledThumbRadius: 8,
                    ),
                    overlayShape: const RoundSliderOverlayShape(
                      overlayRadius: 0,
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
                  padding: EdgeInsets.symmetric(horizontal: 0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'PERMISSIVE',
                        style: TextStyle(
                          fontSize: 10,
                          color: AppTheme.textMuted,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'STANDARD',
                        style: TextStyle(
                          fontSize: 10,
                          color: AppTheme.textMuted,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'STRICT',
                        style: TextStyle(
                          fontSize: 10,
                          color: AppTheme.textMuted,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    const Icon(
                      LucideIcons.info,
                      size: 16,
                      color: AppTheme.primary,
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Standard Mode Active',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Manual approval is required for any destructive actions (DROP, DELETE) on production databases.',
                            style: TextStyle(
                              color: AppTheme.textMuted.withOpacity(0.8),
                              fontSize: 12,
                              height: 1.5,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
