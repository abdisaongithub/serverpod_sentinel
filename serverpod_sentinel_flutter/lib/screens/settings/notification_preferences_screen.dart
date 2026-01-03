import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_sidebar.dart';
import '../../routes.dart';

class NotificationPreferencesScreen extends StatefulWidget {
  const NotificationPreferencesScreen({super.key});

  @override
  State<NotificationPreferencesScreen> createState() =>
      _NotificationPreferencesScreenState();
}

class _NotificationPreferencesScreenState
    extends State<NotificationPreferencesScreen> {
  bool _emailEnabled = true;
  bool _pushEnabled = true;
  bool _quietHoursEnabled = false;

  // Additional state for new UI elements from HTML
  String _selectedSeverity = 'Critical Only';
  bool _slackConnected = true;
  bool _pagerDutyConnected = false;

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
                    padding: const EdgeInsets.all(32.0),
                    child: Center(
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1200),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildAlertSeverityCard(),
                            const SizedBox(height: 32),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: _buildDeliveryChannelsSection(),
                                ),
                                const SizedBox(width: 32),
                                Expanded(
                                  flex: 1,
                                  child: _buildScheduleSection(),
                                ),
                              ],
                            ),
                            const SizedBox(height: 32),
                            _buildFooterActions(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        // Mobile Layout (Adaptive version of original)
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Notification Preferences',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: Builder(
              builder: (context) => IconButton(
                icon: const Icon(LucideIcons.menu),
                onPressed: () => Scaffold.of(context).openDrawer(),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Save',
                  style: TextStyle(
                    color: AppTheme.primary,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          drawer: const Drawer(
            child: AppSidebar(activeRoute: AppRoutes.notifications),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildAlertSeverityCard(), // Reuse new card for mobile too
                const SizedBox(height: 24),
                _buildDeliveryChannelsSection(isMobile: true),
                const SizedBox(height: 24),
                _buildScheduleSection(),
                const SizedBox(height: 24),
                _buildFooterActions(isMobile: true),
              ],
            ),
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
        border: Border(
          bottom: BorderSide(color: AppTheme.surfaceHighlight, width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              Icon(
                LucideIcons.menu,
                color: AppTheme.textMuted,
              ), // Hidden on Desktop usually, but design kept title
              SizedBox(width: 16),
              Text(
                'Notification Preferences',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          Row(
            children: [
              TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  foregroundColor: AppTheme.textMuted,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                ),
                child: const Text('Discard Changes'),
              ),
              const SizedBox(width: 12),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Save Preferences',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAlertSeverityCard() {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceHighlight),
      ),
      child: Column(
        children: [
          Row(
            // Using Row but will wrap for mobile if needed, though simple enough
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      children: [
                        Icon(
                          LucideIcons.alertTriangle,
                          color: AppTheme.primary,
                          size: 20,
                        ),
                        SizedBox(width: 8),
                        Text(
                          'Alert Severity',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Configure which events trigger immediate push notifications to your devices.',
                      style: TextStyle(
                        color: AppTheme.textMuted.withOpacity(0.8),
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              // On narrower screens this might need to strictly be next to it or below.
              // For simplicity in this layout, we'll assume desktop width fits, specific mobile adaptation can just use Column.
            ],
          ),
          // For the "Notify me on" section, the HTML puts it side-by-side on large screens.
          // Let's implement the content part.
          const SizedBox(height: 24),
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    const Text(
                      'Notify me on:',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      decoration: BoxDecoration(
                        color: AppTheme.background,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          _buildSeverityBtn('All Events'),
                          _buildSeverityBtn('Incidents'),
                          _buildSeverityBtn('Critical Only'),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.blue.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.blue.withOpacity(0.2)),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        LucideIcons.info,
                        color: Colors.blue,
                        size: 18,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            style: const TextStyle(
                              fontSize: 13,
                              color: AppTheme.textMuted,
                            ),
                            children: [
                              const TextSpan(
                                text: 'Critical Only: ',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              TextSpan(
                                text:
                                    'You will only receive push notifications for P1 outages and security breaches. All other logs will be emailed in a daily digest.',
                                style: TextStyle(
                                  color: AppTheme.textMuted.withOpacity(0.8),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSeverityBtn(String label) {
    final isSelected = _selectedSeverity == label;
    return GestureDetector(
      onTap: () => setState(() => _selectedSeverity = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected
              ? AppTheme.surface
              : Colors.transparent, // Adjusted for dark theme match
          borderRadius: BorderRadius.circular(6),
          boxShadow: isSelected
              ? [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 2)]
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? (_selectedSeverity == 'Critical Only'
                      ? AppTheme.primary
                      : Colors.white)
                : AppTheme.textMuted,
            fontWeight: FontWeight.w500,
            fontSize: 13,
          ),
        ),
      ),
    );
  }

  Widget _buildDeliveryChannelsSection({bool isMobile = false}) {
    // Grid of cards
    final children = [
      _buildChannelCard(
        title: 'Email Notifications',
        subtitle: 'Digest and alerts sent to jane@devops.com',
        icon: LucideIcons.mail,
        iconBg: Colors.blue.withOpacity(0.2),
        iconColor: Colors.blue,
        trailing: Switch(
          value: _emailEnabled,
          onChanged: (v) => setState(() => _emailEnabled = v),
          activeColor: AppTheme.primary,
        ),
      ),
      _buildChannelCard(
        title: 'Mobile Push',
        subtitle: 'Instant alerts on connected iOS devices',
        icon: LucideIcons.smartphone,
        iconBg: Colors.indigo.withOpacity(0.2),
        iconColor: Colors.indigo,
        trailing: Switch(
          value: _pushEnabled,
          onChanged: (v) => setState(() => _pushEnabled = v),
          activeColor: AppTheme.primary,
        ),
      ),
      _buildChannelCard(
        title: 'Slack Integration',
        subtitle: 'Active in #devops-alerts',
        icon: LucideIcons.messageSquare,
        iconBg: const Color(0xFF4A154B).withOpacity(0.3),
        iconColor: const Color(0xFFE01E5A),
        trailing: const Icon(
          LucideIcons.arrowRight,
          size: 16,
          color: AppTheme.textMuted,
        ),
        statusBadge: _slackConnected ? 'Connected' : 'Not Configured',
        statusColor: _slackConnected
            ? const Color(0xFF10b981)
            : AppTheme.textMuted,
      ),
      _buildChannelCard(
        title: 'PagerDuty',
        subtitle: 'Escalate critical incidents',
        icon: LucideIcons.siren, // Emergency
        iconBg: const Color(0xFF10b981).withOpacity(0.2),
        iconColor: const Color(0xFF10b981),
        trailing: const Text(
          'Connect',
          style: TextStyle(
            color: AppTheme.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        statusBadge: _pagerDutyConnected ? 'Connected' : 'Not Configured',
        statusColor: _pagerDutyConnected
            ? const Color(0xFF10b981)
            : AppTheme.textMuted,
      ),
    ];

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'DELIVERY CHANNELS',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                  color: AppTheme.textMuted,
                ),
              ),
              Text(
                'Manage integrations',
                style: TextStyle(fontSize: 12, color: AppTheme.textMuted),
              ),
            ],
          ),
          const SizedBox(height: 16),
          ...children.map(
            (c) =>
                Padding(padding: const EdgeInsets.only(bottom: 16), child: c),
          ),
          const Text(
            '* Third-party integrations require admin API keys.',
            style: TextStyle(
              color: AppTheme.textMuted,
              fontSize: 12,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'DELIVERY CHANNELS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: AppTheme.textMuted,
              ),
            ),
            Text(
              'Manage integrations & endpoints',
              style: TextStyle(fontSize: 12, color: AppTheme.textMuted),
            ),
          ],
        ),
        const SizedBox(height: 16),
        GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          childAspectRatio: 1.5, // Aspect ratio to match card shape roughly
          children: children,
        ),
        const SizedBox(height: 16),
        const Text(
          '* Third-party integrations require admin API keys.',
          style: TextStyle(
            color: AppTheme.textMuted,
            fontSize: 12,
            fontStyle: FontStyle.italic,
          ),
        ),
      ],
    );
  }

  Widget _buildChannelCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required Widget trailing,
    String? statusBadge,
    Color? statusColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceHighlight),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: iconBg,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: iconColor, size: 20),
              ),
              if (statusBadge != null)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color:
                        statusColor?.withOpacity(0.1) ??
                        AppTheme.surfaceHighlight,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Row(
                    children: [
                      if (statusBadge == 'Connected') ...[
                        Container(
                          width: 6,
                          height: 6,
                          decoration: BoxDecoration(
                            color: statusColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 4),
                      ],
                      Text(
                        statusBadge,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              else
                trailing is Switch
                    ? trailing
                    : const SizedBox(), // If switch, show at top right? Design shows switch separate essentially
            ],
          ),
          if (trailing
              is! Switch) // If not switch, trailing might be "Connect" text or arrow, usually aligned bottom right or top right. Design varies.
            const SizedBox(height: 12),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              if (trailing is! Switch && statusBadge == null)
                trailing, // Just in case
              if (trailing is! Switch && statusBadge != null)
                trailing is Text ? trailing : const SizedBox(),
              if (trailing is Switch)
                const SizedBox(), // Already blocked out at top?
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'SCHEDULE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            color: AppTheme.textMuted,
          ),
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.surfaceHighlight),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.purple.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          LucideIcons.moon,
                          color: Colors.purple,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Quiet Hours',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            'Mute non-critical alerts',
                            style: TextStyle(
                              color: AppTheme.textMuted,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Switch(
                    value: _quietHoursEnabled,
                    onChanged: (v) => setState(() => _quietHoursEnabled = v),
                    activeColor: AppTheme.primary,
                  ),
                ],
              ),
              const SizedBox(height: 24),
              // Timeline vertical
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.background.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppTheme.surfaceHighlight),
                ),
                child: Column(
                  children: [
                    _buildTimeRow(LucideIcons.sunset, 'Start Time', '10:00 PM'),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Row(
                        children: [
                          const SizedBox(width: 24), // Center with icon
                          Expanded(
                            child: Container(
                              height: 1,
                              color: AppTheme.surfaceHighlight,
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              'until',
                              style: TextStyle(
                                fontSize: 10,
                                color: AppTheme.textMuted,
                              ),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              height: 1,
                              color: AppTheme.surfaceHighlight,
                            ),
                          ),
                        ],
                      ),
                    ),
                    _buildTimeRow(LucideIcons.sunrise, 'End Time', '07:00 AM'),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              const Row(
                children: [
                  Icon(LucideIcons.clock, size: 14, color: AppTheme.textMuted),
                  SizedBox(width: 8),
                  Text(
                    'Timezone: UTC-08:00 (PST)',
                    style: TextStyle(fontSize: 11, color: AppTheme.textMuted),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTimeRow(IconData icon, String label, String time) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, size: 16, color: AppTheme.textMuted),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.textMuted,
                    letterSpacing: 1,
                  ),
                ),
                Text(
                  time,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                    fontFamily: 'monospace',
                  ),
                ),
              ],
            ),
          ],
        ),
        const Icon(LucideIcons.pencil, size: 14, color: AppTheme.textDim),
      ],
    );
  }

  Widget _buildFooterActions({bool isMobile = false}) {
    if (isMobile) {
      return SizedBox(
        width: double.infinity,
        child: OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(LucideIcons.send, size: 16),
          label: const Text('Send Test Notification'),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 16),
            side: const BorderSide(color: AppTheme.surfaceHighlight),
          ),
        ),
      );
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(LucideIcons.send, size: 16),
          label: const Text('Send Test Notification'),
          style: OutlinedButton.styleFrom(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            side: const BorderSide(color: AppTheme.surfaceHighlight),
          ),
        ),
      ],
    );
  }
}
