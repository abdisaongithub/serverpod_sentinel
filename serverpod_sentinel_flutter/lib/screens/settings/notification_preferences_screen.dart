import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';

import 'package:go_router/go_router.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_sidebar.dart';
import '../../routes.dart';
import '../../providers/settings_provider.dart';
import '../../providers/local_settings_provider.dart';
import '../../services/serverpod_client.dart';

class NotificationPreferencesScreen extends ConsumerStatefulWidget {
  const NotificationPreferencesScreen({super.key});

  @override
  ConsumerState<NotificationPreferencesScreen> createState() =>
      _NotificationPreferencesScreenState();
}

class _NotificationPreferencesScreenState
    extends ConsumerState<NotificationPreferencesScreen> {
  // Use signedInUser ID or fallback to 1 for development/bypass mode
  int get _userId =>
      ServerpodClientSingleton.sessionManager.signedInUser?.id ?? 1;

  @override
  Widget build(BuildContext context) {
    // If we want to strictly enforce auth, we'd check here.
    // But since we have a fallback, we proceed.

    final prefsAsync = ref.watch(notificationPreferencesProvider(_userId));
    final channelsAsync = ref.watch(notificationChannelsProvider);
    final localSettingsAsync = ref.watch(localSettingsProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;

        // Define content based on async data
        final Widget content = channelsAsync.when(
          data: (channels) => prefsAsync.when(
            data: (prefs) => localSettingsAsync.when(
              data: (localSettings) {
                // Helper to check if a channel is enabled
                bool isEnabled(String channel) {
                  final p = prefs
                      .where((p) => p.channel == channel)
                      .firstOrNull;
                  return p?.enabled ?? false;
                }

                // Apply UI state
                final emailEnabled = isEnabled('email');
                final pushEnabled = isEnabled('push');
                final slackEnabled = isEnabled('slack');
                final pagerDutyEnabled = isEnabled('pagerduty');

                return isDesktop
                    ? _buildDesktopLayout(
                        emailEnabled,
                        pushEnabled,
                        slackEnabled,
                        pagerDutyEnabled,
                        channels,
                        localSettings,
                      )
                    : _buildMobileLayout(
                        emailEnabled,
                        pushEnabled,
                        slackEnabled,
                        pagerDutyEnabled,
                        channels,
                        localSettings,
                      );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, s) =>
                  Center(child: Text('Error loading local settings: $e')),
            ),
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, s) =>
                Center(child: Text('Error loading preferences: $e')),
          ),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, s) => Center(child: Text('Error loading channels: $e')),
        );

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
                        child: content,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }

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
          ),
          drawer: const Drawer(
            child: AppSidebar(activeRoute: AppRoutes.notifications),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: content,
          ),
        );
      },
    );
  }

  Widget _buildDesktopLayout(
    bool email,
    bool push,
    bool slack,
    bool pagerDuty,
    List<String> availableChannels,
    LocalSettingsState localSettings,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAlertSeverityCard(localSettings),
        const SizedBox(height: 32),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 2,
              child: _buildDeliveryChannelsSection(
                email,
                push,
                slack,
                pagerDuty,
                availableChannels,
              ),
            ),
            const SizedBox(width: 32),
            Expanded(flex: 1, child: _buildScheduleSection(localSettings)),
          ],
        ),
      ],
    );
  }

  Widget _buildMobileLayout(
    bool email,
    bool push,
    bool slack,
    bool pagerDuty,
    List<String> availableChannels,
    LocalSettingsState localSettings,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildAlertSeverityCard(localSettings),
        const SizedBox(height: 24),
        _buildDeliveryChannelsSection(
          email,
          push,
          slack,
          pagerDuty,
          availableChannels,
          isMobile: true,
        ),
        const SizedBox(height: 24),
        _buildScheduleSection(localSettings),
      ],
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
          IconButton(
            onPressed: () => context.pop(),
            icon: const Icon(LucideIcons.x),
            tooltip: 'Close',
          ),
        ],
      ),
    );
  }

  Widget _buildAlertSeverityCard(LocalSettingsState settings) {
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
            ],
          ),
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
                          _buildSeverityBtn(
                            'All Events',
                            settings.alertSeverity,
                          ),
                          _buildSeverityBtn(
                            'Incidents',
                            settings.alertSeverity,
                          ),
                          _buildSeverityBtn(
                            'Critical Only',
                            settings.alertSeverity,
                          ),
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

  Widget _buildSeverityBtn(String label, String currentSelection) {
    final isSelected = currentSelection == label;
    return GestureDetector(
      onTap: () =>
          ref.read(localSettingsProvider.notifier).setAlertSeverity(label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppTheme.surface : Colors.transparent,
          borderRadius: BorderRadius.circular(6),
          boxShadow: isSelected
              ? [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 2)]
              : null,
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected
                ? (currentSelection == 'Critical Only'
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

  Widget _buildDeliveryChannelsSection(
    bool email,
    bool push,
    bool slack,
    bool pagerDuty,
    List<String> availableChannels, {
    bool isMobile = false,
  }) {
    Future<void> toggle(String channel, bool val) async {
      await ref
          .read(settingsMutationProvider.notifier)
          .toggleNotificationChannel(_userId, channel, val);
    }

    // Grid of cards
    final children = [
      _buildChannelCard(
        title: 'Email Notifications',
        subtitle: 'Digest and alerts',
        icon: LucideIcons.mail,
        iconBg: Colors.blue.withOpacity(0.2),
        iconColor: Colors.blue,
        trailing: Switch(
          value: email,
          onChanged: (v) => toggle('email', v),
          activeColor: AppTheme.primary,
        ),
      ),
      _buildChannelCard(
        title: 'Mobile Push',
        subtitle: 'Instant alerts',
        icon: LucideIcons.smartphone,
        iconBg: Colors.indigo.withOpacity(0.2),
        iconColor: Colors.indigo,
        trailing: Switch(
          value: push,
          onChanged: (v) => toggle('push', v),
          activeColor: AppTheme.primary,
        ),
      ),
      _buildChannelCard(
        title: 'Slack Integration',
        subtitle: slack ? 'Active' : 'Disabled',
        icon: LucideIcons.messageSquare,
        iconBg: const Color(0xFF4A154B).withOpacity(0.3),
        iconColor: const Color(0xFFE01E5A),
        trailing: Switch(
          value: slack,
          onChanged: (v) => toggle('slack', v),
          activeColor: AppTheme.primary,
        ),
        statusBadge: slack ? 'Connected' : null,
        statusColor: slack ? const Color(0xFF10b981) : null,
      ),
      _buildChannelCard(
        title: 'PagerDuty',
        subtitle: pagerDuty ? 'Escalations Active' : 'Disabled',
        icon: LucideIcons.siren,
        iconBg: const Color(0xFF10b981).withOpacity(0.2),
        iconColor: const Color(0xFF10b981),
        trailing: Switch(
          value: pagerDuty,
          onChanged: (v) => toggle('pagerduty', v),
          activeColor: AppTheme.primary,
        ),
        statusBadge: pagerDuty ? 'Connected' : null,
        statusColor: pagerDuty ? const Color(0xFF10b981) : null,
      ),
    ];

    final content = isMobile
        ? Column(
            children: children
                .map(
                  (c) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: c,
                  ),
                )
                .toList(),
          )
        : GridView.count(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1.5,
            children: children,
          );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'DELIVERY CHANNELS',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                color: AppTheme.textMuted,
              ),
            ),
            TextButton(
              onPressed: () => context.go(AppRoutes.integrations),
              child: const Text(
                'Manage integrations',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        content,
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
                      Container(
                        width: 6,
                        height: 6,
                        decoration: BoxDecoration(
                          color: statusColor,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 4),
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
                Container(),
            ],
          ),
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
              trailing,
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildScheduleSection(LocalSettingsState settings) {
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
                    value: settings.quietHoursEnabled,
                    onChanged: (v) => ref
                        .read(localSettingsProvider.notifier)
                        .setQuietHoursEnabled(v),
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
}
