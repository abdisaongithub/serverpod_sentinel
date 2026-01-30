import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import '../../theme/app_theme.dart';

import '../../widgets/sentinel_card.dart';
import '../../widgets/status_pulsar.dart';
import '../../widgets/app_right_sidebar.dart';
import '../../providers/services_provider.dart';

import '../../services/serverpod_client.dart';

class ServiceDetailScreen extends ConsumerWidget {
  final int serviceId;
  const ServiceDetailScreen({super.key, required this.serviceId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final servicesAsync = ref.watch(servicesProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;

        return Scaffold(
          backgroundColor: AppTheme.darkBackground,
          body: servicesAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
            data: (services) {
              final service = services.firstWhere(
                (s) => s.id == serviceId,
                orElse: () => throw Exception('Service not found'),
              );

              return Column(
                children: [
                  _Header(isDesktop: isDesktop, serviceName: service.name),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(isDesktop ? 32 : 16),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1600),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  _ServiceHeader(service: service),
                                  const SizedBox(height: 32),
                                  _MetricsSection(serviceId: serviceId),
                                  const SizedBox(height: 32),
                                  _BottomSection(
                                    isDesktop: isDesktop,
                                    service: service,
                                  ),
                                ],
                              ),
                            ),
                            if (isDesktop) ...[
                              const SizedBox(width: 32),
                              AppRightSidebar(
                                title: 'SERVICE SETTINGS',
                                children: [
                                  RightSidebarSettingItem(
                                    label: 'Auto-scaling',
                                  ),
                                  RightSidebarSettingItem(
                                    label: 'Health Checks',
                                  ),
                                  RightSidebarSettingItem(
                                    label: 'Load Balancer',
                                  ),
                                  _AgentConnectionItem(serviceId: serviceId),
                                ],
                              ),
                            ],
                          ],
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
  final bool isDesktop;
  final String serviceName;
  const _Header({required this.isDesktop, required this.serviceName});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: AppTheme.darkSurface,
        border: const Border(bottom: BorderSide(color: AppTheme.darkBorder)),
      ),
      child: Row(
        children: [
          if (!isDesktop)
            IconButton(
              icon: const Icon(Icons.arrow_back, color: AppTheme.darkTextMuted),
              onPressed: () => context.pop(),
            )
          else
            Row(
              children: [
                TextButton(
                  onPressed: () => context.pop(),
                  child: const Text(
                    'Services',
                    style: TextStyle(color: AppTheme.darkTextMuted),
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: AppTheme.darkTextDim,
                  size: 16,
                ),
                const SizedBox(width: 8),
                Text(
                  serviceName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.search, color: AppTheme.darkTextMuted),
            onPressed: () {},
          ),
          _NotificationBell(),
        ],
      ),
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
            width: 6,
            height: 6,
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

class _ServiceHeader extends StatelessWidget {
  final Service service;
  const _ServiceHeader({required this.service});

  @override
  Widget build(BuildContext context) {
    final statusColor = service.status == ServiceStatus.OPERATIONAL
        ? AppTheme.success
        : AppTheme.error;

    return SentinelCard(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: AppTheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Icon(
              Icons.layers_rounded,
              color: AppTheme.primary,
              size: 32,
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  service.name,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      service.region,
                      style: TextStyle(
                        color: AppTheme.darkTextMuted,
                        fontSize: 14,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      width: 4,
                      height: 4,
                      decoration: const BoxDecoration(
                        color: AppTheme.darkTextDim,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Text(
                      service.tier.name,
                      style: const TextStyle(
                        color: AppTheme.primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  StatusPulsar(color: statusColor, size: 8),
                  const SizedBox(width: 12),
                  Text(
                    service.status.name,
                    style: TextStyle(
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                'Last update: 2m ago',
                style: TextStyle(color: AppTheme.darkTextDim, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _MetricsSection extends ConsumerWidget {
  final int serviceId;
  const _MetricsSection({required this.serviceId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'LIVE PERFORMANCE',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            letterSpacing: 1,
            color: AppTheme.darkTextMuted,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _MetricTile(
                label: 'Avg Response Time',
                value: '42ms',
                color: AppTheme.primary,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: _MetricTile(
                label: 'Error Rate',
                value: '0.02%',
                color: AppTheme.success,
              ),
            ),
            const SizedBox(width: 24),
            Expanded(
              child: _MetricTile(
                label: 'Request Count',
                value: '1.2k/s',
                color: AppTheme.info,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MetricTile extends StatelessWidget {
  final String label;
  final String value;
  final Color color;

  const _MetricTile({
    required this.label,
    required this.value,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SentinelCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 12, color: AppTheme.darkTextMuted),
          ),
          const SizedBox(height: 8),
          Text(
            value,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 12),
          Container(
            height: 2,
            width: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(1),
            ),
          ),
        ],
      ),
    );
  }
}

class _BottomSection extends StatelessWidget {
  final bool isDesktop;
  final Service service;
  const _BottomSection({required this.isDesktop, required this.service});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(flex: 2, child: _IncidentsList()),
        const SizedBox(width: 24),
        Expanded(child: _MetadataPanel()),
      ],
    );
  }
}

class _IncidentsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'RELATED INCIDENTS',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            letterSpacing: 1,
            color: AppTheme.darkTextMuted,
          ),
        ),
        const SizedBox(height: 16),
        SentinelCard(
          padding: EdgeInsets.zero,
          child: Column(
            children: List.generate(2, (i) => _IncidentItem(isLast: i == 1)),
          ),
        ),
      ],
    );
  }
}

class _IncidentItem extends StatelessWidget {
  final bool isLast;
  const _IncidentItem({required this.isLast});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: isLast
            ? null
            : const Border(bottom: BorderSide(color: AppTheme.darkBorder)),
      ),
      child: Row(
        children: [
          const Icon(Icons.warning_rounded, color: AppTheme.warning, size: 20),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Latency threshold exceeded',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  'Detected in region us-east-1',
                  style: TextStyle(color: AppTheme.darkTextDim, fontSize: 12),
                ),
              ],
            ),
          ),
          const Text(
            '2h ago',
            style: TextStyle(color: AppTheme.darkTextDim, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _MetadataPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'METADATA',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 12,
            letterSpacing: 1,
            color: AppTheme.darkTextMuted,
          ),
        ),
        const SizedBox(height: 16),
        SentinelCard(
          child: Column(
            children: [
              _MetaRow(label: 'Provider', value: 'AWS EKS'),
              const Divider(height: 24),
              _MetaRow(label: 'Runtime', value: 'Node.js 18.x'),
              const Divider(height: 24),
              _MetaRow(label: 'Repository', value: 'sentinel/api-backend'),
            ],
          ),
        ),
      ],
    );
  }
}

