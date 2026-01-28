import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import '../../theme/app_theme.dart';
import '../../theme/sentinel_motion.dart';
import '../../routes.dart';
import '../../widgets/sentinel_card.dart';
import '../../widgets/status_pulsar.dart';
import '../../widgets/app_right_sidebar.dart';
import '../../providers/incidents_provider.dart';

class IncidentDetailScreen extends ConsumerWidget {
  final int incidentId;

  const IncidentDetailScreen({super.key, required this.incidentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final incidentAsync = ref.watch(incidentProvider(incidentId));

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;
        final isLargeDesktop = constraints.maxWidth >= 1400;

        return Scaffold(
          backgroundColor: AppTheme.darkBackground,
          body: Column(
            children: [
              _Header(isDesktop: isDesktop, incidentId: incidentId),
              Expanded(
                child: incidentAsync.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (e, _) => Center(
                    child: Text(
                      'Error loading incident: $e',
                      style: const TextStyle(color: AppTheme.error),
                    ),
                  ),
                  data: (incident) {
                    if (incident == null) {
                      return const Center(
                        child: Text(
                          'Incident not found',
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    }
                    return Row(
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            padding: EdgeInsets.all(isDesktop ? 32 : 16),
                            child: ConstrainedBox(
                              constraints: const BoxConstraints(maxWidth: 1600),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _InfoAndStatusRow(incident: incident),
                                  const SizedBox(height: 24),
                                  _TimelineSection(incident: incident),
                                  const SizedBox(height: 24),
                                  _ActionsSection(isDesktop: isDesktop),
                                  const SizedBox(height: 32),
                                ],
                              ),
                            ),
                          ),
                        ),
                        if (isLargeDesktop) const _TeamUpdatesSidebar(),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  final bool isDesktop;
  final int incidentId;

  const _Header({required this.isDesktop, required this.incidentId});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 32 : 16),
      decoration: BoxDecoration(
        color: AppTheme.darkSurface,
        border: Border(bottom: BorderSide(color: AppTheme.darkBorder)),
      ),
      child: Row(
        children: [
          if (!isDesktop) ...[
            IconButton(
              icon: const Icon(LucideIcons.menu, color: Colors.white),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => context.go(AppRoutes.incidents),
                      child: const Text(
                        'Incidents',
                        style: TextStyle(
                          color: AppTheme.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      LucideIcons.chevronRight,
                      size: 12,
                      color: AppTheme.darkTextMuted,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '#INC-$incidentId',
                      style: const TextStyle(
                        color: AppTheme.darkTextMuted,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Text(
                      'INC-3942',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.error.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: AppTheme.error.withOpacity(0.2),
                        ),
                      ),
                      child: const Text(
                        'CRITICAL SEVERITY',
                        style: TextStyle(
                          color: AppTheme.error,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (isDesktop) ...[
            _ActionButton(
              icon: LucideIcons.link,
              label: 'Link Issue',
              onTap: () {},
            ),
            const SizedBox(width: 12),
            _ActionButton(
              icon: LucideIcons.check,
              label: 'Resolve',
              isPrimary: true,
              onTap: () {},
            ),
            const SizedBox(width: 12),
          ],
          IconButton(
            icon: const Icon(
              LucideIcons.share2,
              color: AppTheme.darkTextMuted,
              size: 20,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isPrimary;
  final VoidCallback onTap;

  const _ActionButton({
    required this.icon,
    required this.label,
    this.isPrimary = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: isPrimary ? AppTheme.primary : AppTheme.darkSurfaceVariant,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Row(
            children: [
              Icon(icon, color: Colors.white, size: 18),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoAndStatusRow extends StatelessWidget {
  final Incident incident;

  const _InfoAndStatusRow({required this.incident});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 900;

        if (isNarrow) {
          return Column(
            key: const ValueKey('narrow'),
            children: [
              _StatusSection(incident: incident),
              const SizedBox(height: 24),
              _SummarySection(incident: incident),
            ],
          );
        }

        return Row(
          key: const ValueKey('wide'),
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(flex: 5, child: _StatusSection(incident: incident)),
            const SizedBox(width: 24),
            Expanded(flex: 7, child: _SummarySection(incident: incident)),
          ],
        );
      },
    );
  }
}

class _StatusSection extends StatelessWidget {
  final Incident incident;

  const _StatusSection({required this.incident});

  @override
  Widget build(BuildContext context) {
    return SentinelCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    LucideIcons.activity,
                    color: AppTheme.darkTextMuted,
                    size: 16,
                  ),
                  const SizedBox(width: 8),
                  const Text(
                    'CURRENT STATUS',
                    style: TextStyle(
                      color: AppTheme.darkTextMuted,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.error.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: AppTheme.error.withOpacity(0.2)),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    StatusPulsar(color: AppTheme.error, size: 8),
                    SizedBox(width: 8),
                    Text(
                      'LIVE',
                      style: TextStyle(
                        color: AppTheme.error,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(
            incident.status.name.replaceAll('_', ' '),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 32,
              fontWeight: FontWeight.w800,
              letterSpacing: -0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            incident.summary ?? 'No description available',
            style: const TextStyle(color: AppTheme.darkTextMuted, fontSize: 14),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 24),
          const Divider(color: AppTheme.darkBorder),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Duration',
                      style: TextStyle(
                        color: AppTheme.darkTextMuted,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      '45m 12s',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Responders',
                      style: TextStyle(
                        color: AppTheme.darkTextMuted,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 4),
                    _AvatarsRow(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SummarySection extends StatelessWidget {
  final Incident incident;

  const _SummarySection({required this.incident});

  @override
  Widget build(BuildContext context) {
    return SentinelCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Incident Summary',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Edit',
                style: const TextStyle(
                  color: AppTheme.primary,
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            incident.summary ?? 'No summary available',
            style: const TextStyle(
              color: AppTheme.darkTextSecondary,
              fontSize: 14,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            height: 100,
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.darkBackground,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: AppTheme.darkBorder),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'Error Rate (5xx)',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _Bar(
                        height: 20,
                        color: AppTheme.primary.withOpacity(0.2),
                      ),
                      _Bar(
                        height: 35,
                        color: AppTheme.primary.withOpacity(0.2),
                      ),
                      _Bar(
                        height: 25,
                        color: AppTheme.primary.withOpacity(0.2),
                      ),
                      _Bar(
                        height: 45,
                        color: AppTheme.primary.withOpacity(0.2),
                      ),
                      _Bar(
                        height: 60,
                        color: AppTheme.primary.withOpacity(0.4),
                      ),
                      _Bar(
                        height: 80,
                        color: AppTheme.primary.withOpacity(0.6),
                      ),
                      const _Bar(height: 95, color: AppTheme.error),
                      const _Bar(height: 85, color: AppTheme.error),
                      _Bar(height: 70, color: AppTheme.error.withOpacity(0.7)),
                      _Bar(height: 60, color: AppTheme.error.withOpacity(0.6)),
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
}

class _Bar extends StatelessWidget {
  final double height;
  final Color color;

  const _Bar({required this.height, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(2)),
      ),
    );
  }
}

class _AvatarsRow extends StatelessWidget {
  const _AvatarsRow();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Align(
          widthFactor: 0.7,
          alignment: Alignment.centerLeft,
          child: _Avatar(url: 'https://i.pravatar.cc/150?img=1'),
        ),
        const Align(
          widthFactor: 0.7,
          alignment: Alignment.centerLeft,
          child: _Avatar(url: 'https://i.pravatar.cc/150?img=2'),
        ),
        Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: AppTheme.darkSurfaceHighlight,
            shape: BoxShape.circle,
            border: Border.all(color: AppTheme.darkSurface, width: 2),
          ),
          child: const Center(
            child: Text(
              '+3',
              style: TextStyle(
                color: Colors.white,
                fontSize: 9,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _Avatar extends StatelessWidget {
  final String url;
  const _Avatar({required this.url});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 24,
      height: 24,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: AppTheme.darkSurface, width: 2),
        image: DecorationImage(image: NetworkImage(url), fit: BoxFit.cover),
      ),
    );
  }
}

class _TimelineSection extends StatelessWidget {
  final Incident incident;

  const _TimelineSection({required this.incident});

  String _getTimeString(DateTime dt) {
    return '${dt.hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')}';
  }

  String _getDayString(DateTime dt) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final date = DateTime(dt.year, dt.month, dt.day);

    if (date == today) return 'Today';
    if (date == today.subtract(const Duration(days: 1))) return 'Yesterday';
    return '${dt.month}/${dt.day}';
  }

  String _getAuthorInitials(IncidentTimelineItem item) {
    return 'U${item.authorId}';
  }

  IconData _getIconForType(TimelineItemType type) {
    switch (type) {
      case TimelineItemType.STATUS_CHANGE:
        return LucideIcons.activity;
      case TimelineItemType.USER_COMMENT:
        return LucideIcons.messageSquare;
      case TimelineItemType.PLAYBOOK_ACTION:
        return LucideIcons.bot;
      case TimelineItemType.SYSTEM_ALERT:
        return LucideIcons.alertTriangle;
    }
  }

  Color _getColorForType(TimelineItemType type) {
    switch (type) {
      case TimelineItemType.STATUS_CHANGE:
        return AppTheme.primary;
      case TimelineItemType.USER_COMMENT:
        return Colors.amber;
      case TimelineItemType.PLAYBOOK_ACTION:
        return AppTheme.success;
      case TimelineItemType.SYSTEM_ALERT:
        return AppTheme.error;
    }
  }

  @override
  Widget build(BuildContext context) {
    final timeline = incident.timeline ?? [];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Timeline of Events',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                _TimelineFilter(label: 'All', isActive: true),
                const SizedBox(width: 8),
                _TimelineFilter(label: 'Status'),
                const SizedBox(width: 8),
                _TimelineFilter(label: 'Comments'),
                const SizedBox(width: 8),
                _TimelineFilter(label: 'System'),
              ],
            ),
          ],
        ),
        const SizedBox(height: 24),
        SentinelCard(
          padding: const EdgeInsets.all(24),
          child: timeline.isEmpty
              ? const Center(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Text(
                      'No timeline events yet',
                      style: TextStyle(color: AppTheme.darkTextMuted),
                    ),
                  ),
                )
              : Column(
                  children: timeline.asMap().entries.map((entry) {
                    final index = entry.key;
                    final item = entry.value;
                    final isSystem =
                        item.type == TimelineItemType.PLAYBOOK_ACTION ||
                        item.type == TimelineItemType.STATUS_CHANGE;

                    return _TimelineItem(
                      time: _getTimeString(item.createdAt),
                      day: _getDayString(item.createdAt),
                      title: item.type == TimelineItemType.USER_COMMENT
                          ? 'Comment from User #${item.authorId}'
                          : item.content,
                      description: item.type == TimelineItemType.USER_COMMENT
                          ? item.content
                          : item.metaData ?? '',
                      icon: _getIconForType(item.type),
                      statusColor: _getColorForType(item.type),
                      isSystem: isSystem,
                      userPlaceholder: isSystem
                          ? null
                          : _getAuthorInitials(item),
                      isLast: index == timeline.length - 1,
                    );
                  }).toList(),
                ),
        ),
      ],
    );
  }
}

class _TimelineFilter extends StatelessWidget {
  final String label;
  final bool isActive;

  const _TimelineFilter({required this.label, this.isActive = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: isActive
            ? AppTheme.primary.withOpacity(0.1)
            : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(
          color: isActive ? AppTheme.primary : AppTheme.darkBorder,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? AppTheme.primary : AppTheme.darkTextMuted,
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final String time;
  final String day;
  final String title;
  final String description;
  final IconData icon;
  final Color statusColor;
  final bool isSystem;
  final String? userPlaceholder;
  final bool isLast;

  const _TimelineItem({
    required this.time,
    required this.day,
    required this.title,
    required this.description,
    required this.icon,
    required this.statusColor,
    this.isSystem = false,
    this.userPlaceholder,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (!isLast)
          Positioned(
            left:
                79, // 40 (time) + 24 (gap) + 15 (center of 32 circle minus 1 for half line width)
            top: 32,
            bottom: 0,
            width: 2,
            child: Container(color: AppTheme.darkBorder),
          ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 40,
              child: Column(
                children: [
                  Text(
                    time,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    day,
                    style: const TextStyle(color: AppTheme.darkTextMuted, fontSize: 10),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 24),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: isSystem
                    ? statusColor.withOpacity(0.1)
                    : AppTheme.darkSurfaceHighlight,
                shape: BoxShape.circle,
                border: Border.all(
                  color: isSystem
                      ? statusColor.withOpacity(0.2)
                      : Colors.transparent,
                ),
              ),
              child: Center(
                child: userPlaceholder != null
                    ? Text(
                        userPlaceholder!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    : Icon(icon, color: statusColor, size: 14),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      description,
                      style: const TextStyle(
                        color: AppTheme.darkTextMuted,
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                    if (isSystem) ...[
                      const SizedBox(height: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 6,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.darkBackground,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(color: AppTheme.darkBorder),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(LucideIcons.bot, color: statusColor, size: 10),
                            const SizedBox(width: 4),
                            Text(
                              'System Bot',
                              style: TextStyle(
                                color: statusColor.withOpacity(0.8),
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _ActionsSection extends StatelessWidget {
  final bool isDesktop;
  const _ActionsSection({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final useGrid = constraints.maxWidth > 700;

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (useGrid)
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _ActionsTakenList()),
                  SizedBox(width: 24),
                  Expanded(child: _SuggestedNextSteps()),
                ],
              )
            else
              const Column(
                children: [
                  _ActionsTakenList(),
                  SizedBox(height: 24),
                  _SuggestedNextSteps(),
                ],
              ),
          ],
        );
      },
    );
  }
}

class _ActionsTakenList extends StatelessWidget {
  const _ActionsTakenList();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Actions Taken',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        const _ActionItem(label: 'Automatic scale-up triggered', isDone: true),
        const _ActionItem(label: 'Read replicas promoted', isDone: true),
        const _ActionItem(
          label: 'Traffic redirection to US-West',
          isDone: true,
        ),
        const _ActionItem(label: 'Cache invalidation (Pending)', isDone: false),
      ],
    );
  }
}

class _ActionItem extends StatelessWidget {
  final String label;
  final bool isDone;

  const _ActionItem({required this.label, required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.darkSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.darkBorder),
      ),
      child: Row(
        children: [
          Icon(
            isDone ? LucideIcons.checkCircle : LucideIcons.circle,
            color: isDone ? AppTheme.success : AppTheme.darkTextMuted,
            size: 18,
          ),
          const SizedBox(width: 12),
          Text(
            label,
            style: TextStyle(
              color: isDone ? Colors.white : AppTheme.darkTextMuted,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _SuggestedNextSteps extends StatelessWidget {
  const _SuggestedNextSteps();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Suggested Next Steps',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        _SuggestedActionCard(
          title: 'Rollback Deployment',
          subtitle: 'Revert to stable version v4.2.0',
          icon: LucideIcons.rotateCcw,
          color: AppTheme.primary,
          onTap: () {},
        ),
        const SizedBox(height: 12),
        _SuggestedActionCard(
          title: 'Escalate Incident',
          subtitle: 'Notify Level 3 SRE Team',
          icon: LucideIcons.megaphone,
          color: Colors.amber,
          onTap: () {},
        ),
      ],
    );
  }
}

class _SuggestedActionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  const _SuggestedActionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppTheme.darkSurface,
      borderRadius: BorderRadius.circular(12),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppTheme.darkBorder),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
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
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(color: AppTheme.darkTextMuted, fontSize: 12),
                    ),
                  ],
                ),
              ),
              const Icon(
                LucideIcons.chevronRight,
                color: AppTheme.darkTextMuted,
                size: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TeamUpdatesSidebar extends StatelessWidget {
  const _TeamUpdatesSidebar();

  @override
  Widget build(BuildContext context) {
    return AppRightSidebar(
      title: 'TEAM UPDATES',
      children: [
        const _ChatBubble(
          user: 'Ops Butler',
          message:
              'US-East Gateway latency is normalizing. Automatic scale-up complete.',
          time: '14:25',
          isBot: true,
        ),
        const _ChatBubble(
          user: 'Alex R.',
          message: 'Confirmed. Monitoring the error rates now.',
          time: '14:26',
        ),
        const _ChatBubble(
          user: 'Sarah M.',
          message: 'Checking the DB logs just in case.',
          time: '14:28',
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: const BoxDecoration(
            color: AppTheme.darkBackground,
            border: Border(top: BorderSide(color: AppTheme.darkBorder)),
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: AppTheme.darkSurface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: AppTheme.darkBorder),
                  ),
                  child: const TextField(
                    style: TextStyle(color: Colors.white, fontSize: 13),
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      hintStyle: TextStyle(
                        color: AppTheme.darkTextMuted,
                        fontSize: 13,
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                width: 36,
                height: 36,
                decoration: const BoxDecoration(
                  color: AppTheme.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  LucideIcons.send,
                  color: Colors.white,
                  size: 16,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ChatBubble extends StatelessWidget {
  final String user;
  final String message;
  final String time;
  final bool isBot;

  const _ChatBubble({
    required this.user,
    required this.message,
    required this.time,
    this.isBot = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                user,
                style: TextStyle(
                  color: isBot ? AppTheme.primary : Colors.white70,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                time,
                style: const TextStyle(color: AppTheme.darkTextMuted, fontSize: 10),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: isBot
                  ? AppTheme.primary.withOpacity(0.05)
                  : AppTheme.darkSurfaceVariant,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                color: isBot
                    ? AppTheme.primary.withOpacity(0.1)
                    : AppTheme.darkSurfaceHighlight.withOpacity(0.3),
              ),
            ),
            child: Text(
              message,
              style: const TextStyle(
                color: AppTheme.darkTextSecondary,
                fontSize: 13,
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
