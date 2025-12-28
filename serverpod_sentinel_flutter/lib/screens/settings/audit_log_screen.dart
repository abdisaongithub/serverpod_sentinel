import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';

class AuditLogScreen extends StatelessWidget {
  const AuditLogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text('Audit Log', style: TextStyle(fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  LucideIcons.shieldCheck,
                  size: 12,
                  color: AppTheme.success,
                ),
                SizedBox(width: 4),
                Text(
                  'Immutable Record',
                  style: TextStyle(fontSize: 12, color: AppTheme.success),
                ),
              ],
            ),
          ],
        ),
        centerTitle: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(LucideIcons.download)),
          Container(
            margin: const EdgeInsets.only(right: 16),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(LucideIcons.filter),
              style: IconButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Search by ID, User, or Event...',
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
          ),

          // Filters
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Expanded(
                  child: _buildDropdown('Last 24h', LucideIcons.calendar),
                ),
                const SizedBox(width: 8),
                Expanded(child: _buildDropdown('Who: All', LucideIcons.user)),
                const SizedBox(width: 8),
                Expanded(child: _buildDropdown('What: All', LucideIcons.box)),
              ],
            ),
          ),

          const SizedBox(height: 24),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Text(
                  'TODAY, OCT 27',
                  style: TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
                Expanded(
                  child: Divider(indent: 12, color: AppTheme.surfaceHighlight),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Timeline List
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildTimelineItem(
                  userImage: 'https://i.pravatar.cc/150?img=9',
                  userName: 'Sarah Jenkins',
                  action: 'Service XYZ Deployed',
                  target: 'US-East-1',
                  time: '14:03:22 UTC',
                  details: _buildCodeBlock(
                    'commit: 8f32a9 | image: sha256:e3b0c442...',
                  ),
                ),
                _buildTimelineItem(
                  userIcon: LucideIcons.bot,
                  userName: 'System Bot',
                  userColor: Colors.purple,
                  action: 'Auto-scaling Triggered',
                  target: 'Cluster-Alpha',
                  time: '13:45:10 UTC',
                  details: _buildCodeBlock(
                    'SCALED_UP nodes: 3 -> 5',
                    isTag: true,
                  ),
                ),
                _buildTimelineItem(
                  userIcon: LucideIcons.x,
                  userName: 'Unknown User',
                  userColor: AppTheme.error,
                  action: 'Unusual Login Attempt',
                  target: 'Auth Service',
                  time: '12:12:05 UTC',
                  titleColor: AppTheme.error,
                  details: _buildCodeBlock(
                    '''IP: 192.168.1.XX
Status: BLOCKED_BY_FIREWALL''',
                    isMultiLine: true,
                    fontColor: AppTheme.error,
                  ),
                ),

                const SizedBox(height: 16),
                const Row(
                  children: [
                    Text(
                      'YESTERDAY, OCT 26',
                      style: TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        indent: 12,
                        color: AppTheme.surfaceHighlight,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                _buildTimelineItem(
                  userImage: 'https://i.pravatar.cc/150?img=11',
                  userName: 'Mark Chen',
                  action: 'Updated Load Balancer',
                  target: 'Infra-Net',
                  time: '23:55:01 UTC',
                  details: _buildCodeBlock(
                    'modified: /etc/lb/config.yaml',
                    isWarning: true,
                  ),
                  isLast: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDropdown(String label, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.surfaceHighlight),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 14, color: AppTheme.textMuted),
              const SizedBox(width: 8),
              Text(
                label,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          const Icon(
            LucideIcons.chevronDown,
            size: 14,
            color: AppTheme.textMuted,
          ),
        ],
      ),
    );
  }

  Widget _buildTimelineItem({
    String? userImage,
    IconData? userIcon,
    Color userColor = AppTheme.primary,
    required String userName,
    required String action,
    required String target,
    required String time,
    Widget? details,
    Color titleColor = Colors.white,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 50,
            child: Column(
              children: [
                if (userImage != null)
                  CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(userImage),
                  )
                else
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: userColor.withOpacity(0.2),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(userIcon, color: userColor, size: 20),
                  ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: AppTheme.surfaceHighlight,
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 32.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        action,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: titleColor,
                        ),
                      ),
                      Text(
                        time,
                        style: const TextStyle(
                          fontFamily: 'monospace',
                          color: AppTheme.textMuted,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Text(
                        userName,
                        style: TextStyle(
                          color: userColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Icon(LucideIcons.dot, size: 8, color: AppTheme.textMuted),
                      const SizedBox(width: 8),
                      Text(
                        target,
                        style: const TextStyle(color: AppTheme.textMuted),
                      ),
                    ],
                  ),
                  if (details != null) ...[const SizedBox(height: 12), details],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCodeBlock(
    String text, {
    bool isTag = false,
    bool isMultiLine = false,
    Color? fontColor,
    bool isWarning = false,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppTheme.background,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.surfaceHighlight),
      ),
      child: Row(
        children: [
          if (isTag) ...[
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: const Color(0xFF10b981).withOpacity(0.2),
                borderRadius: BorderRadius.circular(4),
              ),
              child: const Text(
                'SCALED_UP',
                style: TextStyle(
                  color: Color(0xFF10b981),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 8),
            const Text(
              'nodes: 3 -> 5',
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 12,
                color: AppTheme.textMuted,
              ),
            ),
          ] else if (isWarning) ...[
            const Text(
              'modified: ',
              style: TextStyle(
                color: Colors.orange,
                fontFamily: 'monospace',
                fontSize: 12,
              ),
            ),
            const Text(
              '/etc/lb/config.yaml',
              style: TextStyle(
                fontFamily: 'monospace',
                fontSize: 12,
                color: AppTheme.textMuted,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppTheme.surfaceHighlight,
                shape: BoxShape.circle,
              ),
              child: Icon(LucideIcons.chevronUp, size: 14),
            ),
          ] else ...[
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontFamily: 'monospace',
                  fontSize: 12,
                  color: fontColor ?? const Color(0xFFe2e8f0),
                  height: isMultiLine ? 1.5 : 1,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
