import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import 'role_details_sheet.dart';

class TeamMembersScreen extends StatelessWidget {
  const TeamMembersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Team Members', style: TextStyle(fontWeight: FontWeight.bold)),
            Text(
              '42 Active Users',
              style: TextStyle(fontSize: 12, color: AppTheme.textMuted),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            decoration: const BoxDecoration(
              color: AppTheme.primary,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(LucideIcons.plus, color: Colors.white),
            ),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1000),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search by name or email...',
                    prefixIcon: const Icon(
                      LucideIcons.search,
                      color: AppTheme.textMuted,
                    ),
                    filled: true,
                    fillColor: AppTheme.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Role Overview',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text('Manage Roles'),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      _buildRoleCard(
                        '3 Admins',
                        'Full system access & logs',
                        'TIER 1',
                        AppTheme.primary,
                        LucideIcons.shieldAlert,
                      ),
                      const SizedBox(width: 12),
                      _buildRoleCard(
                        '12 Operators',
                        'Can trigger pipelines',
                        '',
                        const Color(0xFF10b981), // Emerald
                        LucideIcons.settings,
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),
                const Text(
                  'All Users',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),

                _buildUserCard(
                  context,
                  image: 'https://i.pravatar.cc/150?img=9',
                  name: 'Sarah Jenkins',
                  email: 'sarah.j@devops.co',
                  badges: [
                    _buildBadge('Admin', AppTheme.primary),
                    const SizedBox(width: 8),
                    _buildBadge(
                      'Approver',
                      const Color(0xFF334155),
                      textColor: const Color(0xFF94a3b8),
                      icon: LucideIcons.hammer,
                    ),
                    const SizedBox(width: 8),
                    _buildBadge(
                      'Root',
                      const Color(0xFF451a03),
                      textColor: Colors.orange,
                      icon: LucideIcons.key,
                    ),
                  ],
                  isOnline: true,
                ),
                const SizedBox(height: 12),
                _buildUserCard(
                  context,
                  image: 'https://i.pravatar.cc/150?img=11',
                  name: 'Michael Chen',
                  email: 'm.chen@devops.co',
                  badges: [
                    _buildBadge('Operator', const Color(0xFF10b981)),
                    const SizedBox(width: 8),
                    _buildBadge(
                      'Deployer',
                      const Color(0xFF334155),
                      textColor: const Color(0xFF94a3b8),
                      icon: LucideIcons.rocket,
                    ),
                  ],
                  isOnline: true,
                ),
                const SizedBox(height: 12),
                _buildUserCard(
                  context,
                  initials: 'AL',
                  color: Colors.purple,
                  name: 'Alex Liu',
                  email: 'alex.liu@devops.co',
                  badges: [
                    _buildBadge('Operator', const Color(0xFF10b981)),
                    const SizedBox(width: 8),
                    _buildBadge(
                      'Shell Access',
                      const Color(0xFF334155),
                      textColor: const Color(0xFF94a3b8),
                      icon: LucideIcons.terminal,
                    ),
                  ],
                  isOnline: false,
                ),

                const SizedBox(height: 12),
                _buildUserCard(
                  context,
                  image: 'https://i.pravatar.cc/150?img=5',
                  name: 'Emma Wilson',
                  email: 'e.wilson@devops.co',
                  badges: [
                    _buildBadge(
                      'Viewer',
                      const Color(0xFF334155),
                      textColor: const Color(0xFF94a3b8),
                    ),
                  ],
                  isOnline: false,
                ),
                const SizedBox(height: 12),
                _buildUserCard(
                  context,
                  initials: 'JD',
                  color: Colors.grey,
                  name: 'John Doe',
                  email: 'j.doe@devops.co',
                  badges: [
                    _buildBadge(
                      'Viewer',
                      const Color(0xFF334155),
                      textColor: const Color(0xFF94a3b8),
                    ),
                  ],
                  isOnline: false,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildRoleCard(
    String title,
    String subtitle,
    String tier,
    Color color,
    IconData icon,
  ) {
    return Container(
      width: 200,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
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
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(icon, color: Colors.white, size: 16),
              ),
              if (tier.isNotEmpty)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    tier,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            subtitle,
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUserCard(
    BuildContext context, {
    String? image,
    String? initials,
    Color? color,
    required String name,
    required String email,
    required List<Widget> badges,
    required bool isOnline,
  }) {
    return GestureDetector(
      onTap: () {
        // Show role details sheet just as a demo interaction
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          backgroundColor: Colors.transparent,
          builder: (context) => const RoleDetailsSheet(),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: AppTheme.surfaceHighlight),
        ),
        child: Row(
          children: [
            Stack(
              children: [
                if (image != null)
                  CircleAvatar(radius: 24, backgroundImage: NetworkImage(image))
                else
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: color?.withOpacity(0.2),
                    child: Text(
                      initials!,
                      style: TextStyle(
                        color: color,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      color: isOnline ? AppTheme.success : AppTheme.textMuted,
                      border: Border.all(color: AppTheme.surface, width: 2),
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    email,
                    style: const TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(children: badges),
                ],
              ),
            ),
            const Icon(LucideIcons.moreVertical, color: AppTheme.textMuted),
          ],
        ),
      ),
    );
  }

  Widget _buildBadge(
    String label,
    Color color, {
    Color textColor = Colors.white,
    IconData? icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, size: 10, color: textColor),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: TextStyle(
              color: textColor,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
