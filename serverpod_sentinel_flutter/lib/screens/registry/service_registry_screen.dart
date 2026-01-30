import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../theme/app_theme.dart';
import '../../theme/sentinel_motion.dart';
import '../../widgets/sentinel_card.dart';
import '../../widgets/status_pulsar.dart';
import '../../widgets/sentinel_shimmer.dart';
import '../../widgets/sentinel_state_view.dart';
import '../../providers/services_provider.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import 'create_service_dialog.dart';

class ServiceRegistryScreen extends ConsumerWidget {
  const ServiceRegistryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final servicesAsync = ref.watch(servicesProvider);

    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      body: SentinelStateView(
        state: servicesAsync,
        onRetry: () => ref.refresh(servicesProvider),
        loadingView: _LoadingGrid(),
        builder: (services) => CustomScrollView(
          slivers: [
            _RegistryHeader(),
            SliverPadding(
              padding: const EdgeInsets.all(32),
              sliver: _ServiceGrid(services: services),
            ),
          ],
        ),
      ),
    );
  }
}

class _RegistryHeader extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      expandedHeight: 100,
      backgroundColor: AppTheme.darkBackground.withOpacity(0.8),
      title: const Text(
        'Service Registry',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.filter_list_rounded,
            color: AppTheme.darkTextMuted,
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton.icon(
          onPressed: () async {
            final created = await showDialog<Service>(
              context: context,
              builder: (context) => const CreateServiceDialog(),
            );
            if (created != null) {
              ref.invalidate(servicesProvider);
            }
          },
          icon: const Icon(Icons.add_rounded),
          label: const Text('Register Service'),
        ),
        const SizedBox(width: 32),
      ],
    );
  }
}

class _ServiceGrid extends StatelessWidget {
  final List<Service> services;
  const _ServiceGrid({required this.services});

  @override
  Widget build(BuildContext context) {
    return SliverGrid(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 24,
        mainAxisSpacing: 24,
        childAspectRatio: 1.2,
      ),
      delegate: SliverChildBuilderDelegate((context, index) {
        final service = services[index];
        return SentinelMotion.fadeIn(
          _ServiceRegistryCard(service: service),
          delay: Duration(milliseconds: index * 50),
        );
      }, childCount: services.length),
    );
  }
}

class _ServiceRegistryCard extends StatelessWidget {
  final Service service;
  const _ServiceRegistryCard({required this.service});

  @override
  Widget build(BuildContext context) {
    final statusColor = _getStatusColor(service.status);

    return SentinelCard(
      padding: const EdgeInsets.all(24),
      footer: _CardFooter(service: service),
      mainAxisSize: MainAxisSize.max,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(Icons.layers_rounded, color: statusColor, size: 24),
              ),
              StatusPulsar(color: statusColor),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            service.name,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            service.description ?? 'No description provided.',
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
          const Spacer(),
          _MetricPreview(service: service),
        ],
      ),
    );
  }

  Color _getStatusColor(ServiceStatus status) {
    switch (status) {
      case ServiceStatus.OPERATIONAL:
        return AppTheme.success;
      case ServiceStatus.DEGRADED:
        return AppTheme.warning;
      case ServiceStatus.MAJOR_OUTAGE:
      case ServiceStatus.PARTIAL_OUTAGE:
        return AppTheme.error;
      case ServiceStatus.MAINTENANCE:
        return AppTheme.info;
    }
  }
}

class _MetricPreview extends StatelessWidget {
  final Service service;
  const _MetricPreview({required this.service});

  @override
  Widget build(BuildContext context) {
    final signals = service.signals ?? [];
    final cpuSignal = signals
        .where((s) => s.identifier.contains('cpu'))
        .firstOrNull;
    final memSignal = signals
        .where((s) => s.identifier.contains('memory'))
        .firstOrNull;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(
            child: _MiniMetric(
              label: 'CPU',
              value: cpuSignal?.currentValue != null
                  ? '${cpuSignal!.currentValue!.toStringAsFixed(1)}%'
                  : 'N/A',
            ),
          ),
          Container(width: 1, height: 24, color: AppTheme.darkBorder),
          Expanded(
            child: _MiniMetric(
              label: 'Memory',
              value: memSignal?.currentValue != null
                  ? '${memSignal!.currentValue!.toStringAsFixed(1)}%'
                  : 'N/A',
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniMetric extends StatelessWidget {
  final String label;
  final String value;
  const _MiniMetric({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Text(
          label,
          style: const TextStyle(fontSize: 10, color: AppTheme.darkTextDim),
        ),
      ],
    );
  }
}

class _CardFooter extends StatelessWidget {
  final Service service;
  const _CardFooter({required this.service});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.public_rounded,
                size: 14,
                color: AppTheme.darkTextMuted,
              ),
              const SizedBox(width: 6),
              Text(
                service.region,
                style: const TextStyle(
                  fontSize: 11,
                  color: AppTheme.darkTextMuted,
                ),
              ),
            ],
          ),
          Text(
            service.tier.name,
            style: const TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
              color: AppTheme.primary,
            ),
          ),
        ],
      ),
    );
  }
}

class _LoadingGrid extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        _RegistryHeader(),
        SliverPadding(
          padding: const EdgeInsets.all(32),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 24,
              mainAxisSpacing: 24,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) => SentinelShimmer.box(height: 200),
              childCount: 6,
            ),
          ),
        ),
      ],
    );
  }
}
