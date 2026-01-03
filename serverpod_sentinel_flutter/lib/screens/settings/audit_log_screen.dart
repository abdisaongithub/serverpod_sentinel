import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';
import '../../widgets/app_sidebar.dart';

class AuditLogScreen extends StatefulWidget {
  const AuditLogScreen({super.key});

  @override
  State<AuditLogScreen> createState() => _AuditLogScreenState();
}

class _AuditLogScreenState extends State<AuditLogScreen> {
  String _selectedFilter = 'All Events';

  void _onFilterChanged(String filter) {
    setState(() {
      _selectedFilter = filter;
    });
  }

  @override
  Widget build(BuildContext context) {
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
              const _Header(),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      _FilterBar(
                        selectedFilter: _selectedFilter,
                        onFilterChanged: _onFilterChanged,
                      ),
                      _AuditTable(
                        isDesktop: isDesktop,
                        activeFilter: _selectedFilter,
                      ),
                      const _Footer(),
                      if (!isDesktop)
                        const SizedBox(height: 80), // Fab space on mobile
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
}

class _Header extends StatelessWidget {
  const _Header();

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
                    const Text(
                      'Track and monitor all system activities for compliance.',
                      style: TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
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
                      style: const TextStyle(color: Colors.white, fontSize: 13),
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
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFF0B0E14),
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: const Color(0xFF334155),
                              ),
                            ),
                            child: const Text(
                              '⌘K',
                              style: TextStyle(
                                color: Color(0xFF64748B),
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        border: InputBorder.none,
                        contentPadding: const EdgeInsets.symmetric(vertical: 8),
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

class _AuditTable extends StatelessWidget {
  final bool isDesktop;
  final String activeFilter;

  const _AuditTable({required this.isDesktop, required this.activeFilter});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Table Header
        Container(
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
        ),
        // Table Content
        const _DateSeparator(label: 'Today, Oct 27'),
        if (activeFilter == 'All Events' || activeFilter == 'User Actions')
          _AuditRow(
            timestamp: '14:03:22',
            actorName: 'Sarah Jenkins',
            actorSub: 'US-East-1',
            actorImageUrl: 'https://i.pravatar.cc/150?img=9',
            event: 'Service XYZ Deployed',
            details: 'commit: 8f32a9 | image: sha256:e3b0c442...',
            isDesktop: isDesktop,
          ),
        if (activeFilter == 'All Events' || activeFilter == 'Warnings')
          _AuditRow(
            timestamp: '13:45:10',
            actorName: 'System Bot',
            actorSub: 'Cluster-Alpha',
            actorIcon: LucideIcons.bot,
            actorIconColor: Colors.purple,
            event: 'Auto-scaling Triggered',
            details: 'SCALED_UP: nodes: 3 → 5',
            isSystem: true,
            isDesktop: isDesktop,
          ),
        if (activeFilter == 'All Events' || activeFilter == 'Critical Errors')
          _AuditRow(
            timestamp: '12:12:05',
            actorName: 'Unknown User',
            actorSub: 'Auth Service',
            actorIcon: LucideIcons.shieldAlert,
            actorIconColor: Colors.red,
            event: 'Unusual Login Attempt',
            details: 'IP: 192.168.1.XX | Status: BLOCKED',
            isCritical: true,
            isDesktop: isDesktop,
          ),
        const _DateSeparator(label: 'Yesterday, Oct 26'),
        if (activeFilter == 'All Events' || activeFilter == 'User Actions')
          _AuditRow(
            timestamp: '23:55:01',
            actorName: 'Mark Chen',
            actorSub: 'Infra-Net',
            actorImageUrl: 'https://i.pravatar.cc/150?img=11',
            event: 'Updated Load Balancer',
            details: 'modified: /etc/lb/config.yaml',
            isDesktop: isDesktop,
          ),
        if (activeFilter == 'All Events' || activeFilter == 'Warnings')
          _AuditRow(
            timestamp: '22:00:00',
            actorName: 'Auto-Backup',
            actorSub: 'Prod-DB-01',
            actorIcon: LucideIcons.database,
            actorIconColor: Colors.green,
            event: 'Database Backup',
            details: 'COMPLETE: size: 450GB',
            isSystem: true,
            isDesktop: isDesktop,
          ),
      ],
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
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
