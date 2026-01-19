import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/services_provider.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import '../../widgets/shimmer_loading.dart';
import 'package:intl/intl.dart';

class ServiceRegistryScreen extends ConsumerStatefulWidget {
  const ServiceRegistryScreen({super.key});

  @override
  ConsumerState<ServiceRegistryScreen> createState() =>
      _ServiceRegistryScreenState();
}

class _ServiceRegistryScreenState extends ConsumerState<ServiceRegistryScreen> {
  int _currentNavIndex = 2;
  String _searchQuery = '';
  ServiceStatus? _statusFilter;
  String _environmentFilter = 'All';
  int _currentPage = 1;
  static const int _itemsPerPage = 12;

  // View mode: 'grid' or 'list'
  bool _isGridView = true;

  void _exportCsv(List<Service> services) {
    print('Exporting ${services.length} services');
    final header = 'ID,Name,Status,Environment,Owner,Updated At';
    final rows = services
        .map((s) {
          return '${s.id},${s.name},${s.status.name},Production,${s.owner?.userInfoId ?? "N/A"},${s.updatedAt}';
        })
        .join('\n');
    final csvContent = '$header\n$rows';

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Export CSV'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Copy the content below:'),
            const SizedBox(height: 16),
            Container(
              width: 500,
              height: 300,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF334155)),
              ),
              child: SingleChildScrollView(
                child: SelectableText(
                  csvContent,
                  style: const TextStyle(
                    fontFamily: 'monospace',
                    color: Color(0xFFE2E8F0),
                    fontSize: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final servicesAsync = ref.watch(servicesProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;

        return Scaffold(
          backgroundColor: const Color(0xFF0F172A),
          body: servicesAsync.when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('Error: $e')),
            data: (services) {
              // 1. Filter by Search Query
              var filtered = services.where((s) {
                final searchLower = _searchQuery.toLowerCase();
                return s.name.toLowerCase().contains(searchLower) ||
                    s.id.toString().contains(searchLower);
              }).toList();

              // 2. Filter by Status
              if (_statusFilter != null) {
                filtered = filtered
                    .where((s) => s.status == _statusFilter)
                    .toList();
              }

              // 3. Filter by Environment (Mock property for now)
              if (_environmentFilter != 'All') {
                // In a real app, check s.environment. Since we don't have it on the model yet,
                // we'll skip effective filtering or assume 'Production' for demo if needed.
                // useful for future.
              }

              // 4. Pagination
              final totalItems = filtered.length;
              final totalPages = (totalItems / _itemsPerPage).ceil();
              final startIndex = (_currentPage - 1) * _itemsPerPage;
              final endIndex = (startIndex + _itemsPerPage < totalItems)
                  ? startIndex + _itemsPerPage
                  : totalItems;

              final paginatedServices = (startIndex < totalItems)
                  ? filtered.sublist(startIndex, endIndex)
                  : <Service>[];

              return Column(
                children: [
                  _Header(
                    isDesktop: isDesktop,
                    onSearch: (value) => setState(() {
                      _searchQuery = value;
                      _currentPage = 1;
                    }),
                    onRegister: () {
                      // Navigate to create service or show dialog
                    },
                    onExport: () => _exportCsv(filtered),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(isDesktop ? 32 : 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _FilterBar(
                            isDesktop: isDesktop,
                            statusFilter: _statusFilter,
                            environmentFilter: _environmentFilter,
                            isGridView: _isGridView,
                            onStatusChanged: (val) => setState(() {
                              _statusFilter = val;
                              _currentPage = 1;
                            }),
                            onEnvironmentChanged: (val) => setState(() {
                              _environmentFilter = val ?? 'All';
                              _currentPage = 1;
                            }),
                            onViewModeChanged: (isGrid) => setState(() {
                              _isGridView = isGrid;
                            }),
                          ),
                          const SizedBox(height: 24),
                          const _StatsRow(),
                          const SizedBox(height: 24),
                          _ServiceGrid(
                            isDesktop: isDesktop,
                            services: paginatedServices,
                            isGridView: _isGridView,
                          ),
                          const SizedBox(height: 24),
                          _Pagination(
                            currentPage: _currentPage,
                            totalPages: totalPages > 0 ? totalPages : 1,
                            startIndex: startIndex + 1,
                            endIndex: endIndex,
                            totalItems: totalItems,
                            onPageChanged: (page) =>
                                setState(() => _currentPage = page),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            },
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
  final ValueChanged<String> onSearch;
  final VoidCallback onRegister;
  final VoidCallback onExport;

  const _Header({
    required this.isDesktop,
    required this.onSearch,
    required this.onRegister,
    required this.onExport,
  });

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
                children: [
                  const Icon(Icons.search, color: Color(0xFF94A3B8), size: 20),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      style: const TextStyle(color: Colors.white, fontSize: 14),
                      decoration: const InputDecoration(
                        hintText: 'Search services...',
                        hintStyle: TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 14,
                        ),
                        border: InputBorder.none,
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                      ),
                      onChanged: onSearch,
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(width: 16),
          ElevatedButton.icon(
            onPressed: onRegister,
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
          const SizedBox(width: 12),
          OutlinedButton.icon(
            onPressed: onExport,
            icon: const Icon(Icons.download, size: 20),
            label: Text(isDesktop ? 'Export CSV' : ''),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white,
              side: const BorderSide(color: Color(0xFF334155)),
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
  final ServiceStatus? statusFilter;
  final String environmentFilter;
  final bool isGridView;
  final ValueChanged<ServiceStatus?> onStatusChanged;
  final ValueChanged<String?> onEnvironmentChanged;
  final ValueChanged<bool> onViewModeChanged;

  const _FilterBar({
    required this.isDesktop,
    required this.statusFilter,
    required this.environmentFilter,
    required this.isGridView,
    required this.onStatusChanged,
    required this.onEnvironmentChanged,
    required this.onViewModeChanged,
  });

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
                value: environmentFilter,
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
                onChanged: onEnvironmentChanged,
              ),
              Container(width: 1, height: 16, color: const Color(0xFF334155)),
              const SizedBox(width: 8),
              DropdownButton<ServiceStatus?>(
                value: statusFilter,
                underline: const SizedBox(),
                dropdownColor: const Color(0xFF1E293B),
                style: const TextStyle(color: Colors.white, fontSize: 14),
                items: [
                  const DropdownMenuItem<ServiceStatus?>(
                    value: null,
                    child: Text('Health: All'),
                  ),
                  ...ServiceStatus.values.map(
                    (e) => DropdownMenuItem(
                      value: e,
                      child: Text('Health: ${e.name}'),
                    ),
                  ),
                ],
                onChanged: onStatusChanged,
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
                icon: Icon(
                  Icons.grid_view,
                  color: isGridView
                      ? AppTheme.primary
                      : const Color(0xFF64748B),
                  size: 20,
                ),
                onPressed: () => onViewModeChanged(true),
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
              ),
              IconButton(
                icon: Icon(
                  Icons.view_list,
                  color: !isGridView
                      ? AppTheme.primary
                      : const Color(0xFF64748B),
                  size: 20,
                ),
                onPressed: () => onViewModeChanged(false),
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

class _StatsRow extends ConsumerWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final servicesAsync = ref.watch(servicesProvider);

    return servicesAsync.when(
      loading: () => const ShimmerBox(width: double.infinity, height: 100),
      error: (_, __) => const SizedBox(),
      data: (services) {
        final total = services.length;
        final healthy = services
            .where((s) => s.status == ServiceStatus.OPERATIONAL)
            .length;
        final warnings = services
            .where((s) => s.status == ServiceStatus.DEGRADED)
            .length;
        final critical = services
            .where(
              (s) =>
                  s.status == ServiceStatus.PARTIAL_OUTAGE ||
                  s.status == ServiceStatus.MAJOR_OUTAGE,
            )
            .length;

        return LayoutBuilder(
          builder: (context, constraints) {
            final isSmall = constraints.maxWidth < 600;
            return Wrap(
              spacing: 16,
              runSpacing: 16,
              children: [
                _StatCard(
                  label: 'Total Services',
                  value: total.toString(),
                  width: isSmall ? constraints.maxWidth / 2 - 8 : null,
                ),
                _StatCard(
                  label: 'Healthy',
                  value: healthy.toString(),
                  valueColor: const Color(0xFF22C55E),
                  width: isSmall ? constraints.maxWidth / 2 - 8 : null,
                ),
                _StatCard(
                  label: 'Warnings',
                  value: warnings.toString(),
                  valueColor: const Color(0xFFF59E0B),
                  width: isSmall ? constraints.maxWidth / 2 - 8 : null,
                ),
                _StatCard(
                  label: 'Critical',
                  value: critical.toString(),
                  valueColor: const Color(0xFFEF4444),
                  highlight: true,
                  width: isSmall ? constraints.maxWidth / 2 - 8 : null,
                ),
              ],
            );
          },
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
  final List<Service> services;
  final bool isGridView;

  const _ServiceGrid({
    required this.isDesktop,
    required this.services,
    required this.isGridView,
  });

  @override
  Widget build(BuildContext context) {
    if (services.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(32.0),
          child: Text(
            'No services found matching your criteria',
            style: TextStyle(color: Color(0xFF94A3B8)),
          ),
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        if (!isGridView) {
          return Column(
            children: services
                .map(
                  (s) => Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _ServiceCard(data: s),
                  ),
                )
                .toList(),
          );
        }

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

class _ServiceCard extends StatelessWidget {
  final Service data;
  const _ServiceCard({required this.data});

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    IconData statusIcon;
    switch (data.status) {
      case ServiceStatus.OPERATIONAL:
        statusColor = const Color(0xFF22C55E);
        statusIcon = Icons.check_circle;
        break;
      case ServiceStatus.DEGRADED:
        statusColor = const Color(0xFFF59E0B);
        statusIcon = Icons.warning;
        break;
      case ServiceStatus.PARTIAL_OUTAGE:
      case ServiceStatus.MAJOR_OUTAGE:
        statusColor = const Color(0xFFEF4444);
        statusIcon = Icons.error;
        break;
      case ServiceStatus.MAINTENANCE:
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
            color:
                data.status == ServiceStatus.PARTIAL_OUTAGE ||
                    data.status == ServiceStatus.MAJOR_OUTAGE
                ? const Color(0xFFEF4444).withOpacity(0.5)
                : (data.status == ServiceStatus.DEGRADED
                      ? const Color(0xFFF59E0B)
                      : const Color(0xFF334155)),
            width: data.status == ServiceStatus.DEGRADED ? 1 : 1,
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
                            if (data.status == ServiceStatus.OPERATIONAL)
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
                              '#${data.id}',
                              style: const TextStyle(
                                color: Color(0xFF94A3B8),
                                fontSize: 12,
                                fontFamily: 'monospace',
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
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(100),
                          border: Border.all(
                            color: Colors.blue.withOpacity(0.3),
                          ),
                        ),
                        child: Text(
                          'Prod',
                          style: TextStyle(
                            color: Colors.blue,
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
                        value:
                            data.owner?.userInfoId.toString() ?? 'Unassigned',
                      ),
                      const SizedBox(width: 16),
                      _MetaItem(
                        label: 'Last Heartbeat',
                        icon: Icons.schedule,
                        value: DateFormat(
                          'MMM d, h:mm a',
                        ).format(data.updatedAt),
                        highlight: data.status != ServiceStatus.OPERATIONAL,
                      ),
                    ],
                  ),
                  // Latency metrics removed as they are not on the Service model
                  // if (data.latency != null) ...[ ... ]
                  // Error details removed
                  // if (data.error != null) ...[ ... ]
                  if (data.status == ServiceStatus.OPERATIONAL) ...[
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
                          'Operational',
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
                    (data.status == ServiceStatus.PARTIAL_OUTAGE ||
                            data.status == ServiceStatus.MAJOR_OUTAGE)
                        ? 'Restart Service'
                        : 'View Logs',
                    style: TextStyle(
                      color:
                          (data.status == ServiceStatus.PARTIAL_OUTAGE ||
                              data.status == ServiceStatus.MAJOR_OUTAGE)
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
  final int currentPage;
  final int totalPages;
  final int startIndex;
  final int endIndex;
  final int totalItems;
  final ValueChanged<int> onPageChanged;

  const _Pagination({
    required this.currentPage,
    required this.totalPages,
    required this.startIndex,
    required this.endIndex,
    required this.totalItems,
    required this.onPageChanged,
  });

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
            text: TextSpan(
              style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
              children: [
                const TextSpan(text: 'Showing '),
                TextSpan(
                  text: startIndex.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const TextSpan(text: ' to '),
                TextSpan(
                  text: endIndex.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const TextSpan(text: ' of '),
                TextSpan(
                  text: totalItems.toString(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const TextSpan(text: ' results'),
              ],
            ),
          ),
          Row(
            children: [
              OutlinedButton(
                onPressed: currentPage > 1
                    ? () => onPageChanged(currentPage - 1)
                    : null,
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
                onPressed: currentPage < totalPages
                    ? () => onPageChanged(currentPage + 1)
                    : null,
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
