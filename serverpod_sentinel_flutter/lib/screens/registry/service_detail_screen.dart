import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';
import '../../widgets/app_sidebar.dart';
import '../../widgets/app_right_sidebar.dart';

class ServiceDetailScreen extends StatelessWidget {
  const ServiceDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;

        return Scaffold(
          backgroundColor: const Color(0xFF0B1120),
          body: Row(
            children: [
              if (isDesktop)
                const AppSidebar(activeRoute: AppRoutes.serviceDetail),
              Expanded(
                child: Column(
                  children: [
                    _Header(isDesktop: isDesktop),
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
                                    const _ServiceHeader(),
                                    const SizedBox(height: 24),
                                    const _MetricsSection(),
                                    const SizedBox(height: 24),
                                    _BottomSection(isDesktop: isDesktop),
                                    const SizedBox(height: 32),
                                  ],
                                ),
                              ),
                              if (isDesktop) ...[
                                const SizedBox(width: 32),
                                const AppRightSidebar(
                                  title: 'Service Settings',
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
                                  ],
                                ),
                              ],
                            ],
                          ),
                        ),
                      ),
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
  final bool isDesktop;
  const _Header({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: BoxDecoration(
        color: const Color(0xFF111722).withOpacity(0.8),
        border: const Border(bottom: BorderSide(color: Color(0xFF334155))),
      ),
      child: Row(
        children: [
          if (!isDesktop)
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF94A3B8)),
              onPressed: () => context.pop(),
            )
          else
            Row(
              children: [
                TextButton(
                  onPressed: () => context.pop(),
                  child: const Text(
                    'Services',
                    style: TextStyle(color: Color(0xFF94A3B8)),
                  ),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: Color(0xFF64748B),
                  size: 16,
                ),
                const Text(
                  'Backend',
                  style: TextStyle(color: Color(0xFF94A3B8)),
                ),
                const Icon(
                  Icons.chevron_right,
                  color: Color(0xFF64748B),
                  size: 16,
                ),
                const Text(
                  'Auth-Service-v4',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.search, color: Color(0xFF94A3B8)),
            onPressed: () {},
          ),
          Stack(
            children: [
              IconButton(
                icon: const Icon(Icons.notifications, color: Color(0xFF94A3B8)),
                onPressed: () {},
              ),
              Positioned(
                top: 10,
                right: 10,
                child: Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEF4444),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF111722),
                      width: 2,
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

class _ServiceHeader extends StatelessWidget {
  const _ServiceHeader();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isSmall = constraints.maxWidth < 600;
          return isSmall
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _ServiceInfo(),
                    const SizedBox(height: 24),
                    _ServiceStats(),
                  ],
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [_ServiceInfo(), _ServiceStats()],
                );
        },
      ),
    );
  }
}

