import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:intl/intl.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';
import '../../widgets/app_sidebar.dart';
import '../../providers/settings_provider.dart';

class AuditLogScreen extends ConsumerStatefulWidget {
  const AuditLogScreen({super.key});

  @override
  ConsumerState<AuditLogScreen> createState() => _AuditLogScreenState();
}

class _AuditLogScreenState extends ConsumerState<AuditLogScreen> {
  String _selectedFilter = 'All Events';
  final _dateFormat = DateFormat('HH:mm:ss');
  final _dayFormat = DateFormat('EEEE, MMM d');

  void _onFilterChanged(String filter) {
    setState(() {
      _selectedFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
    final auditLogsAsync = ref.watch(auditLogsProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;

        return Scaffold(
          backgroundColor: const Color(0xFF0B0E14),
          drawer: !isDesktop
              ? const Drawer(child: AppSidebar(activeRoute: AppRoutes.auditLog))
              : null,
          body: Column(
            children: [
              _Header(isDesktop: isDesktop),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _FilterBar(
                        selectedFilter: _selectedFilter,
                        onFilterChanged: _onFilterChanged,
                      ),
                      auditLogsAsync.when(
                        data: (logs) => _buildLogList(logs, isDesktop),
                        loading: () => const SizedBox(
                          height: 200,
                          child: Center(child: CircularProgressIndicator()),
                        ),
                        error: (err, stack) => SizedBox(
                          height: 200,
                          child: Center(
                            child: Text(
                              'Error: $err',
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        ),
                      ),
                      const _Footer(),
                      if (!isDesktop) const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: isDesktop ? null : const _MobileNav(),
        );
      },
    );
  }

  Widget _buildLogList(List<AuditLog> logs, bool isDesktop) {
    // 1. Filter locally
    final filtered = logs.where((log) {
      if (_selectedFilter == 'All Events') return true;
      if (_selectedFilter == 'Critical Errors') {
        // Naive heuristic since we lack severity field
        return log.action.toUpperCase().contains('DELETE') ||
            log.action.toUpperCase().contains('ERROR') ||
            log.action.toUpperCase().contains('FAIL');
      }
      if (_selectedFilter == 'Warnings') {
        return log.action.toUpperCase().contains('WARN');
      }
      if (_selectedFilter == 'User Actions') {
        // Assuming system actor has Id 0 or specific name, otherwise assume user
        // This is heuristic.
        return true;
      }
      return true;
    }).toList();

    // 2. Group by Day
    // Sort desc first
    filtered.sort((a, b) => b.createdAt.compareTo(a.createdAt));

    final grouped = <String, List<AuditLog>>{};
    for (var log in filtered) {
      final dayKey = _dayFormat.format(log.createdAt);
      grouped.putIfAbsent(dayKey, () => []).add(log);
    }

    if (grouped.isEmpty) {
      return Container(
        padding: const EdgeInsets.all(48),
        child: const Text(
          'No logs found for this filter.',
          style: TextStyle(color: AppTheme.textMuted),
        ),
      );
    }

    return Column(
      children: [
        _AuditTableHeader(isDesktop: isDesktop),
        ...grouped.entries.map((entry) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _DateSeparator(label: entry.key),
              ...entry.value.map(
                (log) => _AuditRow(
                  timestamp: _dateFormat.format(log.createdAt),
                  actorName: 'User ${log.actor?.userInfoId ?? "Unknown"}',
                  actorSub: 'ID: ${log.actorId}', // Could be role or email
                  actorImageUrl: null, // Add to OpsUser if available
                  actorIcon: LucideIcons.user,
                  actorIconColor: AppTheme.primary,
                  event: log.action,
                  details:
                      '${log.entityType} #${log.entityId} ${log.changes ?? ""}',
                  isSystem: false, // heuristic
                  isCritical: log.action.contains('DELETE'),
                  isDesktop: isDesktop,
                ),
              ),
            ],
          );
        }),
      ],
    );
  }
}

class _Header extends StatelessWidget {
  final bool isDesktop;
  const _Header({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 24),
      decoration: const BoxDecoration(
        color: Color(0xFF0B0E14),
        border: Border(bottom: BorderSide(color: Color(0xFF252E42))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              if (!isDesktop)
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(LucideIcons.menu, color: Colors.white),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Audit Log',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.w800,
                            letterSpacing: -0.5,
                          ),
                        ),
                        const SizedBox(width: 12),
                        if (isDesktop)
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF10B981).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: const Color(0xFF10B981).withOpacity(0.2),
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Icon(
                                  LucideIcons.shieldCheck,
                                  size: 14,
                                  color: Color(0xFF10B981),
                                ),
                                SizedBox(width: 6),
                                Text(
                                  'Immutable Record',
                                  style: TextStyle(
                                    color: Color(0xFF10B981),
                                    fontSize: 11,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'Track and monitor all system activities for compliance.',
                      style: const TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                      maxLines: 2,
                    ),
                  ],
                ),
              ),
              if (isDesktop) ...[
                const SizedBox(width: 24),
                // Search & Export
                Row(
                  children: [
                    Container(
                      width: 320,
                      height: 40,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1C2433),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: const Color(0xFF252E42)),
                      ),
                      child: TextField(
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                        decoration: InputDecoration(
                          hintText: 'Search by ID, User, or Event...',
                          hintStyle: const TextStyle(
                            color: Color(0xFF64748B),
                            fontSize: 13,
                          ),
                          prefixIcon: const Icon(
                            LucideIcons.search,
                            size: 18,
                            color: Color(0xFF64748B),
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 8,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    _HeaderIconButton(
                      icon: LucideIcons.download,
                      onPressed: () {},
                      tooltip: 'Export Logs',
                    ),
                  ],
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}

class _HeaderIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String tooltip;

  const _HeaderIconButton({
    required this.icon,
    required this.onPressed,
    required this.tooltip,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: const Color(0xFF1C2433),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: const Color(0xFF252E42)),
          ),
          child: Icon(icon, size: 20, color: const Color(0xFF94A3B8)),
        ),
      ),
    );
  }
}

