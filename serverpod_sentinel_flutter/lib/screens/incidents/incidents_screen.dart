import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import '../../theme/sentinel_motion.dart';
import '../../widgets/sentinel_card.dart';
import '../../widgets/status_pulsar.dart';
import '../../widgets/sentinel_shimmer.dart';
import '../../widgets/sentinel_state_view.dart';
import '../../providers/incidents_provider.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';

class IncidentsScreen extends ConsumerWidget {
  const IncidentsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final incidentsAsync = ref.watch(activeIncidentsProvider);

    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      body: SentinelStateView(
        state: incidentsAsync,
        onRetry: () => ref.refresh(activeIncidentsProvider),
        builder: (incidents) => CustomScrollView(
          slivers: [
            _IncidentsHeader(),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
              sliver: incidents.isEmpty 
                ? _EmptyIncidentsView()
                : _IncidentList(incidents: incidents),
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyIncidentsView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverFillRemaining(
      hasScrollBody: false,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shield_rounded, size: 64, color: AppTheme.darkTextDim.withOpacity(0.2)),
            const SizedBox(height: 16),
            const Text('All Systems Clear', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            Text('No active incidents currently tracked.', style: TextStyle(color: AppTheme.darkTextDim)),
          ],
        ),
      ),
    );
  }
}

class _IncidentsHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      expandedHeight: 100,
      backgroundColor: AppTheme.darkBackground.withOpacity(0.8),
      title: const Text('Active Incidents', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
      actions: [
        OutlinedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.done_all_rounded, size: 18),
          label: const Text('Acknowledge All'),
          style: OutlinedButton.styleFrom(
            foregroundColor: AppTheme.primary,
            side: const BorderSide(color: AppTheme.primary),
          ),
        ),
        const SizedBox(width: 16),
        ElevatedButton.icon(
          onPressed: () {},
          icon: const Icon(Icons.add_rounded, size: 18),
          label: const Text('New Incident'),
        ),
        const SizedBox(width: 32),
      ],
    );
  }
}

class _IncidentList extends StatelessWidget {
  final List<Incident> incidents;
  const _IncidentList({required this.incidents});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) {
          final incident = incidents[index];
          return SentinelMotion.fadeIn(
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _IncidentListItem(incident: incident),
            ),
            delay: Duration(milliseconds: index * 50),
          );
        },
        childCount: incidents.length,
      ),
    );
  }
}

class _IncidentListItem extends StatelessWidget {
  final Incident incident;
  const _IncidentListItem({required this.incident});

  @override
  Widget build(BuildContext context) {
    final severityColor = incident.severity == IncidentSeverity.CRITICAL ? AppTheme.error : AppTheme.warning;

    return SentinelCard(
      padding: EdgeInsets.zero,
      child: InkWell(
        onTap: () => context.go('/incidents/detail/${incident.id}'),
        borderRadius: BorderRadius.circular(16),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              StatusPulsar(color: severityColor, size: 10),
              const SizedBox(width: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          incident.title,
                          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        const SizedBox(width: 12),
                        _Tag(label: incident.severity.name, color: severityColor),
                        const SizedBox(width: 8),
                        _Tag(label: incident.service?.name ?? 'Unknown', color: AppTheme.primary.withOpacity(0.8)),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      incident.summary ?? 'No summary available',
                      style: Theme.of(context).textTheme.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              _CommanderSection(incident: incident),
              const SizedBox(width: 24),
              const Icon(Icons.arrow_forward_ios_rounded, size: 14, color: AppTheme.darkTextMuted),
            ],
          ),
        ),
      ),
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
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Text(
        label,
        style: TextStyle(color: color, fontSize: 10, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _CommanderSection extends StatelessWidget {
  final Incident incident;
  const _CommanderSection({required this.incident});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              'Commander',
              style: TextStyle(fontSize: 10, color: AppTheme.darkTextDim),
            ),
            Text(
              incident.commander?.userInfoId.toString() ?? 'Unassigned',
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
            ),
          ],
        ),
        const SizedBox(width: 12),
        const CircleAvatar(
          radius: 14,
          backgroundColor: AppTheme.darkSurfaceVariant,
          child: Icon(Icons.person, size: 14, color: AppTheme.darkTextMuted),
        ),
      ],
    );
  }
}
