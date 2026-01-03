import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';

class ServiceRegistryScreen extends StatefulWidget {
  const ServiceRegistryScreen({super.key});

  @override
  State<ServiceRegistryScreen> createState() => _ServiceRegistryScreenState();
}

class _ServiceRegistryScreenState extends State<ServiceRegistryScreen> {
  int _currentNavIndex = 2;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;

        return Scaffold(
          backgroundColor: const Color(0xFF0F172A),
          body: Column(
            children: [
              _Header(isDesktop: isDesktop),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(isDesktop ? 32 : 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _FilterBar(isDesktop: isDesktop),
                      const SizedBox(height: 24),
                      const _StatsRow(),
                      const SizedBox(height: 24),
                      _ServiceGrid(isDesktop: isDesktop),
                      const SizedBox(height: 24),
                      const _Pagination(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: isDesktop
              ? null
              : Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF1E293B),
                    border: Border(top: BorderSide(color: Color(0xFF334155))),
                  ),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: AppTheme.primary,
                    unselectedItemColor: const Color(0xFF94A3B8),
                    currentIndex: _currentNavIndex,
                    onTap: (index) {
                      if (index == _currentNavIndex) return;
                      setState(() => _currentNavIndex = index);
                      if (index == 0) {
                        context.go(AppRoutes.dashboard);
                      } else if (index == 3) {
                        context.go(AppRoutes.liveStream);
                      } else if (index == 4) {
                        context.go(AppRoutes.settings);
                      }
                    },
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.dashboard),
                        label: 'Dashboard',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.notifications),
                        label: 'Alerts',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.dns),
                        label: 'Registry',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.monitor),
                        label: 'Monitoring',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.settings),
                        label: 'Settings',
                      ),
                    ],
                  ),
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
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 24 : 16),
      decoration: const BoxDecoration(
        color: Color(0xFF1E293B),
        border: Border(bottom: BorderSide(color: Color(0xFF334155))),
      ),
      child: Row(
        children: [
          if (!isDesktop)
            IconButton(
              icon: const Icon(Icons.menu, color: Color(0xFF94A3B8)),
              onPressed: () {},
            ),
          if (isDesktop)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  'Service Registry',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Manage and monitor microservices',
                  style: TextStyle(color: Color(0xFF94A3B8), fontSize: 12),
                ),
              ],
            )
          else
            const Text(
              'Registry',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          const Spacer(),
          if (isDesktop)
            Container(
              width: 320,
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF334155),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search, color: Color(0xFF94A3B8), size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Search services...',
                      style: TextStyle(color: Color(0xFF64748B), fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(width: 16),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.add, size: 20),
            label: Text(isDesktop ? 'Register Service' : ''),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primary,
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 16 : 12,
                vertical: 10,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _FilterBar extends StatelessWidget {
  final bool isDesktop;
  const _FilterBar({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF334155)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'FILTERS:',
                style: TextStyle(
                  color: Color(0xFF64748B),
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(width: 8),
              Container(width: 1, height: 16, color: const Color(0xFF334155)),
              const SizedBox(width: 8),
              DropdownButton<String>(
                value: 'All',
                underline: const SizedBox(),
                dropdownColor: const Color(0xFF1E293B),
                style: const TextStyle(color: Colors.white, fontSize: 14),
                items: ['All', 'Production', 'Staging', 'Development']
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text('Environment: $e'),
                      ),
                    )
                    .toList(),
                onChanged: (_) {},
              ),
              Container(width: 1, height: 16, color: const Color(0xFF334155)),
              const SizedBox(width: 8),
              DropdownButton<String>(
                value: 'All',
                underline: const SizedBox(),
                dropdownColor: const Color(0xFF1E293B),
                style: const TextStyle(color: Colors.white, fontSize: 14),
                items: ['All', 'Healthy', 'Warning', 'Critical']
                    .map(
                      (e) =>
                          DropdownMenuItem(value: e, child: Text('Health: $e')),
                    )
                    .toList(),
                onChanged: (_) {},
              ),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: const Color(0xFFEF4444).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFFEF4444).withOpacity(0.3)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  color: Color(0xFFEF4444),
                  shape: BoxShape.circle,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Critical (1)',
                style: TextStyle(
                  color: Color(0xFFEF4444),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const Spacer(),
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF334155)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(Icons.grid_view, color: AppTheme.primary, size: 20),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
              ),
              IconButton(
                icon: const Icon(
                  Icons.view_list,
                  color: Color(0xFF64748B),
                  size: 20,
                ),
                onPressed: () {},
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmall = constraints.maxWidth < 600;
        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _StatCard(
              label: 'Total Services',
              value: '48',
              width: isSmall ? constraints.maxWidth / 2 - 8 : null,
            ),
            _StatCard(
              label: 'Healthy',
              value: '42',
              valueColor: const Color(0xFF22C55E),
              width: isSmall ? constraints.maxWidth / 2 - 8 : null,
            ),
            _StatCard(
              label: 'Warnings',
              value: '5',
              valueColor: const Color(0xFFF59E0B),
              width: isSmall ? constraints.maxWidth / 2 - 8 : null,
            ),
            _StatCard(
              label: 'Critical',
              value: '1',
              valueColor: const Color(0xFFEF4444),
              highlight: true,
              width: isSmall ? constraints.maxWidth / 2 - 8 : null,
            ),
          ],
        );
      },
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final Color? valueColor;
  final bool highlight;
  final double? width;

  const _StatCard({
    required this.label,
    required this.value,
    this.valueColor,
    this.highlight = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border(
          left: highlight
              ? const BorderSide(color: Color(0xFFEF4444), width: 4)
              : BorderSide.none,
          top: BorderSide(color: const Color(0xFF334155)),
          right: BorderSide(color: const Color(0xFF334155)),
          bottom: BorderSide(color: const Color(0xFF334155)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: const TextStyle(
              color: Color(0xFF94A3B8),
              fontSize: 10,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              color: valueColor ?? Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _ServiceGrid extends StatelessWidget {
  final bool isDesktop;
  const _ServiceGrid({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    final services = [
      _ServiceData(
        name: 'Auth-Service',
        id: '#srv-001',
        team: 'Team Alpha',
        heartbeat: '2m ago',
        status: ServiceStatus.healthy,
        env: 'Prod',
        envColor: const Color(0xFF3B82F6),
      ),
      _ServiceData(
        name: 'Payment-Gateway',
        id: 'High Latency Detected',
        team: 'FinOps',
        heartbeat: '10s ago',
        status: ServiceStatus.warning,
        env: 'Prod',
        envColor: const Color(0xFF3B82F6),
        latency: 850,
      ),
      _ServiceData(
        name: 'Email-Worker',
        id: 'Connection Refused',
        team: 'Comm Team',
        heartbeat: '5h ago',
        status: ServiceStatus.critical,
        env: 'Staging',
        envColor: const Color(0xFF8B5CF6),
        error: 'TCP connection timeout on port 587. Check firewall rules.',
      ),
      _ServiceData(
        name: 'Analytics-Stream',
        id: 'Maintenance Mode',
        team: 'Data Eng',
        heartbeat: '1d 4h',
        status: ServiceStatus.maintenance,
        env: 'Prod',
        envColor: const Color(0xFF3B82F6),
      ),
      _ServiceData(
        name: 'User-Profile',
        id: '#srv-042',
        team: 'Team Alpha',
        heartbeat: '1h ago',
        status: ServiceStatus.healthy,
        env: 'Dev',
        envColor: const Color(0xFF22C55E),
      ),
      _ServiceData(
        name: 'Notification-Svc',
        id: '#srv-088',
        team: 'Comm Team',
        heartbeat: '30s ago',
        status: ServiceStatus.healthy,
        env: 'Prod',
        envColor: const Color(0xFF3B82F6),
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 1;
        if (constraints.maxWidth >= 1200)
          crossAxisCount = 4;
        else if (constraints.maxWidth >= 900)
          crossAxisCount = 3;
        else if (constraints.maxWidth >= 600)
          crossAxisCount = 2;

        return Wrap(
          spacing: 24,
          runSpacing: 24,
          children: services
              .map(
                (s) => SizedBox(
                  width:
                      (constraints.maxWidth - (crossAxisCount - 1) * 24) /
                      crossAxisCount,
                  child: _ServiceCard(data: s),
                ),
              )
              .toList(),
        );
      },
    );
  }
}

enum ServiceStatus { healthy, warning, critical, maintenance }

class _ServiceData {
  final String name;
  final String id;
  final String team;
  final String heartbeat;
  final ServiceStatus status;
  final String env;
  final Color envColor;
  final int? latency;
  final String? error;

  _ServiceData({
    required this.name,
    required this.id,
    required this.team,
    required this.heartbeat,
    required this.status,
    required this.env,
    required this.envColor,
    this.latency,
    this.error,
  });
}

class _ServiceCard extends StatelessWidget {
  final _ServiceData data;
  const _ServiceCard({required this.data});

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    IconData statusIcon;
    switch (data.status) {
      case ServiceStatus.healthy:
        statusColor = const Color(0xFF22C55E);
        statusIcon = Icons.check_circle;
        break;
      case ServiceStatus.warning:
        statusColor = const Color(0xFFF59E0B);
        statusIcon = Icons.warning;
        break;
      case ServiceStatus.critical:
        statusColor = const Color(0xFFEF4444);
        statusIcon = Icons.error;
        break;
      case ServiceStatus.maintenance:
        statusColor = const Color(0xFF64748B);
        statusIcon = Icons.build;
        break;
    }

    return GestureDetector(
      onTap: () => context.go(AppRoutes.serviceDetail),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF1E293B),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: data.status == ServiceStatus.critical
                ? const Color(0xFFEF4444).withOpacity(0.5)
                : (data.status == ServiceStatus.warning
                      ? const Color(0xFFF59E0B)
                      : const Color(0xFF334155)),
            width: data.status == ServiceStatus.warning ? 1 : 1,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.1),
                          shape: BoxShape.circle,
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: Icon(
                                statusIcon,
                                color: statusColor,
                                size: 22,
                              ),
                            ),
                            if (data.status == ServiceStatus.healthy)
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 12,
                                  height: 12,
                                  decoration: BoxDecoration(
                                    color: statusColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                      color: const Color(0xFF1E293B),
                                      width: 2,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              data.id,
                              style: TextStyle(
                                color: data.status == ServiceStatus.critical
                                    ? const Color(0xFFEF4444)
                                    : const Color(0xFF94A3B8),
                                fontSize: 12,
                                fontFamily: data.id.startsWith('#')
                                    ? 'monospace'
                                    : null,
                                fontWeight:
                                    data.status == ServiceStatus.critical
                                    ? FontWeight.bold
                                    : FontWeight.normal,
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
                          color: data.envColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: data.envColor.withOpacity(0.3),
                          ),
                        ),
                        child: Text(
                          data.env,
                          style: TextStyle(
                            color: data.envColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      _MetaItem(
                        label: 'Owner',
                        icon: Icons.groups,
                        value: data.team,
                      ),
                      const SizedBox(width: 16),
                      _MetaItem(
                        label: 'Last Heartbeat',
                        icon: Icons.schedule,
                        value: data.heartbeat,
                        highlight: data.status != ServiceStatus.healthy,
                      ),
                    ],
                  ),
                  if (data.latency != null) ...[
                    const SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'METRICS',
                          style: TextStyle(
                            color: Color(0xFF64748B),
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        const SizedBox(height: 6),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(4),
                          child: LinearProgressIndicator(
                            value: data.latency! / 1000,
                            backgroundColor: const Color(0xFF334155),
                            valueColor: const AlwaysStoppedAnimation(
                              Color(0xFFF59E0B),
                            ),
                            minHeight: 6,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Latency: ${data.latency}ms',
                            style: const TextStyle(
                              color: Color(0xFFF59E0B),
                              fontSize: 10,
                              fontFamily: 'monospace',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                  if (data.error != null) ...[
                    const SizedBox(height: 12),
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: const Color(0xFFEF4444).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(
                          color: const Color(0xFFEF4444).withOpacity(0.2),
                        ),
                      ),
                      child: Text(
                        'Error: ${data.error}',
                        style: const TextStyle(
                          color: Color(0xFFFCA5A5),
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                  if (data.status == ServiceStatus.healthy &&
                      data.latency == null &&
                      data.error == null) ...[
                    const SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          'STATUS',
                          style: TextStyle(
                            color: Color(0xFF64748B),
                            fontSize: 10,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'Operational - 99.9% Uptime',
                          style: TextStyle(
                            color: Color(0xFF22C55E),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.2),
                border: const Border(top: BorderSide(color: Color(0xFF334155))),
                borderRadius: const BorderRadius.vertical(
                  bottom: Radius.circular(12),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    data.status == ServiceStatus.critical
                        ? 'Restart Service'
                        : 'View Logs',
                    style: TextStyle(
                      color: data.status == ServiceStatus.critical
                          ? const Color(0xFFEF4444)
                          : const Color(0xFF94A3B8),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Icon(
                    Icons.arrow_forward,
                    color: Color(0xFF64748B),
                    size: 18,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _MetaItem extends StatelessWidget {
  final String label;
  final IconData icon;
  final String value;
  final bool highlight;

  const _MetaItem({
    required this.label,
    required this.icon,
    required this.value,
    this.highlight = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: const TextStyle(
              color: Color(0xFF64748B),
              fontSize: 10,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Icon(
                icon,
                size: 14,
                color: highlight
                    ? const Color(0xFFF59E0B)
                    : const Color(0xFF94A3B8),
              ),
              const SizedBox(width: 4),
              Text(
                value,
                style: TextStyle(
                  color: highlight
                      ? const Color(0xFFF59E0B)
                      : const Color(0xFFCBD5E1),
                  fontSize: 12,
                  fontFamily: 'monospace',
                  fontWeight: highlight ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Pagination extends StatelessWidget {
  const _Pagination();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFF334155))),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
              children: [
                TextSpan(text: 'Showing '),
                TextSpan(
                  text: '1',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(text: ' to '),
                TextSpan(
                  text: '6',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(text: ' of '),
                TextSpan(
                  text: '48',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                TextSpan(text: ' results'),
              ],
            ),
          ),
          Row(
            children: [
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF94A3B8),
                  side: const BorderSide(color: Color(0xFF334155)),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
                child: const Text('Previous'),
              ),
              const SizedBox(width: 8),
              OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF1E293B),
                  side: const BorderSide(color: Color(0xFF334155)),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 8,
                  ),
                ),
                child: const Text('Next'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
