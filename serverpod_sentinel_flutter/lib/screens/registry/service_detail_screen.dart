import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';

class ServiceDetailScreen extends StatelessWidget {
  const ServiceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Auth-Service-v4'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.chevronLeft),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: const Icon(LucideIcons.settings), onPressed: () {}),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Header Shield
                Center(
                  child: Container(
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: const Color(
                        0xFF1e3a8a,
                      ).withOpacity(0.3), // Dark blue
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(color: const Color(0xFF1e3a8a)),
                    ),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        const Icon(
                          LucideIcons.shieldCheck,
                          size: 48,
                          color: Color(0xFF3b82f6),
                        ), // Blue 500
                        Positioned(
                          right: 12,
                          bottom: 12,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: AppTheme.success,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppTheme.background,
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  '99.99% Uptime',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'us-east-1a • Production',
                  style: TextStyle(color: AppTheme.textMuted),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.success.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppTheme.success.withOpacity(0.3),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        LucideIcons.checkCircle,
                        size: 14,
                        color: AppTheme.success,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'SYSTEM HEALTHY',
                        style: TextStyle(
                          color: AppTheme.success,
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Live Metrics
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Live Metrics',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Text(
                      'View History',
                      style: TextStyle(color: AppTheme.primary, fontSize: 12),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                SizedBox(
                  height: 160,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      _buildMetricCard(
                        context,
                        'CPU',
                        '45%',
                        'Avg 42% last hr',
                        LucideIcons.cpu,
                        const Color(0xFF3b82f6),
                      ),
                      const SizedBox(width: 12),
                      _buildMetricCard(
                        context,
                        'RAM',
                        '1.2_GB',
                        'Peak 1.5GB',
                        LucideIcons.server,
                        const Color(0xFFa855f7),
                      ), // Purple
                      const SizedBox(width: 12),
                      _buildMetricCard(
                        context,
                        'RPS',
                        '0.8_k',
                        'Warnings 2',
                        LucideIcons.activity,
                        AppTheme.success,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                // Tabs (Alerts/Incidents)
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.surfaceHighlight),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                            color: AppTheme.surfaceHighlight,
                            borderRadius: BorderRadius.circular(11),
                          ),
                          child: const Center(
                            child: Text(
                              'Active Alerts',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            'Recent Incidents',
                            style: TextStyle(color: AppTheme.textMuted),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),

                _buildAlertItem(
                  'High Latency Warning',
                  'Pod-452 • 2 mins ago',
                  LucideIcons.alertTriangle,
                  AppTheme.error,
                ),
                _buildAlertItem(
                  'API Throttling 90%',
                  'Gateway • 15 mins ago',
                  LucideIcons.alertTriangle,
                  Colors.orange,
                ),

                const SizedBox(height: 32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'QUICK PLAYBOOKS',
                      style: const TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 12,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Icon(
                      LucideIcons.moreHorizontal,
                      color: AppTheme.textMuted,
                      size: 16,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          LucideIcons.rotateCcw,
                          size: 16,
                          color: AppTheme.error,
                        ),
                        label: const Text(
                          'Restart',
                          style: TextStyle(color: AppTheme.error),
                        ),
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(
                            color: AppTheme.error.withOpacity(0.5),
                          ),
                          backgroundColor: AppTheme.error.withOpacity(0.1),
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(LucideIcons.terminal, size: 16),
                        label: const Text('View Logs & Traces'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.surface,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      _buildInfoRow('Owner', 'Team Security'),
                      const Divider(
                        color: AppTheme.surfaceHighlight,
                        height: 24,
                      ),
                      _buildInfoRow(
                        'Repository',
                        'github.com/org/auth',
                        isLink: true,
                      ),
                      const Divider(
                        color: AppTheme.surfaceHighlight,
                        height: 24,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'View Dependencies',
                            style: TextStyle(
                              color: AppTheme.primary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            LucideIcons.externalLink,
                            size: 16,
                            color: AppTheme.primary,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMetricCard(
    BuildContext context,
    String title,
    String value,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    // Process value for rich text (e.g. 1.2_GB)
    List<TextSpan> valueSpans = [];
    if (value.contains('_')) {
      final parts = value.split('_');
      valueSpans.add(
        TextSpan(
          text: parts[0],
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
      valueSpans.add(
        TextSpan(
          text: parts[1],
          style: TextStyle(fontSize: 16, color: AppTheme.textMuted),
        ),
      );
    } else {
      valueSpans.add(
        TextSpan(
          text: value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      );
    }

    return Container(
      width: 140,
      padding: const EdgeInsets.all(16),
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
              Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(icon, size: 16, color: color),
              ),
              Text(
                title,
                style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 16),
          RichText(text: TextSpan(children: valueSpans)),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(color: AppTheme.textMuted, fontSize: 10),
          ),
          const Spacer(),
          // Bar Chart Simulation
          Row(
            children: List.generate(
              5,
              (index) => Expanded(
                child: Container(
                  height: (index % 2 == 0 ? 12 : 20)
                      .toDouble(), // Random heights
                  margin: const EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.3 + (index * 0.1)),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAlertItem(
    String title,
    String subtitle,
    IconData icon,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceHighlight),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, color: color, size: 20),
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
                  style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
                ),
              ],
            ),
          ),
          const Icon(
            LucideIcons.chevronRight,
            color: AppTheme.textMuted,
            size: 16,
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, {bool isLink = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: AppTheme.textMuted)),
        Row(
          children: [
            if (isLink)
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  LucideIcons.gitBranch,
                  size: 14,
                  color: AppTheme.textMuted,
                ),
              ),
            Text(
              value,
              style: TextStyle(
                color: isLink ? Colors.white : Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
