import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../theme/app_theme.dart';
import '../../widgets/sentinel_card.dart';
import '../../widgets/sentinel_shimmer.dart';
import '../../widgets/sparkline_card.dart';
import '../../widgets/sentinel_state_view.dart';
import '../../providers/services_provider.dart';
import '../../providers/incidents_provider.dart';
import '../../providers/telemetry_provider.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final healthAsync = ref.watch(healthSummaryProvider);
    final metricsAsync = ref.watch(systemMetricsProvider);

    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      body: SentinelStateView(
        state: healthAsync,
        loadingView: _DashboardLoadingView(),
        onRetry: () {
          ref.refresh(healthSummaryProvider);
          ref.refresh(systemMetricsProvider);
          ref.refresh(activeIncidentsProvider);
        },
        builder: (health) => CustomScrollView(
          slivers: [
            _DashboardHeader(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 24,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _MetricOverviewRow(health: health, metrics: metricsAsync),
                    const SizedBox(height: 32),
                    _SectionHeader(
                      title: 'Critical Infrastructure',
                      actionLabel: 'View Registry',
                      onAction: () {
                        // In a real app, use a navigator to go to Registry
                      },
                    ),
                    const SizedBox(height: 16),
                    const _OutageGrid(),
                    const SizedBox(height: 32),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const _SectionHeader(
                                title: 'Service Health Heatmap',
                              ),
                              const SizedBox(height: 16),
                              _HealthHeatmap(),
                            ],
                          ),
                        ),
                        const SizedBox(width: 24),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const _SectionHeader(title: 'Throughput Trends'),
                              const SizedBox(height: 16),
                              SparklineCard(
                                title: 'Requests / Sec',
                                value: metricsAsync.maybeWhen(
                                  data: (m) =>
                                      '${(m.totalRequests ?? 0) ~/ 1000}k',
                                  orElse: () => '1.2k',
                                ),
                                data: const [
                                  10,
                                  15,
                                  8,
                                  20,
                                  25,
                                  22,
                                  30,
                                  28,
                                  35,
                                  40,
                                ],
                                color: AppTheme.primary,
                              ),
                              const SizedBox(height: 16),
                              SparklineCard(
                                title: 'System Error Rate',
                                value: metricsAsync.maybeWhen(
                                  data: (m) => '${m.errorRate}%',
                                  orElse: () => '0.00%',
                                ),
                                data: const [
                                  2.0,
                                  1.5,
                                  0.8,
                                  1.2,
                                  0.5,
                                  0.1,
                                  0.0,
                                  0.2,
                                  0.1,
                                  0.0,
                                ],
                                color: AppTheme.error,
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
          ],
        ),
      ),
    );
  }
}

class _DashboardLoadingView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(child: SentinelShimmer.box(height: 140)),
              const SizedBox(width: 24),
              Expanded(child: SentinelShimmer.box(height: 140)),
              const SizedBox(width: 24),
              Expanded(child: SentinelShimmer.box(height: 140)),
            ],
          ),
          const SizedBox(height: 32),
          SentinelShimmer.box(height: 40, width: 200),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(child: SentinelShimmer.box(height: 200)),
              const SizedBox(width: 24),
              Expanded(child: SentinelShimmer.box(height: 200)),
              const SizedBox(width: 24),
              Expanded(child: SentinelShimmer.box(height: 200)),
            ],
          ),
        ],
      ),
    );
  }
}

class _DashboardHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      expandedHeight: 120,
      backgroundColor: AppTheme.darkBackground.withOpacity(0.8),
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: const EdgeInsets.only(left: 32, bottom: 16),
        centerTitle: false,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Operations Dashboard',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 24,
              ),
            ),
            Text(
              'Real-time system monitoring & response',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.search_rounded, color: AppTheme.darkTextMuted),
        ),
        const SizedBox(width: 8),
        _NotificationBell(),
        const SizedBox(width: 32),
      ],
    );
  }
}

class _NotificationBell extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        const Icon(
          Icons.notifications_none_rounded,
          color: AppTheme.darkTextMuted,
        ),
        Positioned(
          top: 12,
          right: 4,
          child: Container(
            width: 8,
            height: 8,
            decoration: const BoxDecoration(
              color: AppTheme.error,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ],
    );
  }
}

class _MetricOverviewRow extends ConsumerWidget {
  final HealthSummary health;
  final AsyncValue<SystemMetrics> metrics;
  const _MetricOverviewRow({required this.health, required this.metrics});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        Expanded(
          child: _MetricCard(
            title: 'Global Uptime',
            value: '${health.healthPercentage.toStringAsFixed(2)}%',
            trend: '+0.02%',
            trendPositive: true,
            icon: Icons.history_rounded,
            color: AppTheme.success,
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: _MetricCard(
            title: 'Active Incidents',
            value: ref
                .watch(activeIncidentsProvider)
                .when(
                  data: (i) => i.length.toString(),
                  loading: () => '...',
                  error: (_, __) => '!',
                ),
            trend: 'Last 24h',
            trendPositive: false,
            icon: Icons.warning_amber_rounded,
            color: AppTheme.error,
          ),
        ),
        const SizedBox(width: 24),
        Expanded(
          child: _MetricCard(
            title: 'System Latency',
            value: metrics.maybeWhen(
              data: (m) => '${m.averageLatencyMs}ms',
              orElse: () => '42ms',
            ),
            trend: '-5ms',
            trendPositive: true,
            icon: Icons.speed_rounded,
            color: AppTheme.primary,
          ),
        ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String title;
  final String value;
  final String trend;
  final bool trendPositive;
  final IconData icon;
  final Color color;

  const _MetricCard({
    required this.title,
    required this.value,
    required this.trend,
    required this.trendPositive,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SentinelCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: Theme.of(context).textTheme.bodySmall),
              Icon(icon, color: color.withOpacity(0.5), size: 20),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: Theme.of(context).textTheme.headlineLarge?.copyWith(
              fontWeight: FontWeight.w800,
              fontSize: 32,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Icon(
                trendPositive
                    ? Icons.arrow_upward_rounded
                    : Icons.arrow_downward_rounded,
                size: 14,
                color: trendPositive ? AppTheme.success : AppTheme.error,
              ),
              const SizedBox(width: 4),
              Text(
                trend,
                style: TextStyle(
                  color: trendPositive ? AppTheme.success : AppTheme.error,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;

  const _SectionHeader({required this.title, this.actionLabel, this.onAction});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title.toUpperCase(),
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            letterSpacing: 1.5,
            color: AppTheme.darkTextMuted,
          ),
        ),
        if (actionLabel != null)
          TextButton(
            onPressed: onAction,
            child: Text(
              actionLabel!,
              style: const TextStyle(color: AppTheme.primary),
            ),
          ),
      ],
    );
  }
}

class _OutageGrid extends ConsumerWidget {
  const _OutageGrid();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final servicesAsync = ref.watch(servicesProvider);

