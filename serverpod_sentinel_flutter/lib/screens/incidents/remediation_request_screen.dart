import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';

class RemediationRequestScreen extends StatelessWidget {
  const RemediationRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Remediation Request',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.chevronLeft),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            margin: const EdgeInsets.only(right: 16),
            decoration: BoxDecoration(
              color: Colors.orange.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.orange),
            ),
            child: const Text(
              'Pending',
              style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Incident Context
                const Text(
                  'Incident Context',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Container(
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
                        children: [
                          const Icon(
                            LucideIcons.alertTriangle,
                            color: AppTheme.error,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          const Text(
                            'CRITICAL ALERT',
                            style: TextStyle(
                              color: AppTheme.error,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          const Text(
                            'ID: #4921',
                            style: TextStyle(color: AppTheme.textMuted),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Text(
                        'High Latency Spike',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text(
                        'Service: Payment-Gateway-API',
                        style: TextStyle(color: AppTheme.textMuted),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Icon(
                            LucideIcons.clock,
                            size: 14,
                            color: AppTheme.textMuted,
                          ),
                          const SizedBox(width: 6),
                          const Text(
                            'Today, 10:42 PM UTC',
                            style: TextStyle(
                              color: AppTheme.textMuted,
                              fontFamily: 'monospace',
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),

                      // Chart Placeholder
                      Container(
                        height: 100,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [Color(0xFF0F172A), Color(0xFF1E293B)],
                            begin: Alignment.bottomCenter,
                            end: Alignment.topCenter,
                          ),
                        ),
                        child: CustomPaint(
                          painter: AreaChartPainter(),
                          child: Container(),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                const Text(
                  'Risk Summary',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
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
                            const Row(
                              children: [
                                Icon(
                                  LucideIcons.shield,
                                  size: 16,
                                  color: AppTheme.textMuted,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'RISK LEVEL',
                                  style: TextStyle(
                                    color: AppTheme.textMuted,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Text(
                              'Low',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: AppTheme.success,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
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
                            const Row(
                              children: [
                                Icon(
                                  LucideIcons.dollarSign,
                                  size: 16,
                                  color: AppTheme.textMuted,
                                ),
                                SizedBox(width: 8),
                                Text(
                                  'EST. COST',
                                  style: TextStyle(
                                    color: AppTheme.textMuted,
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 8),
                            const Row(
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  '+\$12',
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  '/hr',
                                  style: TextStyle(color: AppTheme.textMuted),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Playbook Details',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Auto-Scaling Group',
                        style: TextStyle(color: AppTheme.primary),
                      ),
                    ),
                  ],
                ),
                Container(
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
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: AppTheme.primary.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Icon(
                              LucideIcons.settings,
                              color: AppTheme.primary,
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Scale Up Operations',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  'Increase desired capacity by 2 units to handle load spike.',
                                  style: TextStyle(color: AppTheme.textMuted),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 24),
                      const Text(
                        'EXECUTION STEPS',
                        style: TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.2,
                        ),
                      ),
                      const SizedBox(height: 16),
                      _buildStepCheck('Verify current ASG capacity', true),
                      const SizedBox(height: 12),
                      _buildStepCheck(
                        'Update DesiredCapacity (+2)',
                        false,
                        isAction: true,
                      ),
                      const SizedBox(height: 12),
                      _buildStepCheck('Validate instance health checks', false),
                    ],
                  ),
                ),

                const SizedBox(height: 24),
                const Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        LucideIcons.bot,
                        size: 14,
                        color: AppTheme.textMuted,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Requested by Watchdog-Bot-v2 via Slack',
                        style: TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 24),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton.icon(
                        onPressed: () {},
                        icon: const Icon(LucideIcons.x, size: 18),
                        label: const Text('Reject'),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppTheme.error,
                          side: BorderSide(
                            color: AppTheme.error.withOpacity(0.2),
                          ),
                          backgroundColor: AppTheme.error.withOpacity(0.05),
                          padding: const EdgeInsets.symmetric(vertical: 20),
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
                        icon: const Icon(LucideIcons.check, size: 18),
                        label: const Text('Approve\nPlaybook'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppTheme.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ), // taller button
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildStepCheck(
    String label,
    bool isChecked, {
    bool isAction = false,
  }) {
    return Row(
      children: [
        if (isChecked)
          const Icon(
            LucideIcons.checkCircle,
            color: AppTheme.textMuted,
            size: 20,
          )
        else if (isAction)
          const Icon(LucideIcons.playCircle, color: AppTheme.primary, size: 20)
        else
          const Icon(LucideIcons.circle, color: AppTheme.textMuted, size: 20),

        const SizedBox(width: 12),
        Text(
          label,
          style: TextStyle(
            color: isAction ? Colors.white : AppTheme.textMuted,
            fontWeight: isAction ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ],
    );
  }
}

// Simple painter to simulate the mountain chart
class AreaChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = const Color(0xFF2ca4bc).withOpacity(0.3)
      ..style = PaintingStyle.fill;

    var path = Path();
    path.moveTo(0, size.height);
    // Random peaks
    path.lineTo(size.width * 0.2, size.height * 0.8);
    path.lineTo(size.width * 0.3, size.height * 0.6);
    path.lineTo(size.width * 0.4, size.height * 0.7);
    path.lineTo(size.width * 0.5, size.height * 0.4);
    path.lineTo(size.width * 0.6, size.height * 0.5);
    path.lineTo(size.width * 0.7, size.height * 0.2);
    path.lineTo(size.width * 0.8, size.height * 0.5);
    path.lineTo(size.width * 0.9, size.height * 0.4);
    path.lineTo(size.width, size.height * 0.5);
    path.lineTo(size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
