import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_sidebar.dart';
import '../../routes.dart';
import '../../providers/ai_insights_provider.dart';

class AIInsightsScreen extends ConsumerStatefulWidget {
  const AIInsightsScreen({super.key});

  @override
  ConsumerState<AIInsightsScreen> createState() => _AIInsightsScreenState();
}

class _AIInsightsScreenState extends ConsumerState<AIInsightsScreen> {
  @override
  Widget build(BuildContext context) {
    final insightsAsync = ref.watch(aiInsightsProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;

        return Scaffold(
          backgroundColor: AppTheme.background,
          appBar: isDesktop
              ? null
              : AppBar(
                  title: const Text('AI Insights'),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
          drawer: isDesktop
              ? null
              : const Drawer(
                  child: AppSidebar(activeRoute: AppRoutes.aiInsights),
                ),
          body: insightsAsync.when(
            data: (insights) {
              return isDesktop
                  ? Row(
                      children: [
                        // Sidebar for desktop is handled by layout shell usually, but if this screen is standalone:
                        // Assuming ShellRoute handles sidebar, so we just build body.
                        // If not, we might need to add sidebar here.
                        // Based on other screens, it seems we might rely on a shell or need to check usage.
                        // SystemSettingsScreen uses LayoutBuilder but doesn't explicitly add Sidebar in desktop branch
                        // unless it's wrapped. Let's assume standard body structure.
                        Expanded(
                          child: Column(
                            children: [
                              _buildDesktopHeader(),
                              Expanded(
                                child: SingleChildScrollView(
                                  padding: const EdgeInsets.all(24),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      _buildSummaryCards(
                                        insights,
                                        isDesktop: true,
                                      ),
                                      const SizedBox(height: 24),
                                      _buildMainContent(
                                        insights,
                                        isDesktop: true,
                                      ),
                                      const SizedBox(height: 24),
                                      _buildFooter(),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildLiveAnalysisBadge(),
                          const SizedBox(height: 16),
                          _buildSummaryCards(insights, isDesktop: false),
                          const SizedBox(height: 24),
                          _buildMainContent(insights, isDesktop: false),
                          const SizedBox(height: 24),
                          _buildFooter(),
                        ],
                      ),
                    );
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(
              child: Text(
                'Error: $err',
                style: const TextStyle(color: Colors.red),
              ),
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
                onPressed: () => ref.refresh(aiInsightsProvider),
                icon: const Icon(
                  LucideIcons.refreshCw,
                  size: 20,
                  color: AppTheme.textMuted,
                ),
                tooltip: 'Refresh',
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

  Widget _buildSummaryCards(
    List<AiInsight> insights, {
    required bool isDesktop,
  }) {
    // Calculate stats derived from insights
    int anomalyCount = insights
        .where(
          (i) =>
              (i.severity?.toLowerCase() ?? '') == 'high' ||
              (i.type.contains('anomaly')),
        )
        .length;

    // Naive health calc
    double health = 1.0 - (anomalyCount * 0.05);
    if (health < 0) health = 0;

    final cards = [
      _buildStatCard(
        title: 'SYSTEM HEALTH',
        value: '${(health * 100).toInt()}%',
        trend: health > 0.9 ? 'Stable' : 'Degraded',
        trendUp: health > 0.9,
        icon: LucideIcons.checkCircle,
        iconColor: health > 0.8 ? const Color(0xFF10b981) : Colors.orange,
        progressBar: _buildProgressBar(
          health,
          health > 0.8 ? const Color(0xFF10b981) : Colors.orange,
        ),
      ),
      _buildStatCard(
        title: 'ACTIVE ANOMALIES',
        value: '$anomalyCount',
        trend: anomalyCount > 0 ? '$anomalyCount Detected' : 'No Anomalies',
        trendUp: anomalyCount == 0,
        icon: LucideIcons.alertTriangle,
        iconColor: anomalyCount > 0 ? Colors.orange : AppTheme.textMuted,
        progressBar: Row(
          children: [
            Expanded(
              child: Container(
                height: 4,
                decoration: BoxDecoration(
                  color: anomalyCount > 0
                      ? Colors.orange
                      : AppTheme.surfaceHighlight,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
          ],
        ),
      ),
      _buildStatCard(
        title: 'AI CONFIDENCE',
        value: '98%',
        trend: 'High',
        trendUp: true,
        isSubtext: true,
        icon: LucideIcons.brainCircuit,
        iconColor: AppTheme.primary,
        progressBar: _buildProgressBar(0.98, AppTheme.primary),
        glow: true,
      ),
      _buildStatCard(
        title: 'INSIGHTS GENERATED',
        value: '${insights.length}',
        trend: 'Total events analyzed',
        trendUp: true,
        isSubtext: true,
        icon: LucideIcons.fileText,
        iconColor: AppTheme.textMuted,
        progressBar: _buildProgressBar(1.0, AppTheme.textMuted),
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
                          // Add arrow if needed, mostly context dependent
                          Text(
                            trend,
                            style: TextStyle(
                              color: trendUp
                                  ? (title.contains('ANOMALIES')
                                        ? Colors.green
                                        : iconColor)
                                  : Colors.orange,
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
          widthFactor: value.clamp(0.0, 1.0),
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

  Widget _buildMainContent(
    List<AiInsight> insights, {
    required bool isDesktop,
  }) {
    final rootCauses = insights
        .where((i) => i.type == 'root_cause' || i.type == 'analysis')
        .toList();
    final predictions = insights
        .where((i) => i.type == 'prediction' || i.type == 'risk')
        .toList();

    // If no data, show empty states or mock examples if desired.
    // We will show "No insights" if empty.

    final leftContent = Column(
      children: [
        _buildRootCausesSection(rootCauses),
        const SizedBox(height: 32),
        _buildRiskPredictionsSection(predictions, isDesktop: isDesktop),
      ],
    );

    // Filter for action items or similar
    final suggestions = insights.where((i) => i.type == 'suggestion').toList();
    final rightContent = _buildRecommendedActionsSection(suggestions);

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

  Widget _buildRootCausesSection(List<AiInsight> insights) {
    if (insights.isEmpty) {
      return const Center(
        child: Text(
          'No active root cause analysis',
          style: TextStyle(color: AppTheme.textMuted),
        ),
      );
    }

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
            // 'View All' can be added back if we have a separate list page
          ],
        ),
        const SizedBox(height: 16),
        ...insights
            .take(5)
            .map(
              (insight) => Padding(
                padding: const EdgeInsets.only(bottom: 16.0),
                child: _buildInsightCard(
                  title: insight.title,
                  subtitle: insight.metadata ?? 'System',
                  time: 'Detected just now', // Could use timeago
                  confidence: '${(insight.confidence * 100).toInt()}%',
                  icon: LucideIcons
                      .database, // Generic icon, mapped from type if possible
                  iconBg: AppTheme.error.withOpacity(0.1),
                  iconColor: AppTheme.error,
                  borderColor: AppTheme.error,
                  content: Text(insight.content), // Simplify rich text for now
                  actions: [_buildLink(LucideIcons.code, 'View Details')],
                ),
              ),
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

  Widget _buildRiskPredictionsSection(
    List<AiInsight> predictions, {
    required bool isDesktop,
  }) {
    if (predictions.isEmpty) {
      // Return empty or placeholder
      return Container();
    }

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
            IconButton(
              onPressed: () {},
              icon: const Icon(LucideIcons.moreHorizontal),
            ),
          ],
        ),
        const SizedBox(height: 16),
        isDesktop
            ? Row(
                children: predictions
                    .take(3)
                    .map(
                      (p) => Expanded(
                        child: Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: _buildRiskCard(
                            title: p.title,
                            subtitle: p.metadata ?? 'Service',
                            riskLevel: (p.severity ?? 'Low').toUpperCase(),
                            riskColor:
                                (p.severity == 'critical' ||
                                    p.severity == 'high')
                                ? Colors.red
                                : Colors.orange,
                            currentValue: 'Active',
                            prediction: p.content,
                            icon: LucideIcons.trendingUp,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              )
            : Column(
                children: predictions
                    .take(3)
                    .map(
                      (p) => Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: _buildRiskCard(
                          title: p.title,
                          subtitle: p.metadata ?? 'Service',
                          riskLevel: (p.severity ?? 'Low').toUpperCase(),
                          riskColor:
                              (p.severity == 'critical' || p.severity == 'high')
                              ? Colors.red
                              : Colors.orange,
                          currentValue: 'Active',
                          prediction: p.content,
                          icon: LucideIcons.trendingUp,
                        ),
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
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.background,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, size: 20, color: riskColor),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: riskColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  riskLevel,
                  style: TextStyle(
                    color: riskColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),
          Text(
            subtitle,
            style: const TextStyle(color: AppTheme.textMuted, fontSize: 12),
          ),
          const SizedBox(height: 16),
          const Divider(height: 1, color: AppTheme.surfaceHighlight),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Current:',
                style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
              ),
              Text(
                currentValue,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.background,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Icon(
                  LucideIcons.arrowRightCircle,
                  size: 14,
                  color: AppTheme.primary,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    prediction,
                    style: const TextStyle(
                      fontSize: 11,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecommendedActionsSection(List<AiInsight> suggestions) {
    if (suggestions.isEmpty) {
      // Return empty or placeholder
      return Container();
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Row(
          children: [
            Icon(LucideIcons.checkSquare, color: AppTheme.primary, size: 20),
            SizedBox(width: 8),
            Text(
              'Recommended Actions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: AppTheme.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.surfaceHighlight),
          ),
          child: Column(
            children: suggestions
                .take(5)
                .map(
                  (s) => _buildActionItem(
                    title: s.title,
                    description: s.content,
                    impact: s.severity ?? 'Medium',
                    impactColor: (s.severity == 'High')
                        ? Colors.orange
                        : Colors.blue,
                  ),
                )
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildActionItem({
    required String title,
    required String description,
    required String impact,
    required Color impactColor,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        border: Border(bottom: BorderSide(color: AppTheme.surfaceHighlight)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 2),
                width: 16,
                height: 16,
                decoration: BoxDecoration(
                  border: Border.all(color: AppTheme.textMuted),
                  borderRadius: BorderRadius.circular(4),
                ),
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
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: impactColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  impact,
                  style: TextStyle(
                    color: impactColor,
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppTheme.primary,
                    foregroundColor: Colors.white,
                    minimumSize: const Size(0, 32),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                  child: const Text('Execute', style: TextStyle(fontSize: 12)),
                ),
                const SizedBox(width: 12),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    minimumSize: const Size(0, 32),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                  child: const Text('Dismiss', style: TextStyle(fontSize: 12)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return const Center(
      child: Padding(
        padding: EdgeInsets.all(24.0),
        child: Text(
          'AI Analysis provided by Cortex-4 Engine',
          style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
        ),
      ),
    );
  }
}
