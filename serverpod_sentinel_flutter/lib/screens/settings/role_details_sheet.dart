import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';

class RoleDetailsSheet extends StatelessWidget {
  const RoleDetailsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 600),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.85,
          decoration: const BoxDecoration(
            color: AppTheme.background,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          child: Column(
            children: [
              const SizedBox(height: 12),
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: AppTheme.surfaceHighlight,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: const Color(0xFF10b981).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: const Icon(
                            LucideIcons.settings,
                            color: Color(0xFF10b981),
                          ),
                        ),
                        const SizedBox(width: 16),
                        const Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Operator Role',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Tier 2 Access Level',
                              style: TextStyle(color: AppTheme.textMuted),
                            ),
                          ],
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(LucideIcons.x),
                    ),
                  ],
                ),
              ),

              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(24),
                  children: [
                    const Text(
                      'Operators have elevated permissions to manage daily operations, execute playbooks, and monitor system health. They cannot modify global system configurations.',
                      style: TextStyle(color: AppTheme.textMuted, height: 1.5),
                    ),

                    const SizedBox(height: 24),
                    const Text(
                      'GRANULAR PERMISSIONS',
                      style: TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 16),

                    _buildPermissionItem(
                      'Execute Playbooks',
                      'Can run pre-approved automation scripts.',
                      true,
                    ),
                    const SizedBox(height: 12),
                    _buildPermissionItem(
                      'View Dashboards',
                      'Full visibility of operational metrics.',
                      true,
                    ),
                    const SizedBox(height: 12),
                    _buildPermissionItem(
                      'Deployments',
                      'Can trigger standard deployment pipelines.',
                      true,
                    ),
                    const SizedBox(height: 12),
                    _buildPermissionItem(
                      'Edit Rules',
                      'Requires approval for rule modifications.',
                      true,
                      icon: LucideIcons.lock,
                      iconColor: Colors.orange,
                    ),
                    const SizedBox(height: 12),
                    _buildPermissionItem(
                      'User Management',
                      'Cannot add or remove team members.',
                      false,
                      icon: LucideIcons.xCircle,
                      iconColor: AppTheme.textMuted,
                    ),
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(24),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(LucideIcons.edit2, size: 16),
                  label: const Text('Edit Role Permissions'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.black,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPermissionItem(
    String title,
    String desc,
    bool hasAccess, {
    IconData icon = LucideIcons.checkCircle,
    Color iconColor = const Color(0xFF10b981),
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceHighlight),
      ),
      child: Row(
        children: [
          Icon(icon, color: iconColor, size: 20),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  desc,
                  style: const TextStyle(
                    color: AppTheme.textMuted,
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
