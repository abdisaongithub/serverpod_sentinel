import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';
import '../../widgets/app_sidebar.dart';

class PlaybookExecutionScreen extends StatelessWidget {
  const PlaybookExecutionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;

        return Scaffold(
          backgroundColor: const Color(0xFF0B0E14),
          drawer: !isDesktop
              ? const Drawer(
                  child: AppSidebar(activeRoute: AppRoutes.playbooks),
                )
              : null,
          body: Column(
            children: [
              const _Header(),
              Expanded(
                child: Flex(
                  direction: isDesktop ? Axis.horizontal : Axis.vertical,
                  children: [
                    // Left Section: Execution Steps
                    SizedBox(
                      width: isDesktop ? 400 : double.infinity,
                      height: isDesktop ? double.infinity : 400,
                      child: const _ExecutionSteps(),
                    ),
                    // Right Section: Live Logs
                    const Expanded(child: _LiveLogs()),
                  ],
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
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF161B22),
        border: Border(bottom: BorderSide(color: Color(0xFF30363D))),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
      child: Column(
        children: [
          Row(
            children: [
              // Breadcrumbs & Title
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          'Playbooks',
                          style: TextStyle(
                            color: Color(0xFF64748B),
                            fontSize: 12,
                          ),
                        ),
                        const Icon(
                          LucideIcons.chevronRight,
                          size: 14,
                          color: Color(0xFF64748B),
                        ),
                        const Text(
                          'Migrations',
                          style: TextStyle(
                            color: Color(0xFF64748B),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Text(
                          'Database Migration',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 2,
                          ),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1E293B),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: const Color(0xFF334155)),
                          ),
                          child: const Text(
                            '#8492-AC',
                            style: TextStyle(
                              color: Color(0xFF64748B),
                              fontSize: 10,
                              fontFamily: 'monospace',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Tracking Stats (Desktop middle)
              if (MediaQuery.of(context).size.width > 1200)
                const Expanded(flex: 2, child: _TrackingBar()),

              // Actions
              const SizedBox(width: 24),
              Row(
                children: [
                  _actionButton(
                    label: 'Stop',
                    icon: LucideIcons.square,
                    color: Colors.red,
                    isOutlined: true,
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 24,
                    width: 1,
                    color: const Color(0xFF30363D),
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                  ),
                  const SizedBox(width: 8),
                  _actionButton(
                    label: 'Rollback',
                    icon: LucideIcons.rotateCcw,
                    color: Colors.white,
                    isOutlined: true,
                  ),
                  const SizedBox(width: 8),
                  _actionButton(
                    label: 'Pause',
                    icon: LucideIcons.pause,
                    color: AppTheme.primary,
                    isOutlined: false,
                  ),
                ],
              ),
            ],
          ),
          if (MediaQuery.of(context).size.width <= 1200)
            const Padding(
              padding: EdgeInsets.only(top: 16),
              child: _TrackingBar(),
            ),
        ],
      ),
    );
  }

  Widget _actionButton({
    required String label,
    required IconData icon,
    required Color color,
    required bool isOutlined,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: isOutlined ? color.withOpacity(0.1) : color,
        borderRadius: BorderRadius.circular(6),
        border: isOutlined ? Border.all(color: color.withOpacity(0.5)) : null,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: isOutlined ? color : Colors.white),
          const SizedBox(width: 8),
          Text(
            label,
            style: TextStyle(
              color: isOutlined ? color : Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _TrackingBar extends StatelessWidget {
  const _TrackingBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _trackingItem(
          label: 'Status',
          value: 'Running',
          valueColor: AppTheme.primary,
          showPulse: true,
        ),
        const SizedBox(width: 12),
        _trackingItem(
          label: 'Time',
          value: '02:14',
          icon: LucideIcons.clock,
          isMono: true,
        ),
        const SizedBox(width: 12),
        _trackingItem(label: 'User', value: 'j.doe', icon: LucideIcons.user),
      ],
    );
  }

  Widget _trackingItem({
    required String label,
    required String value,
    IconData? icon,
    Color? valueColor,
    bool showPulse = false,
    bool isMono = false,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF0D1117),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: const Color(0xFF30363D)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (showPulse)
            Container(
              margin: const EdgeInsets.only(right: 8),
              width: 10,
              height: 10,
              decoration: const BoxDecoration(
                color: AppTheme.primary,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppTheme.primary,
                    blurRadius: 4,
                    spreadRadius: 1,
                  ),
                ],
              ),
            ),
          if (icon != null) ...[
            Icon(icon, size: 14, color: const Color(0xFF64748B)),
            const SizedBox(width: 8),
          ],
          Text(
            label.toUpperCase(),
            style: const TextStyle(
              color: Color(0xFF484F58),
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(width: 8),
          Container(width: 1, height: 12, color: const Color(0xFF30363D)),
          const SizedBox(width: 8),
          Text(
            value,
            style: TextStyle(
              color: valueColor ?? Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
              fontFamily: isMono ? 'monospace' : null,
            ),
          ),
        ],
      ),
    );
  }
}

