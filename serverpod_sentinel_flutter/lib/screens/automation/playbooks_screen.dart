import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';
import '../../widgets/app_sidebar.dart';

class PlaybooksScreen extends StatelessWidget {
  const PlaybooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;

        return Scaffold(
          backgroundColor: const Color(0xFF0F172A),
          drawer: !isDesktop
              ? const Drawer(
                  child: AppSidebar(activeRoute: AppRoutes.playbooks),
                )
              : null,
          body: Column(
            children: [
              _Header(isDesktop: isDesktop),
              _FilterBar(isDesktop: isDesktop),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(isDesktop ? 32 : 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      isDesktop
                          ? const _PlaybookTable()
                          : SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: ConstrainedBox(
                                constraints: const BoxConstraints(
                                  minWidth: 900,
                                ),
                                child: const _PlaybookTable(),
                              ),
                            ),
                      const SizedBox(height: 24),
                      const _Pagination(),
                    ],
                  ),
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
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 32 : 16),
      decoration: const BoxDecoration(
        color: Color(0xFF161E2D),
        border: Border(bottom: BorderSide(color: Color(0xFF2D3748))),
      ),
      child: Row(
        children: [
          if (!isDesktop) ...[
            IconButton(
              icon: const Icon(LucideIcons.menu, color: Colors.white),
              onPressed: () => Scaffold.of(context).openDrawer(),
            ),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: isDesktop
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            'Automation',
                            style: TextStyle(
                              color: AppTheme.textMuted,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(width: 4),
                          const Icon(
                            LucideIcons.chevronRight,
                            size: 12,
                            color: Color(0xFF94A3B8),
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            'Playbooks',
                            style: TextStyle(
                              color: Color(0xFF94A3B8),
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      const Text(
                        'Playbook Management',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                : const Text(
                    'Playbooks',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
          ),
          if (isDesktop) ...[
            Container(
              width: 320,
              height: 40,
              decoration: BoxDecoration(
                color: const Color(0xFF0F172A).withOpacity(0.5),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF334155)),
              ),
              child: const TextField(
                style: TextStyle(color: Colors.white, fontSize: 13),
                decoration: InputDecoration(
                  hintText: 'Search playbooks...',
                  hintStyle: TextStyle(color: Color(0xFF64748B), fontSize: 13),
                  prefixIcon: Icon(
                    LucideIcons.search,
                    size: 16,
                    color: Color(0xFF64748B),
                  ),
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(vertical: 10),
                ),
              ),
            ),
            const SizedBox(width: 24),
          ],
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(LucideIcons.plus, size: 18),
            label: const Text('New Playbook'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
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
    return Container(
      height: 64,
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 32 : 16),
      decoration: const BoxDecoration(
        color: Color(0xFF0F172A),
        border: Border(bottom: BorderSide(color: Color(0xFF2D3748))),
      ),
      child: Row(
        children: [
          _navTab('All Playbooks', true),
          _navTab('Active', false),
          _navTab('Drafts', false),
          _navTab('Archived', false),
          const Spacer(),
          if (isDesktop) ...[
            Text(
              'Sort by:',
              style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
            ),
            const SizedBox(width: 8),
            const _SortDropdown(),
            const SizedBox(width: 16),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF161E2D),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFF2D3748)),
              ),
              padding: const EdgeInsets.all(4),
              child: Row(
                children: [
                  _iconButton(LucideIcons.list, true),
                  _iconButton(LucideIcons.layoutGrid, false),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _navTab(String label, bool isActive) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.white : Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isActive ? Colors.white : const Color(0xFF334155),
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isActive ? const Color(0xFF0F172A) : AppTheme.textMuted,
          fontSize: 13,
          fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
        ),
      ),
    );
  }

  Widget _iconButton(IconData icon, bool isActive) {
    return Container(
      padding: const EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF334155) : Colors.transparent,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Icon(
        icon,
        size: 18,
        color: isActive ? AppTheme.primary : const Color(0xFF94A3B8),
      ),
    );
  }
}

class _SortDropdown extends StatelessWidget {
  const _SortDropdown();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Last Modified',
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 4),
        Icon(LucideIcons.chevronDown, size: 14, color: AppTheme.textMuted),
      ],
    );
  }
}

