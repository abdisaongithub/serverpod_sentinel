import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';
import '../../widgets/app_sidebar.dart';

class IncidentReportScreen extends StatelessWidget {
  const IncidentReportScreen({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;

        return Scaffold(
          backgroundColor: AppTheme.background,
          drawer: !isDesktop
              ? const Drawer(
                  child: AppSidebar(activeRoute: AppRoutes.incidentReport),
                )
              : null,
          body: Column(
            children: [
              _Header(),
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.fromLTRB(24, 24, 24, 100),
                        child: Center(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 1280),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                _ExecutiveSummaryCard(),
                                const SizedBox(height: 24),
                                _RcaAndChartSection(),
                                const SizedBox(height: 24),
                                _ActionsAndLessonsSection(),
                                const SizedBox(height: 24),
                                _TimelineSection(),
                                const SizedBox(height: 40),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const Positioned(
                      left: 0,
                      right: 0,
                      bottom: 0,
                      child: _StickyFooter(),
                    ),
                  ],
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
  _Header();

  @override
  Widget build(BuildContext context) {
    final isDesktop =
        MediaQuery.of(context).size.width >= AppTheme.tabletBreakpoint;

    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: const Color(0xFF111620).withOpacity(0.8),
        border: const Border(
          bottom: BorderSide(color: AppTheme.surfaceHighlight),
        ),
      ),
      child: Row(
        children: [
          if (!isDesktop)
            IconButton(
              icon: const Icon(LucideIcons.menu, color: Colors.white),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'Incidents',
                      style: TextStyle(
                        color: AppTheme.textDim,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 4),
                    const Icon(
                      LucideIcons.chevronRight,
                      size: 10,
                      color: AppTheme.textDim,
                    ),
                    const SizedBox(width: 4),
                    const Text(
                      '#921',
                      style: TextStyle(
                        color: AppTheme.textDim,
                        fontSize: 11,
                        fontFamily: 'JetBrains Mono',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Row(
                  children: [
                    const Text(
                      'Database Latency Spike',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 12),
                    _HeaderBadge(
                      label: 'CRITICAL',
                      color: Colors.red.shade400,
                      bgColor: Colors.red.withOpacity(0.1),
                    ),
                    const SizedBox(width: 8),
                    _HeaderBadge(
                      label: 'RESOLVED',
                      color: Colors.green.shade400,
                      bgColor: Colors.green.withOpacity(0.1),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (isDesktop) ...[
            _HeaderAction(
              icon: LucideIcons.share2,
              label: 'Share',
              onTap: () {},
            ),
            const SizedBox(width: 8),
            _HeaderAction(
              icon: LucideIcons.printer,
              label: 'Print Report',
              onTap: () {},
              isPrimary: true,
            ),
          ],
        ],
      ),
    );
  }
}

class _HeaderBadge extends StatelessWidget {
  final String label;
  final Color color;
  final Color bgColor;

  _HeaderBadge({
    required this.label,
    required this.color,
    required this.bgColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(100),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 9,
          fontWeight: FontWeight.w900,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _HeaderAction extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isPrimary;

  _HeaderAction({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isPrimary = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        height: 36,
        padding: const EdgeInsets.symmetric(horizontal: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: isPrimary ? Colors.transparent : Colors.transparent,
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 16,
              color: isPrimary ? AppTheme.primary : AppTheme.textMuted,
            ),
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: isPrimary ? AppTheme.primary : AppTheme.textMuted,
                fontSize: 13,
                fontWeight: isPrimary ? FontWeight.bold : FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ExecutiveSummaryCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDesktop =
        MediaQuery.of(context).size.width >= AppTheme.tabletBreakpoint;

    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceHighlight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(
                          LucideIcons.textSelect,
                          size: 14,
                          color: AppTheme.textDim,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          'EXECUTIVE SUMMARY',
                          style: TextStyle(
                            color: AppTheme.textDim,
                            fontSize: 10,
                            fontWeight: FontWeight.w900,
                            letterSpacing: 1.5,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'A critical database latency spike occurred on the primary shard following the v2.4 deployment, causing a 15% increase in user timeouts. The incident was mitigated by rolling back to v2.3, restoring normal service levels within 45 minutes. The root cause was identified as an unindexed query in the new release.',
                      style: TextStyle(
                        color: Color(0xFFE2E8F0),
                        fontSize: 14,
                        height: 1.6,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (isDesktop)
              Container(width: 1, color: AppTheme.surfaceHighlight),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.white.withOpacity(0.02),
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    _MetricRow(
                      label1: 'Start Time',
                      value1: 'Oct 12, 14:00 UTC',
                      label2: 'End Time',
                      value2: 'Oct 12, 14:45 UTC',
                    ),
                    const SizedBox(height: 24),
                    _MetricRow(
                      label1: 'Duration',
                      value1: '45m',
                      label2: 'Impact',
                      value2: '15% Timeouts',
                      isDuration: true,
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
}

class _MetricRow extends StatelessWidget {
  final String label1;
  final String value1;
  final String label2;
  final String value2;
  final bool isDuration;

  _MetricRow({
    required this.label1,
    required this.value1,
    required this.label2,
    required this.value2,
    this.isDuration = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label1,
                style: TextStyle(color: AppTheme.textDim, fontSize: 11),
              ),
              const SizedBox(height: 4),
              isDuration
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.surfaceHighlight.withOpacity(0.5),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        value1,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : Text(
                      value1,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'JetBrains Mono',
                      ),
                    ),
            ],
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label2,
                style: TextStyle(color: AppTheme.textDim, fontSize: 11),
              ),
              const SizedBox(height: 4),
              isDuration
                  ? Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.red.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        value2,
                        style: TextStyle(
                          color: Colors.red.shade400,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : Text(
                      value2,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'JetBrains Mono',
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}

class _RcaAndChartSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDesktop =
        MediaQuery.of(context).size.width >= AppTheme.tabletBreakpoint;

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _RcaCard()),
          const SizedBox(width: 24),
          Expanded(child: _ChartCard()),
        ],
      );
    }

    return Column(
      children: [_RcaCard(), const SizedBox(height: 24), _ChartCard()],
    );
  }
}

class _RcaCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceHighlight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                LucideIcons.searchCode,
                color: AppTheme.primary,
                size: 20,
              ),
              const SizedBox(width: 12),
              const Text(
                'Root Cause Analysis',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          RichText(
            text: TextSpan(
              style: const TextStyle(
                color: AppTheme.textMuted,
                fontSize: 14,
                height: 1.6,
              ),
              children: [
                const TextSpan(
                  text: 'A non-performant SQL query was introduced in the ',
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceHighlight.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'v2.4',
                      style: TextStyle(
                        color: Colors.pinkAccent,
                        fontFamily: 'JetBrains Mono',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const TextSpan(
                  text: ' release. This query lacked proper indexing for the ',
                ),
                WidgetSpan(
                  alignment: PlaceholderAlignment.middle,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceHighlight.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      'user_sessions',
                      style: TextStyle(
                        color: Colors.pinkAccent,
                        fontFamily: 'JetBrains Mono',
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                const TextSpan(
                  text:
                      ' table, causing full table scans. \n\nUnder high load, this triggered lock contention on the primary database shard. The database connection pool became exhausted as queries queued up, leading to a cascade of connection timeouts across the user authentication service.',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ChartCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
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
              Row(
                children: [
                  const Icon(
                    LucideIcons.barChart3,
                    color: AppTheme.primary,
                    size: 20,
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Primary DB Load',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'CPU Load vs Time (UTC)',
                        style: TextStyle(color: AppTheme.textDim, fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Row(
                  children: [
                    Text(
                      'Open Grafana',
                      style: TextStyle(
                        color: AppTheme.primary,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 4),
                    Icon(
                      LucideIcons.externalLink,
                      size: 12,
                      color: AppTheme.primary,
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            height: 120,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _Bar(height: 20, color: AppTheme.primary.withOpacity(0.2)),
                _Bar(height: 30, color: AppTheme.primary.withOpacity(0.2)),
                _Bar(height: 45, color: AppTheme.primary.withOpacity(0.4)),
                _Bar(height: 85, color: Colors.red.withOpacity(0.6)),
                _Bar(height: 100, color: Colors.red, label: '98% Peak'),
                _Bar(height: 65, color: Colors.red.withOpacity(0.4)),
                _Bar(height: 35, color: AppTheme.primary.withOpacity(0.2)),
                _Bar(height: 25, color: AppTheme.primary.withOpacity(0.2)),
              ],
            ),
          ),
          const SizedBox(height: 8),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '14:00',
                style: TextStyle(
                  color: AppTheme.textDim,
                  fontSize: 10,
                  fontFamily: 'JetBrains Mono',
                ),
              ),
              Text(
                '14:15',
                style: TextStyle(
                  color: AppTheme.textDim,
                  fontSize: 10,
                  fontFamily: 'JetBrains Mono',
                ),
              ),
              Text(
                '14:30',
                style: TextStyle(
                  color: AppTheme.textDim,
                  fontSize: 10,
                  fontFamily: 'JetBrains Mono',
                ),
              ),
              Text(
                '14:45',
                style: TextStyle(
                  color: AppTheme.textDim,
                  fontSize: 10,
                  fontFamily: 'JetBrains Mono',
                ),
              ),
              Text(
                '15:00',
                style: TextStyle(
                  color: AppTheme.textDim,
                  fontSize: 10,
                  fontFamily: 'JetBrains Mono',
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: _MetricBox(
                  label: 'Max Query Latency',
                  value: '4.25s',
                  tag: 'High',
                  tagColor: Colors.red,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _MetricBox(
                  label: 'Connection Pool',
                  value: '100%',
                  tag: 'Saturated',
                  tagColor: Colors.orange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Bar extends StatelessWidget {
  final double height;
  final Color color;
  final String? label;

  _Bar({required this.height, required this.color, this.label});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (label != null) ...[
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  label!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 4),
            ],
            Container(
              height: height,
              decoration: BoxDecoration(
                color: color,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(4),
                ),
                boxShadow: label != null
                    ? [
                        BoxShadow(
                          color: color.withOpacity(0.4),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ]
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetricBox extends StatelessWidget {
  final String label;
  final String value;
  final String tag;
  final Color tagColor;

  const _MetricBox({
    required this.label,
    required this.value,
    required this.tag,
    required this.tagColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.02),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.surfaceHighlight.withOpacity(0.5)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: AppTheme.textDim, fontSize: 10)),
          const SizedBox(height: 4),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: tagColor.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    tag,
                    style: TextStyle(
                      color: tagColor,
                      fontSize: 8,
                      fontWeight: FontWeight.w900,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ActionsAndLessonsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final isDesktop =
        MediaQuery.of(context).size.width >= AppTheme.tabletBreakpoint;

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(child: _ActionsCard()),
          const SizedBox(width: 24),
          Expanded(child: _LessonsCard()),
        ],
      );
    }

    return Column(
      children: [_ActionsCard(), const SizedBox(height: 24), _LessonsCard()],
    );
  }
}

class _ActionsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceHighlight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                LucideIcons.checkCircle,
                color: Colors.green,
                size: 20,
              ),
              const SizedBox(width: 12),
              const Text(
                'Actions Taken',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _ActionItem(
            icon: LucideIcons.undo2,
            title: 'Immediate Rollback',
            desc:
                'Reverted production environment to stable build v2.3 to restore service health.',
            color: Colors.green,
          ),
          const SizedBox(height: 16),
          _ActionItem(
            icon: LucideIcons.wrench,
            title: 'Query Optimization',
            desc:
                'Patching the inefficient query and adding necessary indexes on `user_sessions`.',
            color: AppTheme.primary,
            status: 'In Progress',
          ),
        ],
      ),
    );
  }
}

class _ActionItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String desc;
  final Color color;
  final String? status;

  const _ActionItem({
    required this.icon,
    required this.title,
    required this.desc,
    required this.color,
    this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.02),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppTheme.surfaceHighlight.withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(icon, size: 16, color: color),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (status != null)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: color.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          status!.toUpperCase(),
                          style: TextStyle(
                            color: color,
                            fontSize: 8,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                      ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  desc,
                  style: TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 12,
                    height: 1.5,
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

class _LessonsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceHighlight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(LucideIcons.lightbulb, color: Colors.yellow, size: 20),
              const SizedBox(width: 12),
              const Text(
                'Lessons Learned',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          _LessonItem(
            text:
                'Load testing must include **write-heavy scenarios** for new endpoints to catch locking issues.',
          ),
          const SizedBox(height: 12),
          _LessonItem(
            text:
                'Update DB Alert thresholds to trigger earlier on lock waits > 5s (currently 15s).',
          ),
          const SizedBox(height: 12),
          _LessonItem(
            text:
                'Improve automated rollback scripts to reduce manual intervention time from 10m to <2m.',
          ),
        ],
      ),
    );
  }
}

class _LessonItem extends StatelessWidget {
  final String text;

  const _LessonItem({required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(LucideIcons.moveRight, size: 16, color: AppTheme.textDim),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
              color: AppTheme.textMuted,
              fontSize: 13,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}

class _TimelineSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceHighlight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 20,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(
                LucideIcons.history,
                color: AppTheme.textDim,
                size: 20,
              ),
              const SizedBox(width: 12),
              const Text(
                'Timeline of Events',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 32),
          ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _TimelineItem(
                time: '14:00 UTC',
                title: 'Alert Triggered',
                desc:
                    'PagerDuty alert received for high latency on primary-db-shard-01. Latency crossed the 1000ms threshold.',
                tag: 'PD-4402',
                color: Colors.red,
              ),
              _TimelineItem(
                time: '14:10 UTC',
                title: 'Engineering Response',
                desc:
                    'On-call engineer acknowledged the alert and started investigation. Dashboard confirmed spike correlated with v2.4 release timestamp.',
                color: AppTheme.primary,
              ),
              _TimelineItem(
                time: '14:30 UTC',
                title: 'Root Cause Identified',
                desc:
                    'Identified blocking queries from deployment v2.4. Decision made to rollback immediately to mitigate user impact.',
                color: AppTheme.primary,
              ),
              _TimelineItem(
                time: '14:45 UTC',
                title: 'Rolled Back & Resolved',
                desc:
                    'Service rolled back to v2.3 successfully. Latency metrics returned to baseline levels (50ms). Incident marked as resolved.',
                color: Colors.green,
                isLast: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TimelineItem extends StatelessWidget {
  final String time;
  final String title;
  final String desc;
  final String? tag;
  final Color color;
  final bool isLast;

  const _TimelineItem({
    required this.time,
    required this.title,
    required this.desc,
    this.tag,
    required this.color,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 80,
            child: Padding(
              padding: const EdgeInsets.only(top: 2),
              child: Text(
                time,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: Colors.white,
                  fontFamily: 'JetBrains Mono',
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(width: 24),
          Column(
            children: [
              Container(
                width: 12,
                height: 12,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppTheme.surface, width: 2),
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.3),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ],
                ),
              ),
              if (!isLast)
                Expanded(
                  child: Container(width: 1, color: AppTheme.surfaceHighlight),
                ),
            ],
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      if (tag != null)
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.surfaceHighlight.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            tag!,
                            style: TextStyle(
                              color: AppTheme.textDim,
                              fontSize: 10,
                              fontFamily: 'JetBrains Mono',
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Text(
                    desc,
                    style: TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 14,
                      height: 1.5,
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
}

class _StickyFooter extends StatelessWidget {
  const _StickyFooter();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF111620),
        border: const Border(top: BorderSide(color: AppTheme.surfaceHighlight)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 20,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1280),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    LucideIcons.info,
                    size: 18,
                    color: AppTheme.textDim,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    'Report generated by System on Oct 12, 16:00 UTC',
                    style: TextStyle(color: AppTheme.textDim, fontSize: 13),
                  ),
                ],
              ),
              Row(
                children: [
                  OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      side: const BorderSide(color: AppTheme.surfaceHighlight),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      'Request Changes',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 24,
                        vertical: 16,
                      ),
                      backgroundColor: AppTheme.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Row(
                      children: [
                        Icon(LucideIcons.check, size: 18),
                        SizedBox(width: 8),
                        Text(
                          'Approve Report',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