class _MetaRow extends StatelessWidget {
  final String label;
  final String value;
  const _MetaRow({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(color: AppTheme.darkTextMuted, fontSize: 13),
        ),
        Text(
          value,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 13),
        ),
      ],
    );
  }
}

class _AgentConnectionItem extends ConsumerStatefulWidget {
  final int serviceId;
  const _AgentConnectionItem({super.key, required this.serviceId});

  @override
  ConsumerState<_AgentConnectionItem> createState() =>
      _AgentConnectionItemState();
}

class _AgentConnectionItemState extends ConsumerState<_AgentConnectionItem> {
  bool _isLoading = false;

  Future<void> _regenerateToken() async {
    setState(() => _isLoading = true);
    try {
      final success = await ServerpodClientSingleton.client.agent
          .generateConnection(widget.serviceId);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              success
                  ? 'Agent token regenerated. Restart the agent to apply changes.'
                  : 'Failed to update config. Check server logs.',
            ),
            backgroundColor: success ? AppTheme.success : AppTheme.error,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e'), backgroundColor: AppTheme.error),
        );
      }
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Agent Connection',
                style: TextStyle(color: AppTheme.darkTextDim, fontSize: 13),
              ),
              if (_isLoading)
                const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: AppTheme.primary,
                  ),
                )
              else
                IconButton(
                  icon: const Icon(
                    Icons.refresh,
                    size: 16,
                    color: AppTheme.primary,
                  ),
                  onPressed: _regenerateToken,
                  tooltip: 'Regenerate Token',
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  splashRadius: 20,
                ),
            ],
          ),
        ],
      ),
    );
  }
}