class _PlaybookTable extends StatelessWidget {
  const _PlaybookTable();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF161E2D),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2D3748)),
      ),
      child: Column(
        children: [
          // Header
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            decoration: const BoxDecoration(
              color: Color(0xFF1E293B),
              borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              border: Border(bottom: BorderSide(color: Color(0xFF2D3748))),
            ),
            child: Row(
              children: [
                Expanded(flex: 3, child: _columnHeader('PLAYBOOK NAME')),
                Expanded(flex: 2, child: _columnHeader('TRIGGER')),
                Expanded(flex: 2, child: _columnHeader('ACTION')),
                Expanded(child: _columnHeader('MODE')),
                Expanded(child: _columnHeader('LAST RUN')),
                const SizedBox(width: 48), // Actions column
              ],
            ),
          ),
          // Rows
          const _PlaybookRow(
            id: '#P-1024',
            name: 'Scale DB Read Replicas',
            status: 'Active',
            trigger: 'High Latency (>500ms)',
            action: 'Scale AWS RDS',
            mode: 'Automatic',
            lastRun: '2h ago',
            lastRunStatus: 'Success',
            icon: LucideIcons.database,
            iconColor: Colors.blue,
          ),
          const _PlaybookRow(
            id: '#P-1025',
            name: 'Emergency Cache Flush',
            status: 'Draft',
            trigger: 'Manual Invocation',
            action: 'Flush Redis Cluster',
            mode: 'Manual',
            lastRun: 'Never',
            lastRunStatus: 'Edited 10m ago',
            icon: LucideIcons.zap,
            iconColor: Colors.amber,
          ),
          const _PlaybookRow(
            id: '#P-1088',
            name: 'IP Rate Limiting',
            status: 'Active',
            trigger: 'DDoS Pattern Detected',
            action: 'Block Subnet WAF',
            mode: 'Automatic',
            lastRun: '1d ago',
            lastRunStatus: 'Success',
            icon: LucideIcons.shieldAlert,
            iconColor: Colors.purple,
          ),
          const _PlaybookRow(
            id: '#P-0042',
            name: 'Legacy DB Backup',
            status: 'Deprecated',
            trigger: 'Daily Backup Task',
            action: 'S3 Sync Archive',
            mode: 'Archived',
            lastRun: '30d ago',
            lastRunStatus: 'Success',
            icon: LucideIcons.archive,
            iconColor: const Color(0xFF64748B),
            isDeprecated: true,
          ),
        ],
      ),
    );
  }

  Widget _columnHeader(String label) {
    return Text(
      label,
      style: const TextStyle(
        color: Color(0xFF64748B),
        fontSize: 11,
        fontWeight: FontWeight.bold,
        letterSpacing: 0.5,
      ),
    );
  }
}

class _PlaybookRow extends StatefulWidget {
  final String id;
  final String name;
  final String status;
  final String trigger;
  final String action;
  final String mode;
  final String lastRun;
  final String lastRunStatus;
  final IconData icon;
  final Color iconColor;
  final bool isDeprecated;

  const _PlaybookRow({
    required this.id,
    required this.name,
    required this.status,
    required this.trigger,
    required this.action,
    required this.mode,
    required this.lastRun,
    required this.lastRunStatus,
    required this.icon,
    required this.iconColor,
    this.isDeprecated = false,
  });

  @override
  State<_PlaybookRow> createState() => _PlaybookRowState();
}

