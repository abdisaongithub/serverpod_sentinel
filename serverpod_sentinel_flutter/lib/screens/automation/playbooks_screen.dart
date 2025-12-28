import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import 'playbook_execution_screen.dart';

class PlaybooksScreen extends StatelessWidget {
  const PlaybooksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Playbooks',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            Text(
              'DevOps Automation',
              style: TextStyle(fontSize: 12, color: AppTheme.textMuted),
            ),
          ],
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(LucideIcons.plus),
            style: IconButton.styleFrom(
              backgroundColor: AppTheme.primary,
              foregroundColor: Colors.white,
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search playbooks by name, ID, or trigger...',
                prefixIcon: const Icon(
                  LucideIcons.search,
                  color: AppTheme.textMuted,
                ),
                fillColor: AppTheme.surface,
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                _buildFilterChip('All', true),
                const SizedBox(width: 8),
                _buildFilterChip('Active', false),
                const SizedBox(width: 8),
                _buildFilterChip('Drafts', false),
                const SizedBox(width: 8),
                _buildFilterChip('Mode: Auto', false),
                const SizedBox(width: 8),
                _buildFilterChip('Mode: Manual', false),
              ],
            ),
          ),
          const SizedBox(height: 24),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'PRODUCTION',
                  style: TextStyle(
                    color: AppTheme.textMuted,
                    letterSpacing: 1.2,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Text(
                  '3 Active',
                  style: TextStyle(
                    color: AppTheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildPlaybookCard(
                  context,
                  title: 'Scale DB Read Replicas',
                  id: '#P-1024',
                  version: 'v2.4.1',
                  status: 'Active',
                  trigger: 'High Latency (>500ms)',
                  action: 'Scale AWS RDS Instance',
                  lastRun: '2h ago',
                  mode: 'Automatic Mode',
                  modeColor: AppTheme.primary,
                  triggerIcon: LucideIcons.zap,
                  actionIcon: LucideIcons.database,
                ),
                const SizedBox(height: 16),
                _buildPlaybookCard(
                  context,
                  title: 'Emergency Cache Flush',
                  id: '#P-1025',
                  version: 'v0.1.0',
                  status: 'Draft',
                  statusColor: Colors.orange,
                  trigger: 'Manual Invocation',
                  action: 'Flush Redis Cluster',
                  lastRun: 'Edited: 10m ago',
                  mode: 'Manual Approval',
                  modeColor: AppTheme.textMuted,
                  triggerIcon: LucideIcons.mousePointer,
                  actionIcon: LucideIcons.trash2,
                ),
                const SizedBox(height: 16),
                _buildPlaybookCard(
                  context,
                  title: 'IP Rate Limiting',
                  id: '#P-1088',
                  version: 'v1.2.0',
                  status: 'Active',
                  trigger: 'DDoS Pattern Detected',
                  action: 'Block Subnet via WAF',
                  lastRun: '1d ago',
                  mode: 'Automatic Mode',
                  modeColor: AppTheme.primary,
                  triggerIcon: LucideIcons.shieldAlert,
                  actionIcon: LucideIcons.ban,
                ),
                const SizedBox(height: 32),
                const Text(
                  'ARCHIVE',
                  style: TextStyle(
                    color: AppTheme.textMuted,
                    letterSpacing: 1.2,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.surface.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Legacy DB Backup',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: AppTheme.textMuted,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.surfaceHighlight,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Text(
                              'Deprecated',
                              style: TextStyle(
                                fontSize: 10,
                                color: AppTheme.textMuted,
                              ),
                            ),
                          ),
                          const Icon(
                            LucideIcons.moreVertical,
                            color: AppTheme.textMuted,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      const Text(
                        '#P-0042 • v1.0.0',
                        style: TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 12,
                        ),
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'Replaced by #P-1024. This playbook is read-only.',
                        style: TextStyle(color: AppTheme.textMuted),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppTheme.background,
        selectedItemColor: AppTheme.primary,
        unselectedItemColor: AppTheme.textMuted,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0, // Mocked
        onTap: (index) {},
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.book),
            label: 'Playbooks',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.activity),
            label: 'Activity',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, bool isSelected) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? AppTheme.primary : AppTheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? AppTheme.primary : AppTheme.surfaceHighlight,
        ),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isSelected ? Colors.white : AppTheme.textMuted,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
    );
  }

  Widget _buildPlaybookCard(
    BuildContext context, {
    required String title,
    required String id,
    required String version,
    required String status,
    required String trigger,
    required String action,
    required String lastRun,
    required String mode,
    required Color modeColor,
    required IconData triggerIcon,
    required IconData actionIcon,
    Color statusColor = AppTheme.success,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const PlaybookExecutionScreen()),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.surfaceHighlight),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: statusColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: statusColor.withOpacity(0.5)),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          color: statusColor,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      LucideIcons.moreVertical,
                      size: 16,
                      color: AppTheme.textMuted,
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              '$id • $version',
              style: const TextStyle(color: AppTheme.textMuted, fontSize: 12),
            ),
            const SizedBox(height: 16),

            // Trigger
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.background,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.orange.withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(triggerIcon, size: 14, color: Colors.orange),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'TRIGGER',
                        style: TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        trigger,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8),
            // Action
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppTheme.background,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: const Color(0xFF3b82f6).withOpacity(0.1),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      actionIcon,
                      size: 14,
                      color: const Color(0xFF3b82f6),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'ACTION',
                        style: TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        action,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      mode == 'Automatic Mode'
                          ? LucideIcons.bot
                          : LucideIcons.hand,
                      size: 16,
                      color: modeColor,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      mode,
                      style: TextStyle(
                        color: modeColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  'Last run: $lastRun',
                  style: const TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
