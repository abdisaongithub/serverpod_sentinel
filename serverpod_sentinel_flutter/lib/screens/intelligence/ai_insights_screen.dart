import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';

import '../../widgets/app_sidebar.dart';
import '../../routes.dart';

class AIInsightsScreen extends StatelessWidget {
  const AIInsightsScreen({super.key});

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
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildSummaryCards(isDesktop: true),
                        const SizedBox(height: 24),
                        _buildMainContent(isDesktop: true),
                        const SizedBox(height: 24),
                        _buildFooter(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        // Mobile Layout
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'AI Insights',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(LucideIcons.filter),
              ),
            ],
          ),
          drawer: const Drawer(
            child: AppSidebar(activeRoute: AppRoutes.aiInsights),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildLiveAnalysisBadge(),
                const SizedBox(height: 16),
                _buildSummaryCards(isDesktop: false),
                const SizedBox(height: 24),
                _buildMainContent(isDesktop: false),
                const SizedBox(height: 24),
                _buildFooter(),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDesktopHeader() {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: AppTheme.surface,
        border: Border(bottom: BorderSide(color: AppTheme.surfaceHighlight)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Text(
                'AI-Assisted Insights',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 16),
              Container(width: 1, height: 24, color: AppTheme.surfaceHighlight),
              const SizedBox(width: 16),
              _buildLiveAnalysisBadge(),
            ],
          ),
          Row(
            children: [
              const Text(
                'Last updated: ',
                style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
              ),
              const Text(
                'Just now',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              const SizedBox(width: 16),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  LucideIcons.refreshCw,
                  size: 20,
                  color: AppTheme.textMuted,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  LucideIcons.settings,
                  size: 20,
                  color: AppTheme.textMuted,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLiveAnalysisBadge() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF10b981).withOpacity(0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: const Color(0xFF10b981).withOpacity(0.2)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: Color(0xFF10b981),
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 8),
          const Text(
            'LIVE ANALYSIS',
            style: TextStyle(
              color: Color(0xFF10b981),
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSummaryCards({required bool isDesktop}) {
    final cards = [
      _buildStatCard(
        title: 'SYSTEM HEALTH',
        value: '94%',
        trend: '+2%',
        trendUp: true,
        icon: LucideIcons.checkCircle,
        iconColor: const Color(0xFF10b981),
        progressBar: _buildProgressBar(0.94, const Color(0xFF10b981)),
      ),
      _buildStatCard(
        title: 'ACTIVE ANOMALIES',
        value: '3',
        trend: '+1 New',
        trendUp: false, // bad trend
        icon: LucideIcons.alertTriangle,
        iconColor: Colors.orange,
        progressBar: Row(
          children: [
            Expanded(
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                  color: AppTheme.error,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(width: 2),
            Expanded(
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(width: 2),
            Expanded(
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ],
        ),
      ),
      _buildStatCard(
        title: 'AI ACCURACY SCORE',
        value: '98%',
        trend: 'Based on user feedback',
        trendUp: true,
        isSubtext: true,
        icon: LucideIcons.brainCircuit,
        iconColor: AppTheme.primary,
        progressBar: _buildProgressBar(0.98, AppTheme.primary),
        glow: true,
      ),
      _buildStatCard(
        title: 'SERVICES MONITORED',
        value: '142',
        trend: 'Across 4 regions',
        trendUp: true,
        isSubtext: true,
        icon: LucideIcons.server,
        iconColor: AppTheme.textMuted,
        progressBar: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Color(0xFF10b981),
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'ALL SYSTEMS OPERATIONAL',
              style: TextStyle(
                color: AppTheme.textMuted,
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    ];

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: cards[0]),
          const SizedBox(width: 16),
          Expanded(child: cards[1]),
          const SizedBox(width: 16),
          Expanded(child: cards[2]),
          const SizedBox(width: 16),
          Expanded(child: cards[3]),
        ],
      );
    } else {
      return Column(
        children: cards
            .map(
              (c) =>
                  Padding(padding: const EdgeInsets.only(bottom: 16), child: c),
            )
            .toList(),
      );
    }
  }

  Widget _buildStatCard({
    required String title,
    required String value,
    required String trend,
    required bool trendUp,
    required IconData icon,
    required Color iconColor,
    required Widget progressBar,
    bool isSubtext = false,
    bool glow = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      height: 140,
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceHighlight),
        boxShadow: glow
            ? [
                BoxShadow(
                  color: AppTheme.primary.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 4),
                ),
              ]
            : null,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  color: AppTheme.textMuted,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: iconColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Icon(icon, size: 16, color: iconColor),
              ),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: isSubtext
                    ? Text(
                        trend,
                        style: const TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    : Row(
                        children: [
                          if (!isSubtext && trendUp)
                            Icon(
                              LucideIcons.arrowUp,
                              size: 14,
                              color: iconColor,
                            ),
                          Text(
                            trend,
                            style: TextStyle(
                              color: trendUp ? iconColor : iconColor,
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
              ),
            ],
          ),
          progressBar,
        ],
      ),
    );
  }

  Widget _buildProgressBar(double value, Color color) {
    return Stack(
      children: [
        Container(
          height: 4,
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppTheme.surfaceHighlight,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        FractionallySizedBox(
          widthFactor: value,
          child: Container(
            height: 4,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMainContent({required bool isDesktop}) {
    final leftContent = Column(
      children: [
        _buildRootCausesSection(),
        const SizedBox(height: 32),
        _buildRiskPredictionsSection(isDesktop: isDesktop),
      ],
    );

    final rightContent = _buildRecommendedActionsSection();

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: leftContent),
          const SizedBox(width: 24),
          Expanded(flex: 1, child: rightContent),
        ],
      );
    } else {
      return Column(
        children: [leftContent, const SizedBox(height: 32), rightContent],
      );
    }
  }

  Widget _buildRootCausesSection() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Icon(LucideIcons.siren, color: AppTheme.error, size: 20),
                SizedBox(width: 8),
                Text(
                  'Suggested Root Causes',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'View All Incidents',
                style: TextStyle(
                  color: AppTheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildInsightCard(
          title: 'Database Latency Spike',
          subtitle: 'Order-API-v2',
          time: '15 mins ago',
          confidence: '92%',
          icon: LucideIcons.database,
          iconBg: AppTheme.error.withOpacity(0.1),
          iconColor: AppTheme.error,
          borderColor: AppTheme.error,
          content: RichText(
            text: TextSpan(
              style: const TextStyle(color: AppTheme.text, fontSize: 14),
              children: [
                const TextSpan(
                  text: 'Insight: ',
                  style: TextStyle(
                    color: AppTheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: 'Unoptimized query detected in '),
                TextSpan(
                  text: 'GET /products',
                  style: TextStyle(
                    backgroundColor: AppTheme.surfaceHighlight,
                    fontFamily: 'monospace',
                    fontSize: 12,
                  ),
                ),
                const TextSpan(
                  text: ' endpoint introduced in v2.4 deployment.',
                ),
              ],
            ),
          ),
          actions: [
            _buildLink(LucideIcons.code, 'View Query Logs'),
            const SizedBox(width: 16),
            _buildLink(
              LucideIcons.history,
              'Compare Deployments',
              color: AppTheme.textMuted,
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildInsightCard(
          title: 'API Timeout Error',
          subtitle: 'Region: US-East-1',
          time: '42 mins ago',
          confidence: '85%',
          icon: LucideIcons.cloudOff,
          iconBg: Colors.orange.withOpacity(0.1),
          iconColor: Colors.orange,
          borderColor: Colors.orange,
          content: RichText(
            text: const TextSpan(
              style: TextStyle(color: AppTheme.text, fontSize: 14),
              children: [
                TextSpan(
                  text: 'Insight: ',
                  style: TextStyle(
                    color: AppTheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(
                  text:
                      'Abnormal traffic surge detected from 2 IP ranges correlating with recent marketing blast.',
                ),
              ],
            ),
          ),
          actions: [_buildLink(LucideIcons.globe, 'Analyze Traffic Source')],
        ),
      ],
    );
  }

  Widget _buildInsightCard({
    required String title,
    required String subtitle,
    required String time,
    required String confidence,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required Color borderColor,
    required Widget content,
    required List<Widget> actions,
  }) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceHighlight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(width: 4, color: borderColor),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: iconBg,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Icon(icon, color: iconColor, size: 24),
                              ),
                              const SizedBox(width: 16),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      title,
                                      style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(height: 4),
                                    Row(
                                      children: [
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 6,
                                            vertical: 2,
                                          ),
                                          decoration: BoxDecoration(
                                            color: AppTheme.surfaceHighlight,
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                          ),
                                          child: Text(
                                            subtitle,
                                            style: const TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'monospace',
                                            ),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                          child: Text(
                                            '•',
                                            style: TextStyle(
                                              color: AppTheme.textMuted,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          time,
                                          style: const TextStyle(
                                            color: AppTheme.textMuted,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(
                              color: AppTheme.primary.withOpacity(0.2),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                LucideIcons.sparkles,
                                size: 14,
                                color: AppTheme.primary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '$confidence Confidence',
                                style: const TextStyle(
                                  color: AppTheme.primary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(16),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: AppTheme.background,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: AppTheme.surfaceHighlight),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          content,
                          const SizedBox(height: 12),
                          Row(children: actions),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildLink(
    IconData icon,
    String label, {
    Color color = AppTheme.primary,
  }) {
    return InkWell(
      onTap: () {},
      child: Row(
        children: [
          Icon(icon, size: 14, color: color),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRiskPredictionsSection({required bool isDesktop}) {
    final risks = [
      _buildRiskCard(
        title: 'Disk Exhaustion',
        subtitle: 'Node-cluster-04',
        riskLevel: 'Medium Risk',
        riskColor: Colors.orange,
        currentValue: '78%',
        prediction: 'Projected 95% in 4 hours.',
        icon: LucideIcons.trendingUp,
      ),
      _buildRiskCard(
        title: 'Memory Leak',
        subtitle: 'Payment-Gateway',
        riskLevel: 'High Risk',
        riskColor: AppTheme.error,
        currentValue: 'Linear Growth',
        prediction: 'Crash predicted in 2 hours.',
        icon: LucideIcons.memoryStick,
      ),
      _buildRiskCard(
        title: 'Cert Expiry',
        subtitle: 'Load Balancer',
        riskLevel: 'Low Risk',
        riskColor: AppTheme.textMuted,
        currentValue: '14 Days Left',
        prediction: 'Renewal automated scheduled for Saturday.',
        icon: LucideIcons.shieldAlert,
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Icon(LucideIcons.barChart2, color: AppTheme.primary, size: 20),
                SizedBox(width: 8),
                Text(
                  'Risk Predictions',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 8),
                Text(
                  '(Next 24 Hours)',
                  style: TextStyle(color: AppTheme.textMuted, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        isDesktop
            ? Row(
                children: [
                  Expanded(child: risks[0]),
                  const SizedBox(width: 16),
                  Expanded(child: risks[1]),
                  const SizedBox(width: 16),
                  Expanded(child: risks[2]),
                ],
              )
            : Column(
                children: risks
                    .map(
                      (r) => Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: r,
                      ),
                    )
                    .toList(),
              ),
      ],
    );
  }

  Widget _buildRiskCard({
    required String title,
    required String subtitle,
    required String riskLevel,
    required Color riskColor,
    required String currentValue,
    required String prediction,
    required IconData icon,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceHighlight),
        boxShadow: [
          BoxShadow(
            color: riskColor.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            right: -10,
            top: -10,
            child: Icon(icon, size: 80, color: riskColor.withOpacity(0.05)),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(icon, size: 16, color: riskColor),
                  const SizedBox(width: 8),
                  Text(
                    riskLevel.toUpperCase(),
                    style: TextStyle(
                      color: riskColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(color: AppTheme.textMuted, fontSize: 12),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Current',
                    style: TextStyle(color: AppTheme.textMuted, fontSize: 10),
                  ),
                  Text(
                    currentValue,
                    style: TextStyle(
                      color: riskColor,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: LinearProgressIndicator(
                  value: 0.75,
                  color: riskColor,
                  backgroundColor: AppTheme.surfaceHighlight,
                  minHeight: 4,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                prediction,
                style: const TextStyle(fontSize: 12, height: 1.4),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedActionsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(LucideIcons.listChecks, color: Color(0xFF10b981), size: 20),
            SizedBox(width: 8),
            Text(
              'Recommended Actions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildActionCard(
          title: 'Execute Rollback',
          subtitle: 'High Priority',
          subtitleBg: AppTheme.error.withOpacity(0.1),
          subtitleColor: AppTheme.error,
          icon: LucideIcons.history,
          iconBg: Colors.blue.withOpacity(0.1),
          iconColor: Colors.blue,
          desc: RichText(
            text: TextSpan(
              style: const TextStyle(
                color: AppTheme.textMuted,
                fontSize: 13,
                height: 1.5,
              ),
              children: [
                const TextSpan(text: 'Revert to stable build '),
                TextSpan(
                  text: 'v2.3.9',
                  style: TextStyle(
                    backgroundColor: AppTheme.surfaceHighlight,
                    fontFamily: 'monospace',
                    fontSize: 12,
                  ),
                ),
                const TextSpan(
                  text:
                      '. AI predicts 95% probability of resolving latency spike.',
                ),
              ],
            ),
          ),
          primaryAction: ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(LucideIcons.rotateCcw, size: 16),
            label: const Text('Rollback Service'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        _buildActionCard(
          title: 'Scale Resources',
          subtitle: 'Medium Priority',
          subtitleBg: Colors.orange.withOpacity(0.1),
          subtitleColor: Colors.orange,
          icon: LucideIcons.rocket,
          iconBg: const Color(0xFF10b981).withOpacity(0.1),
          iconColor: const Color(0xFF10b981),
          desc: RichText(
            text: const TextSpan(
              style: TextStyle(
                color: AppTheme.textMuted,
                fontSize: 13,
                height: 1.5,
              ),
              children: [
                TextSpan(text: 'Pre-empt memory leak crash by scaling '),
                TextSpan(
                  text: 'Payment-Gateway',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.text,
                  ),
                ),
                TextSpan(text: ' to 10 replicas.'),
              ],
            ),
          ),
          primaryAction: Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(LucideIcons.plusCircle, size: 16),
                  label: const Text('Scale'),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    side: const BorderSide(color: AppTheme.surfaceHighlight),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 48,
                height: 48,
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
        ),
        const SizedBox(height: 16),
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.surfaceHighlight),
            // opacity would be applied to content or color
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.textMuted.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  LucideIcons.bellOff,
                  size: 16,
                  color: AppTheme.textMuted,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Snooze Alerts',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Pause for maintenance window',
                      style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const Icon(LucideIcons.chevronRight, color: AppTheme.textMuted),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionCard({
    required String title,
    required String subtitle,
    required Color subtitleBg,
    required Color subtitleColor,
    required IconData icon,
    required Color iconBg,
    required Color iconColor,
    required Widget desc,
    required Widget primaryAction,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceHighlight),
        boxShadow: [
          BoxShadow(
            color: AppTheme.primary.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: iconBg,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(icon, color: iconColor, size: 20),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 6,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: subtitleBg,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            subtitle.toUpperCase(),
                            style: TextStyle(
                              color: subtitleColor,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                desc,
                const SizedBox(height: 16),
                SizedBox(width: double.infinity, child: primaryAction),
              ],
            ),
          ),
          if (title.contains('Rollback')) // Special case for footer
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8),
              decoration: const BoxDecoration(
                border: Border(
                  top: BorderSide(color: AppTheme.surfaceHighlight),
                ),
                color: Color(0x33000000), // Darker bg
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(LucideIcons.eye, size: 14, color: AppTheme.textMuted),
                  SizedBox(width: 6),
                  Text(
                    'View Rollback Simulation',
                    style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return const Column(
      children: [
        Divider(color: AppTheme.surfaceHighlight),
        SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Icon(
                  LucideIcons.shieldCheck,
                  size: 16,
                  color: AppTheme.primary,
                ),
                SizedBox(width: 8),
                Text(
                  'AI Insights verified by OpsGuard Engine v4.0',
                  style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Feedback',
                  style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
                ),
                SizedBox(width: 16),
                Text(
                  'Documentation',
                  style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
                ),
                SizedBox(width: 16),
                Text(
                  'Privacy',
                  style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
