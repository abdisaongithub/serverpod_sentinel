import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:go_router/go_router.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';
import '../../widgets/app_sidebar.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import '../../providers/reports_provider.dart';

import 'dart:convert';
import '../../services/report_generator.dart';

class IncidentReportScreen extends ConsumerWidget {
  final int? reportId;

  const IncidentReportScreen({super.key, this.reportId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final idParam = GoRouterState.of(context).uri.queryParameters['id'];
    final id = reportId ?? (idParam != null ? int.tryParse(idParam) : null);

    if (id == null) {
      return Scaffold(
        backgroundColor: AppTheme.background,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(LucideIcons.arrowLeft, color: Colors.white),
            onPressed: () => context.go(AppRoutes.reports),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(LucideIcons.fileX, size: 64, color: AppTheme.textMuted),
              const SizedBox(height: 16),
              const Text(
                'No Report Selected',
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              const Text(
                'Please select a report from the list.',
                style: TextStyle(color: AppTheme.textMuted),
              ),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                onPressed: () => context.go(AppRoutes.reports),
                icon: const Icon(LucideIcons.list, size: 16),
                label: const Text('View All Reports'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary,
                  foregroundColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
    }

    final snapshotAsync = ref.watch(reportSnapshotProvider(id));

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
          body: snapshotAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, s) => Center(
              child: Text(
                'Error: $e',
                style: const TextStyle(color: Colors.red),
              ),
            ),
            data: (snapshot) {
              if (snapshot == null)
                return const Center(child: Text('Report not found'));

              // Parse JSON content
              Map<String, dynamic> data = {};
              try {
                data = jsonDecode(snapshot.content);
              } catch (e) {
                print('Error parsing generic report content: $e');
              }

              return Column(
                children: [
                  _Header(snapshot: snapshot, data: data),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.fromLTRB(24, 24, 24, 100),
                      child: Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(maxWidth: 1280),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              if (data['summary'] != null) ...[
                                _ExecutiveSummaryCard(summary: data['summary']),
                                const SizedBox(height: 24),
                              ],
                              // Only show generic chart if we don't have RCA data for now (since we don't have real RCA fields yet)
                              _ChartCard(stats: data['summary']),
                              const SizedBox(height: 40),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  final ReportSnapshot snapshot;
  final Map<String, dynamic> data;

  const _Header({required this.snapshot, required this.data});

  @override
  Widget build(BuildContext context) {
    final isDesktop =
        MediaQuery.of(context).size.width >= AppTheme.tabletBreakpoint;

    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: const Color(0xFF111620).withValues(alpha: 0.8),
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
                    const Text(
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
                    Text(
                      '#${snapshot.incidentId ?? "Gen"}',
                      style: const TextStyle(
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
                    Text(
                      snapshot.incident?.title ?? 'Report',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 12),
                    if (data['reportType'] != null)
                      _HeaderBadge(
                        label: data['reportType'].toString().toUpperCase(),
                        color: Colors.blue.shade400,
                        bgColor: Colors.blue.withValues(alpha: 0.1),
                      ),
                  ],
                ),
              ],
            ),
          ),
          ElevatedButton.icon(
            onPressed: () {
              ReportGenerator.generateAndDownload(
                data,
                snapshot.incident?.title ?? 'Incident Report',
              );
            },
            icon: const Icon(LucideIcons.download, size: 16),
            label: const Text('Export PDF'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primary,
              foregroundColor: Colors.white,
            ),
          ),
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
        border: Border.all(color: color.withValues(alpha: 0.3)),
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

// _HeaderAction removed

class _ExecutiveSummaryCard extends StatelessWidget {
  final Map<String, dynamic> summary;
  const _ExecutiveSummaryCard({required this.summary});

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
            color: Colors.black.withValues(alpha: 0.2),
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
                    Text(
                      'Total Services: ${summary['totalServices'] ?? 0}\n'
                      'Operational: ${summary['operational'] ?? 0}\n'
                      'Degraded: ${summary['degraded'] ?? 0}\n'
                      'Outage: ${summary['outage'] ?? 0}',
                      style: const TextStyle(
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
                color: Colors.white.withValues(alpha: 0.02),
                padding: const EdgeInsets.all(24),
                child: Column(
                  children: [
                    _MetricRow(
                      label1: 'Health Score',
                      value1:
                          '${(summary['healthScore'] ?? 0.0).toStringAsFixed(1)}%',
                      label2: 'Maintenance',
                      value2: '${summary['maintenance'] ?? 0}',
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
  _MetricRow({
    required this.label1,
    required this.value1,
    required this.label2,
    required this.value2,
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
              Text(
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
              Text(
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

// _RcaAndChartSection, _RcaCard removed

// _RcaCard removed

class _ChartCard extends StatelessWidget {
  final Map<String, dynamic>? stats;
  const _ChartCard({this.stats});

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
                        'Report Statistics',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Overview',
                        style: TextStyle(color: AppTheme.textDim, fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 24),
          Text(stats.toString(), style: const TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}

// _Bar removed

// _MetricBox removed

// _StickyFooter removed
