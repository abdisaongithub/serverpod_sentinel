import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';
import '../../widgets/app_sidebar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/playbooks_provider.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';

class PlaybooksScreen extends ConsumerStatefulWidget {
  const PlaybooksScreen({super.key});

  @override
  ConsumerState<PlaybooksScreen> createState() => _PlaybooksScreenState();
}

class _PlaybooksScreenState extends ConsumerState<PlaybooksScreen> {
  String _searchQuery = '';
  String _activeTab = 'All Playbooks';
  int _currentPage = 1;
  static const int _itemsPerPage = 10;

  @override
  Widget build(BuildContext context) {
    final playbooksAsync = ref.watch(playbooksProvider);

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
              _Header(
                isDesktop: isDesktop,
                onSearch: (query) => setState(() => _searchQuery = query),
              ),
              _FilterBar(
                isDesktop: isDesktop,
                activeTab: _activeTab,
                onTabChanged: (tab) => setState(() {
                  _activeTab = tab;
                  _currentPage = 1;
                }),
              ),
              Expanded(
                child: playbooksAsync.when(
                  loading: () =>
                      const Center(child: CircularProgressIndicator()),
                  error: (err, stack) => Center(child: Text('Error: $err')),
                  data: (allPlaybooks) {
                    // 1. Filter by Tab
                    var filtered = allPlaybooks;
                    if (_activeTab == 'Active') {
                      // Assuming 'Active' logic, but Playbook model doesn't have an 'isActive' field explicitly shown in UI
                      // Using a mock filter if field is missing, or just pass through for now
                      // Based on UI, we have a status, but no simple bool. Let's assume all are active for demo or filter by some logic
                    } else if (_activeTab == 'Drafts') {
                      // filtered = filtered.where((p) => p.isDraft).toList();
                    }

                    // 2. Filter by Search
                    if (_searchQuery.isNotEmpty) {
                      final query = _searchQuery.toLowerCase();
                      filtered = filtered.where((p) {
                        return p.name.toLowerCase().contains(query) ||
                            (p.description?.toLowerCase().contains(query) ??
                                false);
                      }).toList();
                    }

                    // 3. Pagination
                    final totalItems = filtered.length;
                    final totalPages = (totalItems / _itemsPerPage).ceil();
                    final start = (_currentPage - 1) * _itemsPerPage;
                    final end = (start + _itemsPerPage < totalItems)
                        ? start + _itemsPerPage
                        : totalItems;

                    final pagedPlaybooks = filtered.sublist(
                      start < totalItems ? start : 0,
                      end < totalItems ? end : totalItems,
                    );

                    return SingleChildScrollView(
                      padding: EdgeInsets.all(isDesktop ? 32 : 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          isDesktop
                              ? _PlaybookTable(playbooks: pagedPlaybooks)
                              : SingleChildScrollView(
                                  scrollDirection: Axis.horizontal,
                                  child: ConstrainedBox(
                                    constraints: const BoxConstraints(
                                      minWidth: 900,
                                    ),
                                    child: _PlaybookTable(
                                      playbooks: pagedPlaybooks,
                                    ),
                                  ),
                                ),
                          const SizedBox(height: 24),
                          if (totalItems > 0)
                            _Pagination(
                              currentPage: _currentPage,
                              totalPages: totalPages,
                              totalItems: totalItems,
                              startIndex: start + 1,
                              endIndex: end,
                              onPageChanged: (page) =>
                                  setState(() => _currentPage = page),
                            ),
                        ],
                      ),
                    );
                  },
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
  final Function(String) onSearch;

  const _Header({required this.isDesktop, required this.onSearch});

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
              child: TextField(
                onChanged: onSearch,
                style: const TextStyle(color: Colors.white, fontSize: 13),
                decoration: const InputDecoration(
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
  final String activeTab;
  final Function(String) onTabChanged;

  const _FilterBar({
    required this.isDesktop,
    required this.activeTab,
    required this.onTabChanged,
  });

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
          _navTab('All Playbooks', activeTab == 'All Playbooks', onTabChanged),
          _navTab('Active', activeTab == 'Active', onTabChanged),
          _navTab('Drafts', activeTab == 'Drafts', onTabChanged),
          _navTab('Archived', activeTab == 'Archived', onTabChanged),
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

  Widget _navTab(String label, bool isActive, Function(String) onTap) {
    return GestureDetector(
      onTap: () => onTap(label),
      child: Container(
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
  final List<Playbook> playbooks;
  const _PlaybookTable({required this.playbooks});

  @override
  Widget build(BuildContext context) {
    // We already have the filtered list passed in

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
          // Rows
          if (playbooks.isEmpty)
            const Padding(
              padding: EdgeInsets.all(24),
              child: Center(
                child: Text(
                  'No playbooks found.',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            )
          else
            Column(
              children: playbooks
                  .map((playbook) => _PlaybookRow(playbook: playbook))
                  .toList(),
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
  final Playbook playbook;

  const _PlaybookRow({required this.playbook});

  @override
  State<_PlaybookRow> createState() => _PlaybookRowState();
}

class _PlaybookRowState extends State<_PlaybookRow> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          context.go('${AppRoutes.playbookExecution}?id=${widget.playbook.id}'),
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
            opacity: 1.0,
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
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Icon(
                          widget.playbook.type == PlaybookType.AUTOMATED
                              ? LucideIcons.zap
                              : LucideIcons.play,
                          color: widget.playbook.type == PlaybookType.AUTOMATED
                              ? Colors.amber
                              : Colors.blue,
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
                                  widget.playbook.name,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                _statusBadge('Active'),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Row(
                              children: [
                                Text(
                                  '#PB-${widget.playbook.id}',
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
                                Text(
                                  'v1.0.0', // mock version
                                  style: const TextStyle(
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
                          widget.playbook.type == PlaybookType.AUTOMATED
                              ? 'Event Based'
                              : 'Manual',
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
                          widget.playbook.description ?? 'Execute Playbook',
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
                        widget.playbook.type == PlaybookType.AUTOMATED
                            ? LucideIcons.bot
                            : LucideIcons.hand,
                        size: 16,
                        color: widget.playbook.type == PlaybookType.AUTOMATED
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
                          color: widget.playbook.type == PlaybookType.AUTOMATED
                              ? AppTheme.primary.withOpacity(0.1)
                              : const Color(0xFF1E293B),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          widget.playbook.type.name,
                          style: TextStyle(
                            color:
                                widget.playbook.type == PlaybookType.AUTOMATED
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
                        'Never', // mock last run
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        'No runs yet',
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
  final int currentPage;
  final int totalPages;
  final int totalItems;
  final int startIndex;
  final int endIndex;
  final Function(int) onPageChanged;

  const _Pagination({
    required this.currentPage,
    required this.totalPages,
    required this.totalItems,
    required this.startIndex,
    required this.endIndex,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          RichText(
            text: TextSpan(
              style: const TextStyle(color: Color(0xFF64748B), fontSize: 13),
              children: [
                const TextSpan(text: 'Showing '),
                TextSpan(
                  text: '$startIndex',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: ' to '),
                TextSpan(
                  text: '$endIndex',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: ' of '),
                TextSpan(
                  text: '$totalItems',
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: ' playbooks'),
              ],
            ),
          ),
          Row(
            children: [
              _pageButton(
                LucideIcons.chevronLeft,
                currentPage > 1,
                () => onPageChanged(currentPage - 1),
              ),
              const SizedBox(width: 8),
              _pageButton(
                LucideIcons.chevronRight,
                currentPage < totalPages,
                () => onPageChanged(currentPage + 1),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _pageButton(IconData icon, bool isEnabled, VoidCallback onTap) {
    return GestureDetector(
      onTap: isEnabled ? onTap : null,
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFF161E2D),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isEnabled
                ? const Color(0xFF2D3748)
                : const Color(0xFF2D3748).withOpacity(0.5),
          ),
        ),
        child: Icon(
          icon,
          size: 18,
          color: isEnabled ? Colors.white : const Color(0xFF475569),
        ),
      ),
    );
  }
}
