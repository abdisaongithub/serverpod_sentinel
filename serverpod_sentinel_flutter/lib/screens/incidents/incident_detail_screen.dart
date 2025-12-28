import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';

class IncidentDetailScreen extends StatelessWidget {
  const IncidentDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'INC-3942',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(icon: const Icon(LucideIcons.share2), onPressed: () {}),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Status Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.surfaceHighlight),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'CURRENT STATUS',
                        style: TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.error.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: AppTheme.error.withOpacity(0.5),
                          ),
                        ),
                        child: const Text(
                          'Critical',
                          style: TextStyle(
                            color: AppTheme.error,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Container(
                        width: 12,
                        height: 12,
                        decoration: const BoxDecoration(
                          color: AppTheme.error,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Investigating',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Divider(color: AppTheme.surfaceHighlight),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                LucideIcons.clock,
                                size: 12,
                                color: AppTheme.textMuted,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Duration',
                                style: TextStyle(
                                  color: AppTheme.textMuted,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Text(
                            '45m 12s',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Icon(
                                LucideIcons.users,
                                size: 12,
                                color: AppTheme.textMuted,
                              ),
                              SizedBox(width: 4),
                              Text(
                                'Responders',
                                style: TextStyle(
                                  color: AppTheme.textMuted,
                                  fontSize: 10,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 4),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 10,
                                backgroundImage: NetworkImage(
                                  'https://i.pravatar.cc/150?img=1',
                                ),
                              ),
                              SizedBox(width: -8),
                              CircleAvatar(
                                radius: 10,
                                backgroundImage: NetworkImage(
                                  'https://i.pravatar.cc/150?img=2',
                                ),
                              ),
                              SizedBox(width: -8),
                              CircleAvatar(
                                radius: 10,
                                backgroundColor: AppTheme.surfaceHighlight,
                                child: Text(
                                  '+3',
                                  style: TextStyle(
                                    fontSize: 8,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  // Mini Chart
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Error Rate (5xx)',
                        style: TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 10,
                        ),
                      ),
                      const Spacer(),
                      _buildBar(10, AppTheme.primary.withOpacity(0.3)),
                      _buildBar(15, AppTheme.primary.withOpacity(0.3)),
                      _buildBar(12, AppTheme.primary.withOpacity(0.3)),
                      _buildBar(18, AppTheme.primary.withOpacity(0.3)),
                      _buildBar(30, AppTheme.primary),
                      _buildBar(45, AppTheme.primary),
                      _buildBar(60, AppTheme.error),
                      _buildBar(55, AppTheme.error),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),

            const Text(
              'Incident Summary',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              'High latency observed in the US-East region API gateway. Error rates elevated by 15% affecting checkout services. Engineering team is currently isolating the problematic microservice.',
              style: TextStyle(color: AppTheme.textMuted, height: 1.5),
            ),
            const SizedBox(height: 24),

            const Text(
              'Timeline of Events',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildTimelineEvent(
              time: '10:45 AM',
              title: 'Alert Triggered',
              desc: '"Latency > 500ms" alert fired for US-East Gateway.',
              icon: LucideIcons.bell,
              color: AppTheme.error,
              meta: 'System Monitor',
            ),
            _buildTimelineEvent(
              time: '10:48 AM',
              title: 'Investigating Started',
              desc:
                  'J. Doe acknowledged the incident and started diagnostic runbook.',
              icon: LucideIcons.user,
              color: AppTheme.primary,
              meta: 'J. Doe',
              metaImage: 'https://i.pravatar.cc/150?img=3',
            ),
            _buildTimelineEvent(
              time: '10:55 AM',
              title: 'Status Update',
              desc:
                  'Database connection pool exhaustion identified on primary shard.',
              icon: LucideIcons.layoutList,
              color: AppTheme.surfaceHighlight,
              isLast: true,
            ),

            const SizedBox(height: 24),
            const Text(
              'Actions Taken',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            _buildActionItem('Automatic scale-up triggered', isDone: true),
            _buildActionItem('Read replicas promoted', isDone: true),
            _buildActionItem(
              'Cache invalidation (Pending)',
              isDone: false,
              color: AppTheme.textMuted,
            ),

            const SizedBox(height: 24),
            const Text(
              'Suggested Next Steps',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                padding: const EdgeInsets.all(16),
              ),
              child: Row(
                children: [
                  const Icon(LucideIcons.rotateCcw),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Rollback Deployment',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Revert to v4.2.0',
                          style: TextStyle(fontSize: 12, color: Colors.white70),
                        ),
                      ],
                    ),
                  ),
                  const Icon(LucideIcons.chevronRight),
                ],
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(12),
              ),
              child: ListTile(
                leading: const Icon(
                  LucideIcons.megaphone,
                  color: Colors.orange,
                ),
                title: const Text(
                  'Escalate Incident',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: const Text(
                  'Notify Level 3 SRE Team',
                  style: TextStyle(color: AppTheme.textMuted, fontSize: 12),
                ),
                trailing: const Icon(
                  LucideIcons.chevronRight,
                  color: AppTheme.textMuted,
                ),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBar(double height, Color color) {
    return Container(
      width: 24,
      height: height,
      margin: const EdgeInsets.only(left: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  Widget _buildTimelineEvent({
    required String time,
    required String title,
    required String desc,
    required IconData icon,
    required Color color,
    String? meta,
    String? metaImage,
    bool isLast = false,
  }) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 40,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: color == AppTheme.surfaceHighlight
                        ? AppTheme.surfaceHighlight
                        : color.withOpacity(0.2),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    size: 16,
                    color: color == AppTheme.surfaceHighlight
                        ? AppTheme.textMuted
                        : color,
                  ),
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
              padding: const EdgeInsets.only(bottom: 24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style: TextStyle(
                      color: AppTheme.textMuted,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    desc,
                    style: const TextStyle(
                      color: AppTheme.textMuted,
                      height: 1.4,
                    ),
                  ),
                  if (meta != null) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        if (metaImage != null)
                          Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: CircleAvatar(
                              radius: 8,
                              backgroundImage: NetworkImage(metaImage),
                            ),
                          )
                        else
                          const Padding(
                            padding: EdgeInsets.only(right: 8),
                            child: Icon(
                              LucideIcons.shield,
                              size: 12,
                              color: AppTheme.textMuted,
                            ),
                          ),

                        Text(
                          meta,
                          style: TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem(String label, {required bool isDone, Color? color}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface.withOpacity(0.5),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceHighlight),
      ),
      child: Row(
        children: [
          Icon(
            isDone ? LucideIcons.checkCircle : LucideIcons.circle,
            color: isDone ? AppTheme.success : AppTheme.textMuted,
            size: 20,
          ),
          const SizedBox(width: 16),
          Text(
            label,
            style: TextStyle(color: isDone ? Colors.white : AppTheme.textMuted),
          ),
        ],
      ),
    );
  }
}
