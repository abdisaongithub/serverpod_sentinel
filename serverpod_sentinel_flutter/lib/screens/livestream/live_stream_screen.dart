import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';

class LiveStreamScreen extends StatelessWidget {
  const LiveStreamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Live Stream',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 8),
                Container(
                  width: 8,
                  height: 8,
                  decoration: const BoxDecoration(
                    color: AppTheme.success,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
            const Text(
              'OPS-PLATFORM-ALPHA',
              style: TextStyle(
                fontSize: 10,
                color: AppTheme.textMuted,
                letterSpacing: 1.2,
              ),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          const Icon(LucideIcons.search, color: AppTheme.textMuted),
          const SizedBox(width: 16),
          const Icon(LucideIcons.settings, color: AppTheme.textMuted),
          const SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          // Top Metrics
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildMetricCard(
                  context,
                  'SYS UPTIME',
                  '98.9%',
                  '+0.1%',
                  AppTheme.success,
                  LucideIcons.server,
                ),
                const SizedBox(width: 12),
                _buildMetricCard(
                  context,
                  'ACTIVE NODES',
                  '124',
                  '+2 New',
                  AppTheme.success,
                  LucideIcons.share2,
                ), // share2 as network nodes
                const SizedBox(width: 12),
                // Error rate card logic...
                _buildMetricCard(
                  context,
                  'ERROR RATE',
                  '0.02%',
                  '-0.01%',
                  AppTheme.success,
                  LucideIcons.alertOctagon,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Filters
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildFilterButton('ALL EVENTS', true, Colors.green),
                const SizedBox(width: 12),
                _buildFilterButton(
                  'CRITICAL',
                  false,
                  AppTheme.error,
                  hasDot: true,
                ),
                const SizedBox(width: 12),
                _buildFilterButton(
                  'WARNINGS',
                  false,
                  Colors.orange,
                  hasDot: true,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'FEED',
                  style: TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceHighlight,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'UTC-0',
                    style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // Stream List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildTimelineItem(
                  context,
                  type: 'CRITICAL',
                  time: '14:05:01.42',
                  title: 'Database Connection Timeout',
                  desc:
                      'Connection to shard 04 timed out after 5000ms. Retrying connection pool...',
                  color: AppTheme.error,
                  tags: ['DATABASE-SHARD-04', 'us-east-1a'],
                  showActions: true,
                ),
                _buildTimelineItem(
                  context,
                  type: 'WARNING',
                  time: '14:04:55.10',
                  title: 'Latency Spike Detected',
                  desc: '95th percentile latency exceeded 300ms threshold.',
                  color: Colors.orange,
                  tags: ['API-GATEWAY'],
                ),
                _buildTimelineItem(
                  context,
                  type: 'DEPLOYMENT',
                  time: '14:04:22.05',
                  title: 'Deployment Successful',
                  desc:
                      'v2.4.1 deployed to 12 instances. Health checks passing.',
                  color: const Color(0xFF3b82f6), // Blue
                  tags: ['AUTH-SERVICE'],
                  isSuccess: true,
                ),
                _buildTimelineItem(
                  context,
                  type: 'CRON JOB',
                  time: '14:04:10.00',
                  title: 'Daily Cleanup Completed',
                  desc: 'Temp files removed. 4.2GB space reclaimed.',
                  color: AppTheme.textMuted,
                  tags: ['SYSTEM'],
                ),
                _buildTimelineItem(
                  context,
                  type: 'AUTO SCALE',
                  time: '14:03:55.88',
                  title: 'Scale Down Event',
                  desc: 'Worker nodes scaled from 15 to 12.',
                  color: AppTheme.textMuted,
                  isMinimal: true,
                ),
                const SizedBox(height: 32),
                const Center(
                  child: Column(
                    children: [
                      Icon(
                        LucideIcons.refreshCw,
                        size: 24,
                        color: AppTheme.textMuted,
                      ),
                      SizedBox(height: 8),
                      Text(
                        'LISTENING FOR EVENTS...',
                        style: TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 10,
                          letterSpacing: 1.5,
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
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: AppTheme.success,
        child: const Icon(LucideIcons.pause, color: Colors.black),
      ),
    );
  }

  Widget _buildMetricCard(
    BuildContext context,
    String title,
    String value,
    String changes,
    Color changeColor,
    IconData icon,
  ) {
    return Container(
      width: 140,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.surface.withOpacity(0.5),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.surfaceHighlight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: AppTheme.textMuted,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(icon, size: 16, color: AppTheme.textMuted.withOpacity(0.5)),
            ],
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(
                changes.startsWith('+')
                    ? LucideIcons.arrowUp
                    : LucideIcons.arrowDown,
                size: 12,
                color: changeColor,
              ),
              Text(
                changes,
                style: TextStyle(
                  color: changeColor,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(
    String label,
    bool isSelected,
    Color color, {
    bool hasDot = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? color : AppTheme.surface,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(
          color: isSelected ? color : AppTheme.surfaceHighlight,
        ),
      ),
      child: Row(
        children: [
          if (hasDot) ...[
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            const SizedBox(width: 8),
          ],
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : AppTheme.textMuted,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem(
    BuildContext context, {
    required String type,
    required String time,
    required String title,
    required String desc,
    required Color color,
    List<String>? tags,
    bool showActions = false,
    bool isSuccess = false,
    bool isMinimal = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Timeline Line
          Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 4),
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: color, width: 2),
                  color: isSuccess ? color : Colors.transparent,
                ),
                child: isSuccess
                    ? const Center(
                        child: Icon(
                          LucideIcons.check,
                          size: 8,
                          color: Colors.white,
                        ),
                      )
                    : null,
              ),
              Expanded(
                child: Container(width: 1, color: AppTheme.surfaceHighlight),
              ),
            ],
          ),
          const SizedBox(width: 16),
          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppTheme.surface.withOpacity(
                    0.3,
                  ), // Very subtle background
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: color.withOpacity(0.2)),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            if (type != 'AUTO SCALE')
                              Icon(
                                type == 'CRITICAL'
                                    ? LucideIcons.alertCircle
                                    : type == 'WARNING'
                                    ? LucideIcons.alertTriangle
                                    : type == 'DEPLOYMENT'
                                    ? LucideIcons.rocket
                                    : LucideIcons.clock,
                                size: 14,
                                color: color,
                              ),
                            const SizedBox(width: 8),
                            Text(
                              type,
                              style: TextStyle(
                                color: color,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          time,
                          style: TextStyle(
                            color: AppTheme.textDim,
                            fontFamily: 'monospace',
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    if (tags != null) ...[
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 8,
                        children: tags
                            .map(
                              (tag) => Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                  vertical: 2,
                                ),
                                color: Colors.black26,
                                child: Text(
                                  tag,
                                  style: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                    color: AppTheme.textMuted,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                    const SizedBox(height: 8),
                    Text(
                      desc,
                      style: const TextStyle(
                        color: AppTheme.textMuted,
                        height: 1.4,
                      ),
                    ),

                    if (showActions) ...[
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppTheme.error,
                              side: BorderSide(
                                color: AppTheme.error.withOpacity(0.5),
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                            ),
                            child: const Text('Investigate'),
                          ),
                          const SizedBox(width: 12),
                          OutlinedButton(
                            onPressed: () {},
                            style: OutlinedButton.styleFrom(
                              foregroundColor: AppTheme.textMuted,
                              side: const BorderSide(
                                color: AppTheme.surfaceHighlight,
                              ),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 24,
                              ),
                            ),
                            child: const Text('View Logs'),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