    return servicesAsync.when(
      data: (services) {
        if (services.isEmpty) {
          return SizedBox(
            height: 200,
            child: SentinelCard(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.dns_outlined,
                      color: AppTheme.darkTextMuted,
                      size: 48,
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'No Services Registered',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      'Add services in the Registry to monitor them.',
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        // Show up to 6 services, prioritizing unhealthy ones
        final sortedServices = List<Service>.from(services)
          ..sort((a, b) {
            // Prioritize: MAJOR_OUTAGE > PARTIAL_OUTAGE > DEGRADED > rest
            int getScore(ServiceStatus s) {
              switch (s) {
                case ServiceStatus.MAJOR_OUTAGE:
                  return 0;
                case ServiceStatus.PARTIAL_OUTAGE:
                  return 1;
                case ServiceStatus.DEGRADED:
                  return 2;
                case ServiceStatus.MAINTENANCE:
                  return 3;
                case ServiceStatus.OPERATIONAL:
                  return 4;
              }
            }

            return getScore(a.status).compareTo(getScore(b.status));
          });

        final displayServices = sortedServices.take(6).toList();

        return Wrap(
          spacing: 24,
          runSpacing: 24,
          children: displayServices.map((service) {
            return SizedBox(
              width: 350, // Fixed width for consistent card size
              height: 180, // Fixed height for consistent card size
              child: _ServiceHealthCard(service: service),
            );
          }).toList(),
        );
      },
      loading: () => GridView.count(
        shrinkWrap: true,
        crossAxisCount: 3,
        crossAxisSpacing: 24,
        children: List.generate(3, (_) => SentinelShimmer.box(height: 120)),
      ),
      error: (_, __) => const Text('Failed to load services'),
    );
  }
}

class _ServiceHealthCard extends StatelessWidget {
  final Service service;
  const _ServiceHealthCard({required this.service});

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    IconData statusIcon;
    String statusLabel;

    switch (service.status) {
      case ServiceStatus.OPERATIONAL:
        statusColor = AppTheme.success;
        statusIcon = Icons.check_circle_outline_rounded;
        statusLabel = 'Operational';
        break;
      case ServiceStatus.DEGRADED:
        statusColor = AppTheme.warning;
        statusIcon = Icons.warning_amber_rounded;
        statusLabel = 'Degraded';
        break;
      case ServiceStatus.PARTIAL_OUTAGE:
        statusColor = AppTheme.warning;
        statusIcon = Icons.error_outline_rounded;
        statusLabel = 'Partial';
        break;
      case ServiceStatus.MAJOR_OUTAGE:
        statusColor = AppTheme.error;
        statusIcon = Icons.error_rounded;
        statusLabel = 'Major Outage';
        break;
      case ServiceStatus.MAINTENANCE:
        statusColor = AppTheme.primary;
        statusIcon = Icons.build_rounded;
        statusLabel = 'Maintenance';
        break;
      default:
        statusColor = AppTheme.success;
        statusIcon = Icons.check_circle_outline_rounded;
        statusLabel = 'Unknown';
    }

    return SentinelCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: statusColor,
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  service.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Icon(statusIcon, color: statusColor, size: 20),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            service.description ?? service.tier.name,
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 24), // Fixed spacing instead of Spacer
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  statusLabel.toUpperCase(),
                  style: TextStyle(
                    fontSize: 10,
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 12,
                color: AppTheme.darkTextMuted,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _HealthHeatmap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SentinelCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          SizedBox(
            height: 160,
            child: GridView.builder(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
              ),
              itemCount: 180, // ~6 months of days
              itemBuilder: (context, index) {
                final isStable = index % 15 != 0;
                return Container(
                  decoration: BoxDecoration(
                    color: isStable
                        ? AppTheme.success.withOpacity(0.1 + (index % 5) * 0.1)
                        : AppTheme.error.withOpacity(0.4),
                    borderRadius: BorderRadius.circular(2),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'UNSTABLE',
                style: TextStyle(fontSize: 10, color: AppTheme.darkTextDim),
              ),
              const SizedBox(width: 8),
              ...List.generate(
                5,
                (i) => Container(
                  width: 12,
                  height: 12,
                  margin: const EdgeInsets.only(left: 4),
                  decoration: BoxDecoration(
                    color: AppTheme.success.withOpacity(0.2 * (i + 1)),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Text(
                'STABLE',
                style: TextStyle(fontSize: 10, color: AppTheme.darkTextDim),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
