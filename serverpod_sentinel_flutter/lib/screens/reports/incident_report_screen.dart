import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';

class IncidentReportScreen extends StatelessWidget {
  const IncidentReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Incident #921',
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
          IconButton(
            onPressed: () {},
            icon: const Icon(LucideIcons.printer),
            color: AppTheme.primary,
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Database Latency Spike',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                Row(
                  children: [
                    _buildStatusChip(
                      'CRITICAL',
                      AppTheme.error,
                      LucideIcons.alertTriangle,
                    ),
                    const SizedBox(width: 12),
                    _buildStatusChip(
                      'RESOLVED',
                      const Color(0xFF10b981),
                      LucideIcons.checkCircle,
                    ),
                  ],
                ),

                const SizedBox(height: 24),

                // Executive Summary
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
                      const Text(
                        'EXECUTIVE SUMMARY',
                        style: TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'A critical database latency spike occurred on the primary shard following the v2.4 deployment, causing a 15% increase in user timeouts. The incident was mitigated by rolling back to v2.3, restoring normal service levels within 45 minutes.',
                        style: TextStyle(
                          height: 1.5,
                          fontSize: 13,
                          color: Color(0xFFe2e8f0),
                        ),
                      ),
                      const SizedBox(height: 24),
                      Row(
                        children: [
                          Expanded(
                            child: _buildMetricItem(
                              'Start Time',
                              'Oct 12, 14:00 UTC',
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 40,
                            color: AppTheme.surfaceHighlight,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: _buildMetricItem(
                                'End Time',
                                'Oct 12, 14:45 UTC',
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      const Divider(color: AppTheme.surfaceHighlight),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: _buildMetricItem(
                              'Duration',
                              '45 minutes',
                              highlight: true,
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 40,
                            color: AppTheme.surfaceHighlight,
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 16.0),
                              child: _buildMetricItem(
                                'Impact',
                                '15% User Timeouts',
                                color: AppTheme.error,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),
                const Text(
                  'Timeline of Events',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                _buildTimelineEvent(
                  time: '14:00 UTC',
                  title: 'Alert Triggered',
                  desc:
                      'PagerDuty alert #4402 received for high latency on `primary-db-shard-01`.',
                  color: AppTheme.error,
                ),
                _buildTimelineEvent(
                  time: '14:10 UTC',
                  title: 'Engineering Response',
                  desc:
                      'On-call engineer acknowledged the alert and started investigation.',
                  color: AppTheme.primary,
                ),
                _buildTimelineEvent(
                  time: '14:30 UTC',
                  title: 'Root Cause Identified',
                  desc: 'Identified blocking queries from deployment v2.4.',
                  color: AppTheme.primary,
                ),
                _buildTimelineEvent(
                  time: '14:45 UTC',
                  title: 'Rolled Back & Resolved',
                  desc:
                      'Service rolled back to v2.3. Latency metrics returned to normal levels.',
                  color: const Color(0xFF10b981),
                  isLast: true,
                ),

                const SizedBox(height: 32),
                const Text(
                  'Root Cause Analysis',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.surfaceHighlight),
                  ),
                  child: RichText(
                    text: const TextSpan(
                      style: TextStyle(color: AppTheme.textMuted, height: 1.6),
                      children: [
                        TextSpan(
                          text:
                              'A non-performant SQL query was introduced in the ',
                        ),
                        TextSpan(
                          text: 'v2.4',
                          style: TextStyle(
                            backgroundColor: AppTheme.surfaceHighlight,
                            fontFamily: 'monospace',
                          ),
                        ),
                        TextSpan(
                          text:
                              ' release. This query lacked proper indexing for the ',
                        ),
                        TextSpan(
                          text: 'user_sessions',
                          style: TextStyle(
                            backgroundColor: AppTheme.surfaceHighlight,
                            fontFamily: 'monospace',
                          ),
                        ),
                        TextSpan(
                          text:
                              ' table, causing full table scans. Under high load, this triggered lock contention on the primary database shard, leading to a cascade of connection timeouts across the user authentication service.',
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 32),
                const Text(
                  'Associated Metrics or Data',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),

                // Chart Card
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Primary DB CPU Load',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              'Open Dashboard ↗',
                              style: TextStyle(
                                color: AppTheme.primary,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const Text(
                        'Spike correlates with v2.4 deployment.',
                        style: TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        height: 150,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildBar(20, AppTheme.surfaceHighlight),
                            _buildBar(25, AppTheme.surfaceHighlight),
                            _buildBar(35, AppTheme.primary.withOpacity(0.5)),
                            _buildBar(80, AppTheme.error),
                            _buildBar(100, AppTheme.error, label: '98% Load'),
                            _buildBar(60, AppTheme.error.withOpacity(0.5)),
                            _buildBar(25, AppTheme.surfaceHighlight),
                            _buildBar(20, AppTheme.surfaceHighlight),
                          ],
                        ),
                      ),
                      const SizedBox(height: 8),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '14:00 UTC',
                            style: TextStyle(
                              fontSize: 10,
                              color: AppTheme.textMuted,
                            ),
                          ),
                          Text(
                            '14:30 UTC',
                            style: TextStyle(
                              fontSize: 10,
                              color: AppTheme.textMuted,
                            ),
                          ),
                          Text(
                            '15:00 UTC',
                            style: TextStyle(
                              fontSize: 10,
                              color: AppTheme.textMuted,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Max Query Latency',
                                style: TextStyle(
                                  color: AppTheme.textMuted,
                                  fontSize: 10,
                                ),
                              ),
                              Row(
                                children: [
                                  const Text(
                                    '4,250ms',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    'High',
                                    style: TextStyle(
                                      color: AppTheme.error,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Affected Connections',
                                style: TextStyle(
                                  color: AppTheme.textMuted,
                                  fontSize: 10,
                                ),
                              ),
                              Row(
                                children: [
                                  const Text(
                                    '1,420',
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '+15%',
                                    style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),
                const Text(
                  'Lessons Learned',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.surface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.surfaceHighlight),
                  ),
                  child: Column(
                    children: [
                      _buildLessonItem(
                        'Load testing must include write-heavy scenarios for new endpoints.',
                      ),
                      const SizedBox(height: 16),
                      _buildLessonItem(
                        'Update DB Alert thresholds to trigger earlier on lock waits > 5s.',
                      ),
                      const SizedBox(height: 16),
                      _buildLessonItem(
                        'Improve automated rollback scripts to reduce manual intervention time.',
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          side: const BorderSide(
                            color: AppTheme.surfaceHighlight,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Request Changes'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          backgroundColor: AppTheme.primary,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          foregroundColor: Colors.white,
                        ),
                        child: const Text('Approve Report'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(String label, Color color, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMetricItem(
    String label,
    String value, {
    bool highlight = false,
    Color? color,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: AppTheme.textMuted, fontSize: 12),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
            color: color ?? (highlight ? Colors.white : Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildTimelineEvent({
    required String time,
    required String title,
    required String desc,
    required Color color,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              if (!isLast)
                Expanded(
                  child: Container(width: 2, color: AppTheme.surfaceHighlight),
                ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style: const TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    desc,
                    style: const TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBar(double height, Color color, {String? label}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 8,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        Container(
          width: 24,
          height: height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.vertical(top: Radius.circular(4)),
          ),
        ),
      ],
    );
  }

  Widget _buildLessonItem(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(top: 2.0),
          child: Icon(LucideIcons.mapPin, size: 16, color: AppTheme.primary),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(color: Color(0xFFe2e8f0), height: 1.4),
          ),
        ),
      ],
    );
  }
}
