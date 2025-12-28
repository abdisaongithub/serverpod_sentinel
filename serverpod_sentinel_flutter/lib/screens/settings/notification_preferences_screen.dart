import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Notification Preferences',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft),
          onPressed: () => Navigator.pop(context),
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
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'DELIVERY CHANNELS',
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
                  _buildToggleTile(
                    'Email Notifications',
                    'Digest and alerts',
                    LucideIcons.mail,
                    AppTheme.primary,
                    _emailEnabled,
                    (v) => setState(() => _emailEnabled = v),
                  ),
                  const Divider(height: 1, color: AppTheme.surfaceHighlight),
                  _buildToggleTile(
                    'Mobile Push',
                    'Critical alerts only',
                    LucideIcons.smartphone,
                    Colors.deepPurple,
                    _pushEnabled,
                    (v) => setState(() => _pushEnabled = v),
                  ),
                  const Divider(height: 1, color: AppTheme.surfaceHighlight),
                  _buildLinkTile(
                    'Slack Integration',
                    'Connected',
                    LucideIcons.messageSquare,
                    Colors.pink,
                    isConnected: true,
                  ),
                  const Divider(height: 1, color: AppTheme.surfaceHighlight),
                  _buildLinkTile(
                    'PagerDuty',
                    'Not configured',
                    LucideIcons.asterisk,
                    const Color(0xFF10b981),
                    isConnected: false,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Third-party integrations require admin API keys.',
              style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
            ),

            const SizedBox(height: 32),
            const Text(
              'ALERT SEVERITY',
              style: TextStyle(
                color: AppTheme.textMuted,
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1.2,
              ),
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
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Notify me on',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Icon(
                        LucideIcons.info,
                        size: 16,
                        color: AppTheme.textMuted,
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Container(
                    decoration: BoxDecoration(
                      color: AppTheme.background,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Expanded(child: _buildSegmentBtn('All', false)),
                        Expanded(child: _buildSegmentBtn('Incidents', false)),
                        Expanded(child: _buildSegmentBtn('Critical', true)),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: AppTheme.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(
                        color: AppTheme.primary.withOpacity(0.3),
                      ),
                    ),
                    child: const Text(
                      'Critical Only: You will only receive push notifications for P1 outages and security breaches. All other logs will be emailed.',
                      style: TextStyle(
                        fontSize: 12,
                        height: 1.4,
                        color: AppTheme.textMuted,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
            const Text(
              'SCHEDULE',
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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12,
                    ),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            LucideIcons.moon,
                            color: Colors.deepPurple,
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Quiet Hours',
                                style: TextStyle(fontWeight: FontWeight.bold),
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
                        ),
                        Switch(
                          value: _quietHoursEnabled,
                          onChanged: (v) =>
                              setState(() => _quietHoursEnabled = v),
                          activeColor: AppTheme.primary,
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1, color: AppTheme.surfaceHighlight),
                  Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              const Text(
                                'START',
                                style: TextStyle(
                                  color: AppTheme.textMuted,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '10:00 PM',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        height: 60,
                        color: AppTheme.surfaceHighlight,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: Column(
                            children: [
                              const Text(
                                'END',
                                style: TextStyle(
                                  color: AppTheme.textMuted,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                '7:00 AM',
                                style: TextStyle(fontSize: 20),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(LucideIcons.send, size: 16),
              label: const Text('Send Test Notification'),
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: AppTheme.surface,
                side: BorderSide.none,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleTile(
    String title,
    String subtitle,
    IconData icon,
    Color color,
    bool value,
    ValueChanged<bool> onChanged,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppTheme.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildLinkTile(
    String title,
    String status,
    IconData icon,
    Color color, {
    required bool isConnected,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: color),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Row(
        children: [
          if (isConnected)
            Container(
              width: 6,
              height: 6,
              decoration: const BoxDecoration(
                color: Color(0xFF10b981),
                shape: BoxShape.circle,
              ),
            ),
          if (isConnected) const SizedBox(width: 6),
          Text(
            status,
            style: TextStyle(
              color: isConnected ? const Color(0xFF10b981) : AppTheme.textMuted,
              fontSize: 12,
            ),
          ),
        ],
      ),
      trailing: isConnected
          ? const Icon(
              LucideIcons.chevronRight,
              size: 16,
              color: AppTheme.textMuted,
            )
          : TextButton(
              onPressed: () {},
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Setup'),
                  Icon(LucideIcons.chevronRight, size: 14),
                ],
              ),
            ),
    );
  }

  Widget _buildSegmentBtn(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.surfaceHighlight : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Center(
        child: Text(
          label,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isSelected ? Colors.white : AppTheme.textMuted,
          ),
        ),
      ),
    );
  }
}