class _PlaybookRowState extends State<_PlaybookRow> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go(AppRoutes.playbookExecution),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => isHovered = true),
        onExit: (_) => setState(() => isHovered = false),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          decoration: BoxDecoration(
            color: isHovered ? const Color(0xFF1E293B).withOpacity(0.5) : null,
            border: const Border(bottom: BorderSide(color: Color(0xFF2D3748))),
          ),
          child: Opacity(
            opacity: widget.isDeprecated ? 0.6 : 1.0,
            child: Row(
              children: [
                // Playbook Name
                Expanded(
                  flex: 3,
                  child: Row(
                    children: [
                      Container(
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                          color: widget.iconColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          widget.icon,
                          color: widget.iconColor,
                          size: 20,
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                _statusBadge(widget.status),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  widget.id,
                                  style: const TextStyle(
                                    fontFamily: 'monospace',
                                    color: Color(0xFF64748B),
                                    fontSize: 12,
                                  ),
                                ),
                                const SizedBox(width: 4),
                                const Text(
                                  '•',
                                  style: TextStyle(color: Color(0xFF475569)),
                                ),
                                const SizedBox(width: 4),
                                const Text(
                                  'v2.4.1',
                                  style: TextStyle(
                                    color: Color(0xFF64748B),
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // Trigger
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      const Icon(
                        LucideIcons.zap,
                        size: 16,
                        color: Colors.orange,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          widget.trigger,
                          style: const TextStyle(
                            color: Color(0xFFCBD5E1),
                            fontSize: 13,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                // Action
                Expanded(
                  flex: 2,
                  child: Row(
                    children: [
                      const Icon(
                        LucideIcons.terminal,
                        size: 16,
                        color: Colors.blue,
                      ),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          widget.action,
                          style: const TextStyle(
                            color: Color(0xFFCBD5E1),
                            fontSize: 13,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
                // Mode
                Expanded(
                  child: Row(
                    children: [
                      Icon(
                        widget.mode == 'Automatic'
                            ? LucideIcons.bot
                            : LucideIcons.hand,
                        size: 16,
                        color: widget.mode == 'Automatic'
                            ? AppTheme.primary
                            : const Color(0xFF94A3B8),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: widget.mode == 'Automatic'
                              ? AppTheme.primary.withOpacity(0.1)
                              : const Color(0xFF1E293B),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          widget.mode,
                          style: TextStyle(
                            color: widget.mode == 'Automatic'
                                ? AppTheme.primary
                                : const Color(0xFFCBD5E1),
                            fontSize: 11,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                // Last Run
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.lastRun,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        widget.lastRunStatus,
                        style: const TextStyle(
                          color: Color(0xFF64748B),
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                // Actions
                SizedBox(
                  width: 48,
                  child: AnimatedOpacity(
                    opacity: isHovered ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 100),
                    child: const Icon(
                      LucideIcons.moreVertical,
                      color: Color(0xFF64748B),
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _statusBadge(String status) {
    Color color;
    switch (status) {
      case 'Active':
        color = AppTheme.success;
        break;
      case 'Draft':
        color = Colors.amber;
        break;
      case 'Deprecated':
        color = const Color(0xFF64748B);
        break;
      default:
        color = Colors.blue;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withOpacity(0.3)),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(
          color: color,
          fontSize: 9,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.5,
        ),
      ),
    );
  }
}

class _Pagination extends StatelessWidget {
  const _Pagination();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: const TextSpan(
              style: TextStyle(color: Color(0xFF64748B), fontSize: 13),
              children: [
                TextSpan(text: 'Showing '),
                TextSpan(
                  text: '1',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: ' to '),
                TextSpan(
                  text: '4',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: ' of '),
                TextSpan(
                  text: '24',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextSpan(text: ' playbooks'),
              ],
            ),
          ),
          Row(
            children: [
              _pageButton(LucideIcons.chevronLeft, false),
              const SizedBox(width: 8),
              _pageButton(LucideIcons.chevronRight, true),
            ],
          ),
        ],
      ),
    );
  }

  Widget _pageButton(IconData icon, bool isEnabled) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xFF161E2D),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF2D3748)),
      ),
      child: Icon(
        icon,
        size: 18,
        color: isEnabled ? Colors.white : const Color(0xFF475569),
      ),
    );
  }
}
