import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';
import '../../widgets/app_sidebar.dart';

class TeamMembersScreen extends StatefulWidget {
  const TeamMembersScreen({super.key});

  @override
  State<TeamMembersScreen> createState() => _TeamMembersScreenState();
}

class _TeamMembersScreenState extends State<TeamMembersScreen> {
  bool _isSidebarOpen = false;
  String? _selectedRole;

  void _openSidebar(String role) {
    setState(() {
      _selectedRole = role;
      _isSidebarOpen = true;
    });
  }

  void _closeSidebar() {
    setState(() {
      _isSidebarOpen = false;
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
              ? const Drawer(
                  child: AppSidebar(activeRoute: AppRoutes.teamMembers),
                )
              : null,
          body: Stack(
            children: [
              Column(
                children: [
                  const _Header(),
                  Expanded(
                    child: SingleChildScrollView(
                      padding: const EdgeInsets.all(32),
                      child: ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 1400),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _RoleOverview(onRoleTap: _openSidebar),
                            const SizedBox(height: 32),
                            _UsersSection(
                              onUserTap: (name) => _openSidebar('Operator'),
                            ), // Placeholder role
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              // Sidebar Backdrop
              if (_isSidebarOpen)
                Positioned.fill(
                  child: GestureDetector(
                    onTap: _closeSidebar,
                    child: Container(color: Colors.black.withOpacity(0.4)),
                  ),
                ),
              // Role Details Sidebar
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
                right: _isSidebarOpen ? 0 : -640,
                top: 0,
                bottom: 0,
                width: isDesktop ? 640 : constraints.maxWidth,
                child: _RoleDetailsSidebar(
                  role: _selectedRole ?? 'Operator',
                  onClose: _closeSidebar,
                ),
              ),
            ],
          ),
          floatingActionButton: const _AuditLogButton(),
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
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
      decoration: const BoxDecoration(
        color: Color(0xFF161B22),
        border: Border(bottom: BorderSide(color: Color(0xFF30363D))),
      ),
      child: Row(
        children: [
          // Title & Status
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _BreadcrumbItem(
                      label: 'Settings',
                      route: AppRoutes.settings,
                    ),
                    _BreadcrumbItem(
                      label: 'Team & Permissions',
                      route: AppRoutes.teamMembers,
                      isLast: true,
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    const Text(
                      'Team Members',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.primary.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppTheme.primary.withOpacity(0.2),
                        ),
                      ),
                      child: const Text(
                        '42 Active',
                        style: TextStyle(
                          color: AppTheme.primary,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                const Text(
                  'Manage user access, roles, and platform permissions.',
                  style: TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
                ),
              ],
            ),
          ),

          // Search & Action
          Row(
            children: [
              Container(
                width: 320,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF0D1117),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: const Color(0xFF30363D)),
                ),
                child: const TextField(
                  style: TextStyle(color: Colors.white, fontSize: 14),
                  decoration: InputDecoration(
                    hintText: 'Search users by name, email or role...',
                    hintStyle: TextStyle(
                      color: Color(0xFF484F58),
                      fontSize: 13,
                    ),
                    prefixIcon: Icon(
                      LucideIcons.search,
                      size: 16,
                      color: Color(0xFF484F58),
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 10),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(LucideIcons.userPlus, size: 16),
                label: const Text('Add User'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  elevation: 0,
                  textStyle: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
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

class _RoleOverview extends StatelessWidget {
  final Function(String) onRoleTap;
  const _RoleOverview({required this.onRoleTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Role Overview',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Expanded(
              child: _RoleCard(
                title: 'Administrator',
                count: 4,
                tier: 'TIER 1',
                icon: LucideIcons.shieldCheck,
                gradient: const [Color(0xFF6366F1), Color(0xFF4F46E5)],
                description: 'Full system access & security config',
                onTap: () => onRoleTap('Administrator'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _RoleCard(
                title: 'Security Analyst',
                count: 12,
                tier: 'TIER 2',
                icon: LucideIcons.search,
                gradient: const [Color(0xFF3B82F6), Color(0xFF2563EB)],
                description: 'Incident response & rule management',
                onTap: () => onRoleTap('Operator'),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: _RoleCard(
                title: 'Standard User',
                count: 26,
                tier: 'TIER 3',
                icon: LucideIcons.users,
                gradient: const [Color(0xFF10B981), Color(0xFF059669)],
                description: 'Service monitoring & view access',
                onTap: () => onRoleTap('Viewer'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _RoleCard extends StatelessWidget {
  final String title;
  final int count;
  final String tier;
  final IconData icon;
  final List<Color> gradient;
  final String description;
  final VoidCallback onTap;

  const _RoleCard({
    required this.title,
    required this.count,
    required this.tier,
    required this.icon,
    required this.gradient,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(16),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: gradient,
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: gradient[1].withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(icon, color: Colors.white, size: 20),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    tier,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              '$count Users',
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 4),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              description,
              style: TextStyle(
                color: Colors.white.withOpacity(0.7),
                fontSize: 11,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _UsersSection extends StatelessWidget {
  final Function(String) onUserTap;
  const _UsersSection({required this.onUserTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF0D1117),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF30363D)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildTableToolbar(), _buildUserTable(), _buildPagination()],
      ),
    );
  }

  Widget _buildTableToolbar() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Text(
            'All Users',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
          _ToolbarButton(
            icon: LucideIcons.filter,
            label: 'Filter',
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          _ToolbarButton(
            icon: LucideIcons.download,
            label: 'Export',
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          _ToolbarButton(
            icon: LucideIcons.settings2,
            label: 'Table Settings',
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildUserTable() {
    return Column(
      children: [
        // Table Header
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: const BoxDecoration(
            color: Color(0xFF161B22),
            border: Border(bottom: BorderSide(color: Color(0xFF30363D))),
          ),
          child: Row(
            children: const [
              Expanded(
                flex: 3,
                child: Text(
                  'USER',
                  style: TextStyle(
                    color: Color(0xFF8B949E),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'ROLE',
                  style: TextStyle(
                    color: Color(0xFF8B949E),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  'PERMISSIONS',
                  style: TextStyle(
                    color: Color(0xFF8B949E),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  'STATUS',
                  style: TextStyle(
                    color: Color(0xFF8B949E),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(width: 40),
            ],
          ),
        ),
        // Table Rows
        _UserTableRow(
          name: 'Sarah Chen',
          email: 'sarah.c@antigravity.io',
          role: 'Administrator',
          roleColor: const Color(0xFF6366F1),
          permissions: ['All Access', 'Billing', 'Security'],
          status: 'Active',
          isOnline: true,
          initials: 'SC',
          onTap: () => onUserTap('Sarah Chen'),
        ),
        _UserTableRow(
          name: 'Marcus Wright',
          email: 'm.wright@antigravity.io',
          role: 'Security Analyst',
          roleColor: const Color(0xFF3B82F6),
          permissions: ['Incidents', 'Logs', 'Rules'],
          status: 'Active',
          isOnline: true,
          initials: 'MW',
          onTap: () => onUserTap('Marcus Wright'),
        ),
        _UserTableRow(
          name: 'Elena Rodriguez',
          email: 'elena.r@antigravity.io',
          role: 'Standard User',
          roleColor: const Color(0xFF10B981),
          permissions: ['Monitoring', 'View Only'],
          status: 'Inactive',
          isOnline: false,
          initials: 'ER',
          onTap: () => onUserTap('Elena Rodriguez'),
        ),
      ],
    );
  }

  Widget _buildPagination() {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          const Text(
            'Showing 1 to 10 of 42 users',
            style: TextStyle(color: Color(0xFF8B949E), fontSize: 13),
          ),
          const Spacer(),
          _PaginationButton(
            label: 'Previous',
            isDisabled: true,
            onPressed: () {},
          ),
          const SizedBox(width: 8),
          _PaginationButton(label: 'Next', isDisabled: false, onPressed: () {}),
        ],
      ),
    );
  }
}

class _UserTableRow extends StatelessWidget {
  final String name;
  final String email;
  final String role;
  final Color roleColor;
  final List<String> permissions;
  final String status;
  final bool isOnline;
  final String initials;
  final VoidCallback onTap;

  const _UserTableRow({
    required this.name,
    required this.email,
    required this.role,
    required this.roleColor,
    required this.permissions,
    required this.status,
    required this.isOnline,
    required this.initials,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: const BoxDecoration(
          border: Border(bottom: BorderSide(color: Color(0xFF30363D))),
        ),
        child: Row(
          children: [
            // User Info
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 16,
                        backgroundColor: roleColor.withOpacity(0.1),
                        child: Text(
                          initials,
                          style: TextStyle(
                            color: roleColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      if (isOnline)
                        Positioned(
                          right: 0,
                          bottom: 0,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: const Color(0xFF238636),
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF0D1117),
                                width: 1.5,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      Text(
                        email,
                        style: const TextStyle(
                          color: Color(0xFF8B949E),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Role
            Expanded(
              flex: 2,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: roleColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(color: roleColor.withOpacity(0.2)),
                ),
                child: Text(
                  role,
                  style: TextStyle(
                    color: roleColor,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            // Permissions
            Expanded(
              flex: 3,
              child: Wrap(
                spacing: 4,
                runSpacing: 4,
                children: permissions
                    .map((p) => _PermissionChip(label: p))
                    .toList(),
              ),
            ),
            // Status
            Expanded(
              flex: 2,
              child: Row(
                children: [
                  Container(
                    width: 6,
                    height: 6,
                    decoration: BoxDecoration(
                      color: status == 'Active'
                          ? const Color(0xFF238636)
                          : const Color(0xFF8B949E),
                      shape: BoxShape.circle,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    status,
                    style: TextStyle(
                      color: status == 'Active'
                          ? const Color(0xFF238636)
                          : const Color(0xFF8B949E),
                      fontSize: 13,
                    ),
                  ),
                ],
              ),
            ),
            // Actions
            SizedBox(
              width: 40,
              child: IconButton(
                icon: const Icon(
                  LucideIcons.moreHorizontal,
                  size: 18,
                  color: Color(0xFF8B949E),
                ),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PermissionChip extends StatelessWidget {
  final String label;

  const _PermissionChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: const Color(0xFF161B22),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFF30363D)),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Color(0xFFC9D1D9), fontSize: 10),
      ),
    );
  }
}

class _ToolbarButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onPressed;

  const _ToolbarButton({
    required this.icon,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 14),
      label: Text(label),
      style: OutlinedButton.styleFrom(
        foregroundColor: const Color(0xFFC9D1D9),
        side: const BorderSide(color: Color(0xFF30363D)),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
    );
  }
}

class _PaginationButton extends StatelessWidget {
  final String label;
  final bool isDisabled;
  final VoidCallback onPressed;

  const _PaginationButton({
    required this.label,
    this.isDisabled = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: isDisabled ? null : onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: isDisabled
            ? const Color(0xFF484F58)
            : const Color(0xFFC9D1D9),
        side: BorderSide(
          color: isDisabled ? const Color(0xFF21262D) : const Color(0xFF30363D),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        textStyle: const TextStyle(fontSize: 13, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      child: Text(label),
    );
  }
}

class _AuditLogButton extends StatelessWidget {
  const _AuditLogButton();

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton.extended(
      onPressed: () {},
      backgroundColor: const Color(0xFF161B22),
      foregroundColor: Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Color(0xFF30363D)),
      ),
      icon: const Icon(LucideIcons.history, size: 18),
      label: const Text(
        'Audit Log',
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
    );
  }
}

class _BreadcrumbItem extends StatelessWidget {
  final String label;
  final String route;
  final bool isLast;

  const _BreadcrumbItem({
    required this.label,
    required this.route,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: isLast ? null : () => context.go(route),
          child: Text(
            label,
            style: TextStyle(
              color: isLast ? Colors.white : const Color(0xFF8B949E),
              fontSize: 12,
              fontWeight: isLast ? FontWeight.w500 : FontWeight.normal,
            ),
          ),
        ),
        if (!isLast) ...[
          const SizedBox(width: 8),
          const Icon(
            LucideIcons.chevronRight,
            size: 12,
            color: Color(0xFF484F58),
          ),
          const SizedBox(width: 8),
        ],
      ],
    );
  }
}

class _RoleDetailsSidebar extends StatelessWidget {
  final String role;
  final VoidCallback onClose;

  const _RoleDetailsSidebar({required this.role, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF1A2230),
        border: Border(left: BorderSide(color: Color(0xFF30363D))),
      ),
      child: Column(
        children: [
          // Sidebar Header
          Container(
            padding: const EdgeInsets.all(32),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xFF30363D))),
            ),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: const Color(0xFF0D9488).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    LucideIcons.settings,
                    color: Color(0xFF0D9488),
                    size: 28,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        role.contains(' ') ? role : '$role Role',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xFF0D9488).withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: const Text(
                          'Tier 2 Access',
                          style: TextStyle(
                            color: Color(0xFF0D9488),
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: onClose,
                  icon: const Icon(LucideIcons.x, color: Color(0xFF94A3B8)),
                ),
              ],
            ),
          ),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'ROLE DESCRIPTION',
                    style: TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Operators have elevated permissions to manage daily operations, execute playbooks, and monitor system health. While they can interact with the system\'s operational layers, they cannot modify global system configurations or security policies.',
                    style: TextStyle(
                      color: Color(0xFFCBD5E1),
                      fontSize: 15,
                      height: 1.6,
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'GRANULAR PERMISSIONS',
                    style: TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                  const SizedBox(height: 16),
                  GridView.count(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 1.8,
                    children: const [
                      _PermissionCard(
                        title: 'Execute Playbooks',
                        subtitle:
                            'Can run pre-approved automation scripts and workflows.',
                        icon: LucideIcons.checkCircle,
                        iconColor: Color(0xFF10B981),
                      ),
                      _PermissionCard(
                        title: 'View Dashboards',
                        subtitle:
                            'Full visibility of all operational metrics and logs.',
                        icon: LucideIcons.checkCircle,
                        iconColor: Color(0xFF10B981),
                      ),
                      _PermissionCard(
                        title: 'Deployments',
                        subtitle:
                            'Can trigger standard deployment pipelines to staging.',
                        icon: LucideIcons.checkCircle,
                        iconColor: Color(0xFF10B981),
                      ),
                      _PermissionCard(
                        title: 'Edit Rules',
                        subtitle:
                            'Requires specific approval for any rule modifications.',
                        icon: LucideIcons.lock,
                        iconColor: Color(0xFFF59E0B),
                      ),
                      _PermissionCard(
                        title: 'User Management',
                        subtitle:
                            'Cannot invite, remove, or modify other team members.',
                        icon: LucideIcons.xCircle,
                        iconColor: Color(0xFF94A3B8),
                        opacity: 0.6,
                      ),
                    ],
                  ),
                  const SizedBox(height: 32),
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFF1E293B).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: const Color(0xFF334155)),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(
                          LucideIcons.info,
                          color: AppTheme.primary,
                          size: 24,
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text(
                                'Audit Trail Active',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                'All actions performed by this role are logged and retained for 90 days for compliance purposes. Any deployment triggers will require a secondary approval if outside maintenance windows.',
                                style: TextStyle(
                                  color: Color(0xFF94A3B8),
                                  fontSize: 13,
                                  height: 1.5,
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
            ),
          ),

          // Sidebar Footer
          Container(
            padding: const EdgeInsets.all(32),
            decoration: const BoxDecoration(
              border: Border(top: BorderSide(color: Color(0xFF30363D))),
            ),
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(LucideIcons.edit, size: 18),
              label: const Text('Edit Role Permissions'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: const Color(0xFF0F172A),
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                textStyle: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _PermissionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconColor;
  final double opacity;

  const _PermissionCard({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconColor,
    this.opacity = 1.0,
  });

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: opacity,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF0D1117),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: const Color(0xFF30363D)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: iconColor, size: 18),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              subtitle,
              style: const TextStyle(
                color: Color(0xFF8B949E),
                fontSize: 11,
                height: 1.4,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