class _ExecutionSteps extends StatelessWidget {
  const _ExecutionSteps();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF0B0E14),
        border: Border(right: BorderSide(color: Color(0xFF30363D))),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'EXECUTION STEPS',
                  style: TextStyle(
                    color: Color(0xFF64748B),
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF1E293B),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text(
                    '3 / 4',
                    style: TextStyle(color: Color(0xFF94A3B8), fontSize: 10),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: const [
                _StepItem(
                  title: 'Initialize Environment',
                  description:
                      'Environment variables loaded. Network check passed.',
                  status: StepStatus.success,
                ),
                _StepItem(
                  title: 'Backup Current DB',
                  description: 'Snapshot: snap_v2_3_final',
                  status: StepStatus.success,
                  showRollback: true,
                ),
                _StepItem(
                  title: 'Apply Schema Changes',
                  description:
                      'Migrating user tables to new v2.4 structure. This includes complex joins and index rebuilds.',
                  status: StepStatus.running,
                  progress: 0.45,
                  currentAction: 'patch_user_table.sql',
                ),
                _StepItem(
                  title: 'Verify Integrity',
                  description: 'Post-migration data consistency check.',
                  status: StepStatus.pending,
                  isLast: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

enum StepStatus { success, running, pending, failed }

class _StepItem extends StatelessWidget {
  final String title;
  final String description;
  final StepStatus status;
  final bool isLast;
  final bool showRollback;
  final double? progress;
  final String? currentAction;

  const _StepItem({
    required this.title,
    required this.description,
    required this.status,
    this.isLast = false,
    this.showRollback = false,
    this.progress,
    this.currentAction,
  });

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Timeline indicator
          SizedBox(
            width: 32,
            child: Column(
              children: [
                _buildIndicator(),
                if (!isLast)
                  Expanded(
                    child: Container(width: 2, color: const Color(0xFF1E293B)),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 16),
          // Content
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 24),
              child: Opacity(
                opacity: status == StepStatus.pending ? 0.5 : 1.0,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: status == StepStatus.running
                        ? const Color(0xFF1E293B).withOpacity(0.5)
                        : const Color(0xFF161B22).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: status == StepStatus.running
                          ? AppTheme.primary.withOpacity(0.3)
                          : const Color(0xFF30363D),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              title,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          _statusBadge(),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: const TextStyle(
                          color: Color(0xFF94A3B8),
                          fontSize: 12,
                          height: 1.4,
                        ),
                      ),
                      if (showRollback) ...[
                        const SizedBox(height: 12),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 8,
                            vertical: 4,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.amber.withOpacity(0.05),
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                              color: Colors.amber.withOpacity(0.1),
                            ),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                LucideIcons.history,
                                size: 12,
                                color: Colors.amber,
                              ),
                              SizedBox(width: 6),
                              Text(
                                'Rollback Point Available',
                                style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 11,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                      if (status == StepStatus.running && progress != null) ...[
                        const SizedBox(height: 16),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: LinearProgressIndicator(
                            value: progress,
                            backgroundColor: const Color(0xFF0D1117),
                            valueColor: const AlwaysStoppedAnimation<Color>(
                              AppTheme.primary,
                            ),
                            minHeight: 4,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              currentAction ?? '',
                              style: const TextStyle(
                                color: Color(0xFF484F58),
                                fontSize: 10,
                                fontFamily: 'monospace',
                              ),
                            ),
                            Text(
                              '${(progress! * 100).toInt()}%',
                              style: const TextStyle(
                                color: Color(0xFF484F58),
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildIndicator() {
    switch (status) {
      case StepStatus.success:
        return Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            color: Color(0xFF065F46),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            LucideIcons.check,
            size: 14,
            color: Color(0xFF34D399),
          ),
        );
      case StepStatus.running:
        return Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: 24,
              height: 24,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation<Color>(
                  AppTheme.primary.withOpacity(0.5),
                ),
              ),
            ),
            Container(
              width: 16,
              height: 16,
              decoration: const BoxDecoration(
                color: AppTheme.primary,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                LucideIcons.refreshCcw,
                size: 10,
                color: Colors.white,
              ),
            ),
          ],
        );
      case StepStatus.pending:
        return Container(
          width: 24,
          height: 24,
          decoration: BoxDecoration(
            color: Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: const Color(0xFF30363D), width: 2),
          ),
          child: const Center(
            child: Text(
              '4',
              style: TextStyle(color: Color(0xFF484F58), fontSize: 10),
            ),
          ),
        );
      case StepStatus.failed:
        return Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            color: Color(0xFF991B1B),
            shape: BoxShape.circle,
          ),
          child: const Icon(LucideIcons.x, size: 14, color: Color(0xFFF87171)),
        );
    }
  }

  Widget _statusBadge() {
    Color color;
    String text;
    switch (status) {
      case StepStatus.success:
        color = const Color(0xFF10B981);
        text = 'SUCCESS';
        break;
      case StepStatus.running:
        color = AppTheme.primary;
        text = 'RUNNING';
        break;
      case StepStatus.pending:
        color = const Color(0xFF484F58);
        text = 'PENDING';
        break;
      case StepStatus.failed:
        color = const Color(0xFFEF4444);
        text = 'FAILED';
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: color.withOpacity(0.2)),
      ),
      child: Text(
        text,
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

class _LiveLogs extends StatefulWidget {
  const _LiveLogs();

  @override
  State<_LiveLogs> createState() => _LiveLogsState();
}

class _LiveLogsState extends State<_LiveLogs> {
  final List<LogEntry> logs = [
    LogEntry(
      '10:42:01',
      '[INFO]',
      "Starting playbook 'db_migration_v2.4'",
      const Color(0xFF94A3B8),
    ),
    LogEntry(
      '10:42:02',
      '[INFO]',
      'Checking dependencies... OK',
      const Color(0xFF94A3B8),
    ),
    LogEntry(
      '10:42:05',
      '[TASK]',
      'Initialize Environment',
      const Color(0xFF38BDF8),
    ),
    LogEntry(
      '10:42:05',
      '[SUCCESS]',
      'Environment ready. Variables loaded from vault.',
      const Color(0xFF10B981),
    ),
    LogEntry(
      '10:42:06',
      '[TASK]',
      'Backup Current DB',
      const Color(0xFF38BDF8),
    ),
    LogEntry(
      '10:43:12',
      '[INFO]',
      'Snapshotting volume vol-0a1b2c...',
      const Color(0xFF94A3B8),
    ),
    LogEntry(
      '10:43:45',
      '[SUCCESS]',
      'Backup stored at s3://backups/snap_v2_3_final',
      const Color(0xFF10B981),
    ),
    LogEntry(
      '10:43:46',
      '[TASK]',
      'Apply Schema Changes',
      const Color(0xFF38BDF8),
    ),
    LogEntry(
      '10:43:48',
      '[INFO]',
      "Acquiring lock on table 'users'...",
      const Color(0xFF94A3B8),
    ),
    LogEntry(
      '10:43:49',
      '[EXEC]',
      'ALTER TABLE users ADD COLUMN preferences JSONB;',
      const Color(0xFF60A5FA),
    ),
    LogEntry(
      '10:44:01',
      '[INFO]',
      'Rows affected: 14,203',
      const Color(0xFF94A3B8),
    ),
    LogEntry(
      '10:44:02',
      '[EXEC]',
      'CREATE INDEX idx_users_pref ON users(preferences);',
      const Color(0xFF60A5FA),
    ),
    LogEntry(
      '10:44:03',
      '[INFO]',
      'Index creation started (pid: 4921)',
      const Color(0xFF94A3B8),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFF0D1117),
      child: Column(
        children: [
          // Terminal Toolbar
          Container(
            height: 40,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            decoration: const BoxDecoration(
              color: Color(0xFF161B22),
              border: Border(bottom: BorderSide(color: Color(0xFF30363D))),
            ),
            child: Row(
              children: [
                const Icon(
                  LucideIcons.terminal,
                  size: 14,
                  color: Color(0xFF484F58),
                ),
                const SizedBox(width: 12),
                const Text(
                  'LIVE LOGS',
                  style: TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(width: 8),
                Container(width: 1, height: 12, color: const Color(0xFF30363D)),
                const SizedBox(width: 8),
                const Text(
                  'tail -f execution.log',
                  style: TextStyle(
                    color: Color(0xFF484F58),
                    fontSize: 10,
                    fontFamily: 'monospace',
                  ),
                ),
                const Spacer(),
                _toolbarButton(LucideIcons.search, 'Find'),
                const SizedBox(width: 16),
                _toolbarButton(LucideIcons.arrowDownCircle, 'Bottom'),
                const SizedBox(width: 16),
                _toolbarButton(
                  LucideIcons.download,
                  'Full Log',
                  color: AppTheme.primary,
                ),
              ],
            ),
          ),
          // Log List
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: logs.length + 1,
              itemBuilder: (context, index) {
                if (index == logs.length) {
                  return _buildTrailingLine();
                }
                final log = logs[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 70,
                        child: Text(
                          log.time,
                          style: const TextStyle(
                            color: Color(0xFF484F58),
                            fontSize: 12,
                            fontFamily: 'monospace',
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      SizedBox(
                        width: 80,
                        child: Text(
                          log.tag,
                          style: TextStyle(
                            color: log.color,
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'monospace',
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          log.message,
                          style: const TextStyle(
                            color: Color(0xFFC9D1D9),
                            fontSize: 12,
                            fontFamily: 'monospace',
                          ),
                        ),
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
  }

  Widget _toolbarButton(IconData icon, String label, {Color? color}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 14, color: color ?? const Color(0xFF64748B)),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            color: color ?? const Color(0xFF94A3B8),
            fontSize: 11,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }

  Widget _buildTrailingLine() {
    return Container(
      margin: const EdgeInsets.only(top: 4),
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      decoration: BoxDecoration(
        color: AppTheme.primary.withOpacity(0.1),
        border: const Border(
          left: BorderSide(color: AppTheme.primary, width: 2),
        ),
      ),
      child: const Row(
        children: [
          SizedBox(
            width: 70,
            child: Text(
              '10:44:05',
              style: TextStyle(
                color: Color(0xFF484F58),
                fontSize: 12,
                fontFamily: 'monospace',
              ),
            ),
          ),
          SizedBox(width: 12),
          Text(
            'Running patch_user_table.sql... (45%)',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              fontFamily: 'monospace',
            ),
          ),
          SizedBox(width: 4),
          _BlinkingCursor(),
        ],
      ),
    );
  }
}

class LogEntry {
  final String time;
  final String tag;
  final String message;
  final Color color;

  LogEntry(this.time, this.tag, this.message, this.color);
}

class _BlinkingCursor extends StatefulWidget {
  const _BlinkingCursor();

  @override
  State<_BlinkingCursor> createState() => _BlinkingCursorState();
}

class _BlinkingCursorState extends State<_BlinkingCursor>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: Container(width: 8, height: 14, color: Colors.white),
    );
  }
}
