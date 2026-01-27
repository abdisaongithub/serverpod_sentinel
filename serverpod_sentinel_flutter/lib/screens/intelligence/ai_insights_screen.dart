import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../theme/app_theme.dart';
import '../../theme/sentinel_motion.dart';
import '../../widgets/sentinel_card.dart';
import '../../widgets/sentinel_shimmer.dart';
import '../../providers/ai_insights_provider.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';

class AiInsightsScreen extends ConsumerWidget {
  const AiInsightsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final insightsAsync = ref.watch(aiInsightsProvider);

    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      appBar: AppBar(
        title: const Text('Sentinel Intelligence', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        actions: [
          IconButton(
            onPressed: () => ref.refresh(aiInsightsProvider),
            icon: const Icon(Icons.refresh_rounded, color: AppTheme.darkTextMuted),
          ),
          const SizedBox(width: 32),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _AiHeroCard(),
            const SizedBox(height: 32),
            _SectionHeader(title: 'Recent Intelligence'),
            const SizedBox(height: 16),
            insightsAsync.when(
              data: (insights) {
                if (insights.isEmpty) {
                  return const Center(child: Text('No insights generated yet.'));
                }
                return Column(
                  children: insights.map((insight) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _InsightCard(insight: insight),
                  )).toList(),
                );
              },
              loading: () => Column(children: List.generate(3, (_) => SentinelShimmer.box(height: 100))),
              error: (e, __) => Text('Error: $e'),
            ),
          ],
        ),
      ),
    );
  }
}

class _AiHeroCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SentinelCard(
      color: AppTheme.primary.withOpacity(0.1),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _Tag(label: 'SENTINEL BRAIN', color: AppTheme.primary),
                const SizedBox(height: 16),
                Text(
                  'Autonomous Anomaly Detection is Active',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text(
                  'Your SRE co-pilot is currently analyzing live telemetry. Use "CMD+K" to navigate quickly between findings.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          const SizedBox(width: 48),
          const Icon(Icons.psychology_rounded, size: 80, color: AppTheme.primary),
        ],
      ),
    );
  }
}

class _InsightCard extends StatelessWidget {
  final AiInsight insight;
  const _InsightCard({required this.insight});

  @override
  Widget build(BuildContext context) {
    final color = insight.severity == 'critical' ? AppTheme.error : AppTheme.warning;

    return SentinelCard(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(color: color.withOpacity(0.1), shape: BoxShape.circle),
            child: Icon(Icons.auto_awesome_rounded, color: color, size: 24),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(insight.title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                const SizedBox(height: 4),
                Text(insight.content, style: Theme.of(context).textTheme.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis),
              ],
            ),
          ),
          const SizedBox(width: 20),
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: AppTheme.darkSurfaceVariant),
            child: const Text('Details'),
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  const _SectionHeader({required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title.toUpperCase(),
      style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppTheme.darkTextMuted, letterSpacing: 1),
    );
  }
}

class _Tag extends StatelessWidget {
  final String label;
  final Color color;
  const _Tag({required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Text(label, style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 1)),
    );
  }
}
