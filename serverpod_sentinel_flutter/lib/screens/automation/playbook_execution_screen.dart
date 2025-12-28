import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';

class PlaybookExecutionScreen extends StatelessWidget {
  const PlaybookExecutionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Column(
          children: [
            Text(
              'Database Migration',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              'Run ID: #8492-AC',
              style: TextStyle(fontSize: 12, color: AppTheme.textMuted),
            ),
          ],
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text('Stop', style: TextStyle(color: AppTheme.error)),
          ),
        ],
      ),
      body: Column(
        children: [
          // Stats
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: _buildExecStat('TIME', '02:14', LucideIcons.clock),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildExecStat(
                    'STATUS',
                    'Running',
                    LucideIcons.refreshCw,
                    valueColor: AppTheme.primary,
                    hasDot: true,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildExecStat('USER', 'j.doe', LucideIcons.user),
                ),
              ],
            ),
          ),

          const SizedBox(height: 16),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'EXECUTION STEPS',
                style: TextStyle(
                  color: AppTheme.textMuted,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),

          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              children: [
                _buildStepItem(
                  title: 'Initialize Environment',
                  desc: 'Environment variables loaded. Network check passed.',
                  status: 'Success',
                  isFirst: true,
                ),
                _buildStepItem(
                  title: 'Backup Current DB',
                  desc: 'Snapshot created: snap_v2_3_final',
                  status: 'Success',
                  showRollback: true,
                ),
                _buildStepItem(
                  title: 'Apply Schema Changes',
                  desc:
                      'Migrating user tables to new v2.4 structure. This may take a few minutes.',
                  status: 'Running',
                  isRunning: true,
                  content: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(
                              LucideIcons.terminal,
                              size: 12,
                              color: AppTheme.textMuted,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'STDOUT',
                              style: TextStyle(
                                color: AppTheme.textMuted,
                                fontSize: 10,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ],
                        ),
                        Divider(color: AppTheme.surfaceHighlight),
                        Text(
                          '> connecting to host 192.168.1.5...',
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 12,
                            color: AppTheme.textMuted,
                          ),
                        ),
                        Text(
                          '> verifying connection...',
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 12,
                            color: AppTheme.textMuted,
                          ),
                        ),
                        Text(
                          '> connection established.',
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 12,
                            color: AppTheme.success,
                          ),
                        ),
                        Text(
                          '> applying patch_user_table.sql...',
                          style: TextStyle(
                            fontFamily: 'monospace',
                            fontSize: 12,
                            color: AppTheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                _buildStepItem(
                  title: 'Verify Integrity',
                  desc: 'Post-migration data consistency check.',
                  status: 'Pending',
                  isLast: true,
                ),
              ],
            ),
          ),

          // Bottom Controls
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(LucideIcons.rotateCcw, size: 18),
                    label: const Text('Rollback'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      side: const BorderSide(color: AppTheme.surfaceHighlight),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(LucideIcons.pause, size: 18),
                    label: const Text('Pause'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.primary,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExecStat(
    String label,
    String value,
    IconData icon, {
    Color? valueColor,
    bool hasDot = false,
  }) {
    return Container(
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
              Icon(icon, size: 14, color: AppTheme.textMuted),
              if (hasDot)
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: AppTheme.primary,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          const Text(
            'TIME',
            style: TextStyle(
              color: AppTheme.textMuted,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ), // Ooops reused text
          // Correcting to use label param
          // Text(label, style: TextStyle(color: AppTheme.textMuted, fontSize: 10, fontWeight: FontWeight.bold)),
          Text(
            label,
            style: const TextStyle(
              color: AppTheme.textMuted,
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: valueColor ?? Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepItem({
    required String title,
    required String desc,
    required String status,
    bool isFirst = false,
    bool isLast = false,
    bool isRunning = false,
    bool showRollback = false,
    Widget? content,
  }) {
    Color statusColor = status == 'Success'
        ? AppTheme.success
        : status == 'Running'
        ? AppTheme.primary
        : AppTheme.surfaceHighlight;
    Color iconColor = status == 'Success'
        ? AppTheme.success
        : status == 'Running'
        ? AppTheme.primary
        : AppTheme.textMuted;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 40,
            child: Column(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: status == 'Pending'
                        ? Colors.transparent
                        : statusColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: status == 'Pending'
                          ? AppTheme.surfaceHighlight
                          : statusColor,
                    ),
                  ),
                  child: status == 'Success'
                      ? Icon(LucideIcons.check, size: 14, color: statusColor)
                      : status == 'Running'
                      ? Padding(
                          padding: const EdgeInsets.all(4),
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: statusColor,
                          ),
                        )
                      : Center(
                          child: Text(
                            isFirst
                                ? '1'
                                : isLast
                                ? '4'
                                : '3',
                            style: const TextStyle(
                              fontSize: 10,
                              color: AppTheme.textMuted,
                            ),
                          ),
                        ), // Hacky numbers
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: AppTheme.primary.withOpacity(0.3),
                    ),
                  ), // Should determine color based on progress
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
                        title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 2,
                        ),
                        decoration: BoxDecoration(
                          color: statusColor.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
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
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    desc,
                    style: const TextStyle(
                      color: AppTheme.textMuted,
                      height: 1.4,
                    ),
                  ),
                  if (showRollback) ...[
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          LucideIcons.history,
                          size: 12,
                          color: Colors.orange,
                        ),
                        const SizedBox(width: 4),
                        const Text(
                          'Rollback Point Available',
                          style: TextStyle(color: Colors.orange, fontSize: 12),
                        ),
                      ],
                    ),
                  ],
                  if (content != null) ...[const SizedBox(height: 16), content],
                  if (isRunning) ...[const SizedBox(height: 16)],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