class _FilterBar extends StatelessWidget {
  final String selectedFilter;
  final Function(String) onFilterChanged;

  const _FilterBar({
    required this.selectedFilter,
    required this.onFilterChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Row(
            children: [
              const Text(
                'Filters:',
                style: TextStyle(
                  color: Color(0xFF64748B),
                  fontSize: 12,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(width: 16),
              _FilterChip(
                label: 'All Events',
                isActive: selectedFilter == 'All Events',
                color: AppTheme.primary,
                onTap: () => onFilterChanged('All Events'),
              ),
              _FilterChip(
                label: 'Critical Errors',
                isActive: selectedFilter == 'Critical Errors',
                color: Colors.red,
                onTap: () => onFilterChanged('Critical Errors'),
              ),
              _FilterChip(
                label: 'Warnings',
                isActive: selectedFilter == 'Warnings',
                color: Colors.orange,
                onTap: () => onFilterChanged('Warnings'),
              ),
              _FilterChip(
                label: 'User Actions',
                isActive: selectedFilter == 'User Actions',
                icon: LucideIcons.user,
                onTap: () => onFilterChanged('User Actions'),
              ),
              const SizedBox(width: 32),
              TextButton(
                onPressed: () => onFilterChanged('All Events'),
                child: const Text(
                  'Clear all',
                  style: TextStyle(
                    color: AppTheme.primary,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
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

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isActive;
  final Color? color;
  final IconData? icon;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    this.isActive = false,
    this.color,
    this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive
              ? (color ?? AppTheme.primary)
              : const Color(0xFF1C2433),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isActive ? Colors.transparent : const Color(0xFF252E42),
          ),
          boxShadow: isActive
              ? [
                  BoxShadow(
                    color: (color ?? AppTheme.primary).withOpacity(0.3),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (icon != null) ...[
              Icon(
                icon,
                size: 14,
                color: isActive ? Colors.white : const Color(0xFF94A3B8),
              ),
              const SizedBox(width: 8),
            ] else if (color != null && !isActive) ...[
              Container(
                width: 8,
                height: 8,
                decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              ),
              const SizedBox(width: 8),
            ],
            Text(
              label,
              style: TextStyle(
                color: isActive ? Colors.white : const Color(0xFFCBD5E1),
                fontSize: 12,
                fontWeight: isActive ? FontWeight.bold : FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AuditTableHeader extends StatelessWidget {
  final bool isDesktop;
  const _AuditTableHeader({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 32 : 16,
        vertical: 12,
      ),
      decoration: const BoxDecoration(
        color: Color(0xFF0B0E14),
        border: Border.symmetric(
          horizontal: BorderSide(color: Color(0xFF252E42)),
        ),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 100,
            child: Text(
              'TIME (UTC)',
              style: TextStyle(
                color: Color(0xFF64748B),
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
              ),
            ),
          ),
          SizedBox(width: isDesktop ? 32 : 16),
          const Expanded(
            flex: 2,
            child: Text(
              'ACTOR',
              style: TextStyle(
                color: Color(0xFF64748B),
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
              ),
            ),
          ),
          SizedBox(width: isDesktop ? 32 : 16),
          const Expanded(
            flex: 3,
            child: Text(
              'EVENT',
              style: TextStyle(
                color: Color(0xFF64748B),
                fontSize: 11,
                fontWeight: FontWeight.w800,
                letterSpacing: 0.5,
              ),
            ),
          ),
          if (isDesktop) ...[
            const SizedBox(width: 32),
            const Expanded(
              flex: 4,
              child: Text(
                'DETAILS',
                style: TextStyle(
                  color: Color(0xFF64748B),
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _DateSeparator extends StatelessWidget {
  final String label;

  const _DateSeparator({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
      color: const Color(0xFF161B22).withOpacity(0.3),
      child: Row(
        children: [
          Text(
            label.toUpperCase(),
            style: const TextStyle(
              color: Color(0xFF64748B),
              fontSize: 10,
              fontWeight: FontWeight.w800,
              letterSpacing: 2,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(child: Container(height: 1, color: const Color(0xFF252E42))),
        ],
      ),
    );
  }
}

class _AuditRow extends StatelessWidget {
  final String timestamp;
  final String actorName;
  final String actorSub;
  final String? actorImageUrl;
  final IconData? actorIcon;
  final Color? actorIconColor;
  final String event;
  final String details;
  final bool isSystem;
  final bool isCritical;
  final bool isDesktop;

  const _AuditRow({
    required this.timestamp,
    required this.actorName,
    required this.actorSub,
    this.actorImageUrl,
    this.actorIcon,
    this.actorIconColor,
    required this.event,
    required this.details,
    this.isSystem = false,
    this.isCritical = false,
    required this.isDesktop,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 32 : 16,
        vertical: 16,
      ),
      decoration: BoxDecoration(
        color: isCritical ? Colors.red.withOpacity(0.05) : Colors.transparent,
        border: Border(
          bottom: const BorderSide(color: Color(0xFF252E42)),
          left: isCritical
              ? const BorderSide(color: Colors.red, width: 2)
              : BorderSide.none,
        ),
      ),
      child: Row(
        children: [
          SizedBox(
            width: 100,
            child: Text(
              timestamp,
              style: const TextStyle(
                color: Color(0xFF8B949E),
                fontFamily: 'JetBrains Mono',
                fontSize: 12,
              ),
            ),
          ),
          SizedBox(width: isDesktop ? 32 : 16),
          Expanded(
            flex: 2,
            child: Row(
              children: [
                if (actorImageUrl != null)
                  CircleAvatar(
                    radius: 14,
                    backgroundImage: NetworkImage(actorImageUrl!),
                  )
                else
                  Container(
                    width: 28,
                    height: 28,
                    decoration: BoxDecoration(
                      color: (actorIconColor ?? AppTheme.primary).withOpacity(
                        0.1,
                      ),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        color: (actorIconColor ?? AppTheme.primary).withOpacity(
                          0.2,
                        ),
                      ),
                    ),
                    child: Icon(
                      actorIcon ?? LucideIcons.user,
                      size: 14,
                      color: actorIconColor ?? AppTheme.primary,
                    ),
                  ),
                if (isDesktop) const SizedBox(width: 12),
                if (isDesktop)
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          actorName,
                          style: TextStyle(
                            color: isSystem
                                ? (actorIconColor ?? Colors.purple)
                                : Colors.white,
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          actorSub,
                          style: const TextStyle(
                            color: Color(0xFF64748B),
                            fontSize: 10,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(width: isDesktop ? 32 : 16),
          Expanded(
            flex: 3,
            child: Text(
              event,
              style: TextStyle(
                color: isCritical ? Colors.red : Colors.white,
                fontSize: 13,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (isDesktop) ...[
            const SizedBox(width: 32),
            Expanded(
              flex: 4,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF0B0E14),
                  borderRadius: BorderRadius.circular(4),
                  border: Border.all(color: const Color(0xFF252E42)),
                ),
                child: Text(
                  details,
                  style: const TextStyle(
                    color: Color(0xFF8B949E),
                    fontFamily: 'JetBrains Mono',
                    fontSize: 11,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _Footer extends StatelessWidget {
  const _Footer();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 48),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(LucideIcons.lock, size: 16, color: Color(0xFF64748B)),
              SizedBox(width: 8),
              Text(
                'END OF ENCRYPTED RECORD',
                style: TextStyle(
                  color: Color(0xFF64748B),
                  fontSize: 10,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'Log Integrity Checksum: sha256:7f83b165...',
            style: TextStyle(
              color: Color(0xFF475569),
              fontFamily: 'JetBrains Mono',
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}

class _MobileNav extends StatelessWidget {
  const _MobileNav();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF1C2433),
        border: Border(top: BorderSide(color: Color(0xFF252E42))),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.primary,
        unselectedItemColor: const Color(0xFF94A3B8),
        currentIndex: 1,
        selectedFontSize: 10,
        unselectedFontSize: 10,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.layoutDashboard),
            label: 'Overview',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.listOrdered),
            label: 'Logs',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.bell),
            label: 'Alerts',
          ),
        ],
      ),
    );
  }
}
