import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';

class AIInsightsScreen extends StatelessWidget {
  const AIInsightsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text('AI Insights', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(LucideIcons.dot, size: 24, color: Color(0xFF10b981)),
                Text(
                  'LIVE ANALYSIS',
                  style: TextStyle(
                    fontSize: 10,
                    color: AppTheme.textMuted,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(LucideIcons.filter)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppTheme.surfaceHighlight),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'SYSTEM HEALTH',
                              style: TextStyle(
                                color: AppTheme.textMuted,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              LucideIcons.checkCircle,
                              size: 16,
                              color: Color(0xFF10b981),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Text(
                              '94%',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '+2%',
                              style: TextStyle(
                                color: const Color(0xFF10b981),
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppTheme.surfaceHighlight),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'ANOMALIES',
                              style: TextStyle(
                                color: AppTheme.textMuted,
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              LucideIcons.alertTriangle,
                              size: 16,
                              color: Colors.orange,
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Text(
                              '3',
                              style: TextStyle(
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Text(
                              '+1 New',
                              style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 32),
            Row(
              children: [
                const Text(
                  'Suggested Root Causes',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'PRIORITY',
                    style: TextStyle(
                      color: AppTheme.primary,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),

            _buildInsightCard(
              title: 'Database Latency Spike',
              subtitle: 'Service: Order-API-v2',
              confidence: '92%',
              icon: LucideIcons.database,
              iconColor: AppTheme.error,
              content: Column(
                children: [
                  _buildAnalysisItem(
                    'Unoptimized query detected in',
                    'GET /products',
                    'from v2.4 deployment.',
                    actionLabel: 'View Query Logs',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _buildInsightCard(
              title: 'API Timeout Error',
              subtitle: 'Region: US-East-1',
              confidence: '85%',
              icon: LucideIcons.cloudOff,
              iconColor: Colors.orange,
              content: Column(
                children: [
                  _buildAnalysisItem(
                    'Abnormal traffic surge detected from 2 IP ranges correlating with recent marketing blast.',
                    '',
                    '',
                    actionLabel: 'Analyze Traffic Source',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Risk Predictions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'Next 24h',
                  style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 16),

            SizedBox(
              height: 160,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildRiskCard(
                    'Disk Exhaustion',
                    'Node-cluster-04',
                    'MEDIUM RISK',
                    'Projected to reach 95% capacity in 4 hours.',
                    Colors.orange,
                    0.7,
                  ),
                  const SizedBox(width: 16),
                  _buildRiskCard(
                    'Memory Leak',
                    'Service: Payment-Gateway',
                    'HIGH RISK',
                    'Heap usage increasing linearly; OOM predicted in 2 hours.',
                    AppTheme.error,
                    0.9,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),
            const Text(
              'Recommended Actions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            _buildActionCard(
              'Execute Rollback',
              'Reverting to last stable build (v2.3.9) is 95% likely to resolve the latency spike.',
              LucideIcons.rotateCcw,
              AppTheme.primary,
              'Rollback Service',
            ),
            const SizedBox(height: 16),
            _buildActionCard(
              'Scale Resources',
              'Pre-empt memory leak crash by scaling Payment-Gateway to 10 replicas temporarily.',
              LucideIcons.rocket,
              const Color(0xFF10b981),
              'Scale to 10',
            ),

            const SizedBox(height: 32),
            const Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    LucideIcons.shieldCheck,
                    size: 14,
                    color: AppTheme.textMuted,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'AI Insights verified by OpsGuard Engine v4.0',
                    style: TextStyle(color: AppTheme.textMuted, fontSize: 10),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }

  Widget _buildInsightCard({
    required String title,
    required String subtitle,
    required String confidence,
    required IconData icon,
    required Color iconColor,
    required Widget content,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.surfaceHighlight),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: iconColor),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
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
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    confidence,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const Text(
                    'Confidence',
                    style: TextStyle(color: AppTheme.textMuted, fontSize: 10),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppTheme.background,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.surfaceHighlight),
            ),
            child: content,
          ),
        ],
      ),
    );
  }

  Widget _buildAnalysisItem(
    String prefix,
    String highlight,
    String suffix, {
    required String actionLabel,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            style: const TextStyle(
              color: Color(0xFFe2e8f0),
              height: 1.5,
              fontSize: 13,
            ),
            children: [
              WidgetSpan(
                child: Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: Icon(
                    LucideIcons.sparkles,
                    size: 14,
                    color: AppTheme.primary,
                  ),
                ),
              ),
              TextSpan(text: prefix),
              if (highlight.isNotEmpty)
                TextSpan(
                  text: ' $highlight',
                  style: TextStyle(
                    color: AppTheme.primary,
                    fontFamily: 'monospace',
                  ),
                ),
              if (suffix.isNotEmpty) TextSpan(text: ' $suffix'),
            ],
          ),
        ),
        const SizedBox(height: 12),
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              Text(
                actionLabel,
                style: const TextStyle(
                  color: AppTheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              const SizedBox(width: 4),
              Icon(LucideIcons.arrowRight, size: 14, color: AppTheme.primary),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildRiskCard(
    String title,
    String subtitle,
    String tag,
    String desc,
    Color color,
    double progress,
  ) {
    return Container(
      width: 250,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceHighlight),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [color.withOpacity(0.1), AppTheme.surface],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(LucideIcons.trendingUp, size: 14, color: color),
              const SizedBox(width: 8),
              Text(
                tag,
                style: TextStyle(
                  color: color,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            subtitle,
            style: const TextStyle(color: AppTheme.textMuted, fontSize: 12),
          ),
          const Spacer(),
          LinearProgressIndicator(
            value: progress,
            color: color,
            backgroundColor: AppTheme.surfaceHighlight,
          ),
          const SizedBox(height: 12),
          Text(desc, style: const TextStyle(fontSize: 12, height: 1.4)),
        ],
      ),
    );
  }

  Widget _buildActionCard(
    String title,
    String desc,
    IconData icon,
    Color color,
    String btnLabel,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceHighlight),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  shape: BoxShape.circle,
                ),
                child: Icon(icon, color: color, size: 16),
              ),
              const SizedBox(width: 16),
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 42.0),
            child: Text(
              desc,
              style: const TextStyle(
                color: AppTheme.textMuted,
                height: 1.5,
                fontSize: 13,
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(LucideIcons.refreshCw, size: 16),
                  label: Text(btnLabel),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: color,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.surfaceHighlight),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(
                  LucideIcons.moreHorizontal,
                  color: AppTheme.textMuted,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