class _ServiceInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          children: [
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppTheme.primary.withOpacity(0.2),
                    AppTheme.primary.withOpacity(0.05),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppTheme.primary.withOpacity(0.2)),
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primary.withOpacity(0.1),
                    blurRadius: 20,
                  ),
                ],
              ),
              child: Icon(Icons.security, color: AppTheme.primary, size: 40),
            ),
            Positioned(
              bottom: -4,
              right: -4,
              child: Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF1E293B), width: 4),
                ),
                child: Center(
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: const BoxDecoration(
                      color: Color(0xFF22C55E),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 20),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Auth-Service-v4',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 6),
            Wrap(
              spacing: 8,
              children: [
                const Text(
                  'us-east-1a',
                  style: TextStyle(
                    color: Color(0xFF92A4C9),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: Color(0xFF64748B),
                    shape: BoxShape.circle,
                  ),
                ),
                const Text(
                  'Production',
                  style: TextStyle(
                    color: Color(0xFF92A4C9),
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Container(
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: Color(0xFF64748B),
                    shape: BoxShape.circle,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Icon(
                      Icons.check_circle,
                      color: Color(0xFF22C55E),
                      size: 14,
                    ),
                    SizedBox(width: 4),
                    Text(
                      'SYSTEM HEALTHY',
                      style: TextStyle(
                        color: Color(0xFF22C55E),
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 0.5,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class _ServiceStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text(
              'Availability (24h)',
              style: TextStyle(
                color: Color(0xFF92A4C9),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '99.99%',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        Container(
          width: 1,
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          color: const Color(0xFF334155),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text(
              'Response Time',
              style: TextStyle(
                color: Color(0xFF92A4C9),
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            Text(
              '32ms',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MetricsSection extends StatelessWidget {
  const _MetricsSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Live Health Metrics',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: Row(
                children: const [
                  Text(
                    'View History',
                    style: TextStyle(
                      color: AppTheme.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_forward, color: AppTheme.primary, size: 16),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            final isSmall = constraints.maxWidth < 600;
            return Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _MetricCard(
                  label: 'CPU Usage',
                  value: '45%',
                  subValue: 'Avg 42%',
                  icon: Icons.memory,
                  color: const Color(0xFF3B82F6),
                  trend: '+3%',
                  trendUp: true,
                  width: isSmall
                      ? constraints.maxWidth
                      : (constraints.maxWidth - 48) / 4,
                ),
                _MetricCard(
                  label: 'RAM Usage',
                  value: '1.2',
                  unit: 'GB',
                  subValue: 'Peak 1.5GB',
                  icon: Icons.storage,
                  color: const Color(0xFF8B5CF6),
                  trend: '-0.1',
                  trendUp: false,
                  width: isSmall
                      ? constraints.maxWidth
                      : (constraints.maxWidth - 48) / 4,
                ),
                _MetricCard(
                  label: 'Error Rate',
                  value: '0.01%',
                  subValue: 'Stable',
                  icon: Icons.bug_report,
                  color: const Color(0xFF22C55E),
                  trend: 'OK',
                  width: isSmall
                      ? constraints.maxWidth
                      : (constraints.maxWidth - 48) / 4,
                ),
                _MetricCard(
                  label: 'Net I/O',
                  value: '32',
                  unit: 'ms',
                  subValue: 'Latency OK',
                  icon: Icons.network_check,
                  color: const Color(0xFFF59E0B),
                  trend: '~ Avg',
                  width: isSmall
                      ? constraints.maxWidth
                      : (constraints.maxWidth - 48) / 4,
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class _MetricCard extends StatelessWidget {
  final String label;
  final String value;
  final String? unit;
  final String subValue;
  final IconData icon;
  final Color color;
  final String trend;
  final bool? trendUp;
  final double width;

  const _MetricCard({
    required this.label,
    required this.value,
    this.unit,
    required this.subValue,
    required this.icon,
    required this.color,
    required this.trend,
    this.trendUp,
    required this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(icon, color: color, size: 20),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: const TextStyle(
                      color: Color(0xFF94A3B8),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              Text(
                subValue,
                style: const TextStyle(color: Color(0xFF64748B), fontSize: 12),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (unit != null)
                Text(
                  unit!,
                  style: const TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              const SizedBox(width: 8),
              Text(
                trend,
                style: TextStyle(
                  color: trendUp == null
                      ? const Color(0xFF22C55E)
                      : (trendUp!
                            ? const Color(0xFFEF4444)
                            : const Color(0xFF22C55E)),
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          _MiniChart(color: color),
        ],
      ),
    );
  }
}

class _MiniChart extends StatelessWidget {
  final Color color;
  const _MiniChart({required this.color});

  @override
  Widget build(BuildContext context) {
    final heights = [0.4, 0.6, 0.5, 0.75, 0.45];
    return SizedBox(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: heights
            .map(
              (h) => Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: color.withOpacity(h == 0.75 ? 1.0 : 0.3),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(2),
                    ),
                  ),
                  height: 40 * h,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _BottomSection extends StatelessWidget {
  final bool isDesktop;
  const _BottomSection({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 2,
            child: Column(
              children: const [
                _PlaybooksBar(),
                SizedBox(height: 24),
                _AlertsAndIncidents(),
              ],
            ),
          ),
          const SizedBox(width: 24),
          const Expanded(flex: 1, child: _MetadataPanel()),
        ],
      );
    } else {
      return Column(
        children: const [
          _PlaybooksBar(),
          SizedBox(height: 24),
          _AlertsAndIncidents(),
          SizedBox(height: 24),
          _MetadataPanel(),
        ],
      );
    }
  }
}

class _PlaybooksBar extends StatelessWidget {
  const _PlaybooksBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isSmall = constraints.maxWidth < 500;
          return Wrap(
            spacing: 12,
            runSpacing: 12,
            alignment: WrapAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.05),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.build,
                      color: Color(0xFF94A3B8),
                      size: 20,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text(
                        'Quick Playbooks',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'Common troubleshooting actions',
                        style: TextStyle(
                          color: Color(0xFF94A3B8),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Wrap(
                spacing: 12,
                children: [
                  _ActionButton(
                    icon: Icons.restart_alt,
                    label: 'Restart Service',
                    color: const Color(0xFFEF4444),
                    isSmall: isSmall,
                  ),
                  _ActionButton(
                    icon: Icons.terminal,
                    label: 'Logs & Traces',
                    isSmall: isSmall,
                  ),
                  _ActionButton(
                    icon: Icons.rule,
                    label: 'Check Config',
                    isSmall: isSmall,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color? color;
  final bool isSmall;

  const _ActionButton({
    required this.icon,
    required this.label,
    this.color,
    this.isSmall = false,
  });

  @override
  Widget build(BuildContext context) {
    final hasColor = color != null;
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isSmall ? 12 : 16,
        vertical: 10,
      ),
      decoration: BoxDecoration(
        color: hasColor ? color!.withOpacity(0.1) : const Color(0xFF111722),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: hasColor ? Colors.transparent : const Color(0xFF334155),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: hasColor ? color : const Color(0xFFCBD5E1),
            size: 18,
          ),
          if (!isSmall) ...[
            const SizedBox(width: 8),
            Text(
              label,
              style: TextStyle(
                color: hasColor ? color : const Color(0xFFCBD5E1),
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _AlertsAndIncidents extends StatelessWidget {
  const _AlertsAndIncidents();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmall = constraints.maxWidth < 600;
        return isSmall
            ? Column(
                children: const [
                  _AlertsPanel(),
                  SizedBox(height: 16),
                  _IncidentsPanel(),
                ],
              )
            : Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(child: _AlertsPanel()),
                  SizedBox(width: 24),
                  Expanded(child: _IncidentsPanel()),
                ],
              );
      },
    );
  }
}

class _AlertsPanel extends StatelessWidget {
  const _AlertsPanel();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.02),
              border: const Border(
                bottom: BorderSide(color: Color(0xFF334155)),
              ),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.notifications_active,
                  color: Color(0xFFF59E0B),
                  size: 20,
                ),
                const SizedBox(width: 8),
                const Text(
                  'Active Alerts',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF334155),
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: const Text(
                    '2',
                    style: TextStyle(
                      color: Color(0xFFCBD5E1),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Spacer(),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'View All',
                    style: TextStyle(
                      color: AppTheme.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _AlertItem(
                  title: 'High Latency Warning',
                  subtitle: 'Pod-452 • Latency > 200ms for 5 mins',
                  time: '2m ago',
                  color: const Color(0xFFEF4444),
                ),
                const SizedBox(height: 12),
                _AlertItem(
                  title: 'API Throttling 90%',
                  subtitle: 'Gateway • Request limit near capacity',
                  time: '15m ago',
                  color: const Color(0xFFF59E0B),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _AlertItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;
  final Color color;

  const _AlertItem({
    required this.title,
    required this.subtitle,
    required this.time,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: color.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: color.withOpacity(0.1),
              shape: BoxShape.circle,
            ),
            child: Icon(Icons.warning, color: color, size: 18),
          ),
          const SizedBox(width: 12),
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
                    Text(
                      time,
                      style: const TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 12,
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

class _IncidentsPanel extends StatelessWidget {
  const _IncidentsPanel();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.02),
              border: const Border(
                bottom: BorderSide(color: Color(0xFF334155)),
              ),
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: Row(
              children: const [
                Icon(Icons.history, color: Color(0xFF64748B), size: 20),
                SizedBox(width: 8),
                Text(
                  'Recent Incidents',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: const [
                _IncidentItem(
                  title: 'DB Connection Timeout',
                  subtitle: 'Resolved in 12m • Auto-scaled',
                  time: '2d ago',
                ),
                SizedBox(height: 12),
                _IncidentItem(
                  title: 'Deployment Rollback',
                  subtitle: 'v4.2.0 unstable • Reverted to v4.1.9',
                  time: '5d ago',
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Color(0xFF334155))),
            ),
            child: const Center(
              child: Text(
                'View Incident History',
                style: TextStyle(
                  color: Color(0xFF64748B),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _IncidentItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;

  const _IncidentItem({
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.05),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.check_circle,
              color: Color(0xFF64748B),
              size: 18,
            ),
          ),
          const SizedBox(width: 12),
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
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      time,
                      style: const TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: const TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 12,
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

class _MetadataPanel extends StatelessWidget {
  const _MetadataPanel();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFF334155))),
            ),
            child: const Text(
              'Service Metadata',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: _MetaField(
                        label: 'Version',
                        value: 'v4.2.1-beta',
                        isMono: true,
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            width: 20,
                            height: 20,
                            decoration: const BoxDecoration(
                              color: Color(0xFF6366F1),
                              shape: BoxShape.circle,
                            ),
                            child: const Center(
                              child: Text(
                                'TS',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 8,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          const Expanded(
                            child: _MetaField(
                              label: 'Owner',
                              value: 'Team Security',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Repository',
                      style: TextStyle(color: Color(0xFF92A4C9), fontSize: 12),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: const [
                        Icon(Icons.code, color: AppTheme.primary, size: 16),
                        SizedBox(width: 8),
                        Text(
                          'github.com/org/auth-service',
                          style: TextStyle(
                            color: AppTheme.primary,
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: const [
                    Expanded(
                      child: _MetaField(
                        label: 'Framework',
                        value: 'Node.js 18',
                      ),
                    ),
                    Expanded(
                      child: _MetaField(
                        label: 'Last Deploy',
                        value: '2 hours ago',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(top: BorderSide(color: Color(0xFF334155))),
                  ),
                  padding: const EdgeInsets.only(top: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'DEPENDENCIES',
                        style: TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _DependencyItem(name: 'Redis-Cluster', version: 'v6.2'),
                      const SizedBox(height: 8),
                      _DependencyItem(name: 'PostgreSQL', version: 'v14.1'),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: AppTheme.primary.withOpacity(0.2),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text(
                              'View Dependency Graph',
                              style: TextStyle(
                                color: AppTheme.primary,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(width: 4),
                            Icon(
                              Icons.open_in_new,
                              color: AppTheme.primary,
                              size: 14,
                            ),
                          ],
                        ),
                      ),
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

class _MetaField extends StatelessWidget {
  final String label;
  final String value;
  final bool isMono;

  const _MetaField({
    required this.label,
    required this.value,
    this.isMono = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(color: Color(0xFF92A4C9), fontSize: 12),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: isMono ? 'monospace' : null,
          ),
        ),
      ],
    );
  }
}

class _DependencyItem extends StatelessWidget {
  final String name;
  final String version;

  const _DependencyItem({required this.name, required this.version});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.02),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: const Color(0xFF334155)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFF22C55E),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                name,
                style: const TextStyle(
                  color: Color(0xFFCBD5E1),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Text(
            version,
            style: const TextStyle(
              color: Color(0xFF64748B),
              fontSize: 10,
              fontFamily: 'monospace',
            ),
          ),
        ],
      ),
    );
  }
}
