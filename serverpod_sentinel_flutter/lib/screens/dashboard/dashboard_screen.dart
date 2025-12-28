import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import '../registry/service_registry_screen.dart';
import '../livestream/live_stream_screen.dart';
import '../incidents/incidents_screen.dart';
import '../settings/settings_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Row(
          children: [
            const CircleAvatar(
              backgroundImage: AssetImage(
                'assets/images/avatar_placeholder.png',
              ), // Placeholder
              backgroundColor: AppTheme.surfaceHighlight,
              radius: 18,
            ),
            const SizedBox(width: 12),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome back',
                  style: Theme.of(
                    context,
                  ).textTheme.bodySmall?.copyWith(color: AppTheme.textMuted),
                ),
                const Text(
                  'Ops Center',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(LucideIcons.bell, color: Colors.white),
            onPressed: () {},
          ),
          const SizedBox(width: 8),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppTheme.surface,
        selectedItemColor: AppTheme.primary,
        unselectedItemColor: AppTheme.textMuted,
        type: BottomNavigationBarType.fixed,
        currentIndex: 0,
        onTap: (index) {
          if (index == 1) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const IncidentsScreen()),
            );
          } else if (index == 2) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ServiceRegistryScreen()),
            );
          } else if (index == 3) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SettingsScreen()),
            );
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.layoutGrid),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.alertTriangle),
            label: 'Incidents',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.server),
            label: 'Services',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.settings),
            label: 'Settings',
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < AppTheme.mobileBreakpoint;
          return SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Health Circle
                      Center(
                        child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            color: AppTheme.surface,
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: AppTheme.surfaceHighlight,
                            ),
                          ),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              // Simulated progress ring
                              SizedBox(
                                width: 180,
                                height: 180,
                                child: CircularProgressIndicator(
                                  value: 0.992,
                                  strokeWidth: 12,
                                  backgroundColor: AppTheme.surfaceHighlight,
                                  color: AppTheme.success,
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '99.2%',
                                    style: Theme.of(context)
                                        .textTheme
                                        .displaySmall
                                        ?.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    'HEALTH',
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelSmall
                                        ?.copyWith(
                                          color: AppTheme.success,
                                          letterSpacing: 1.2,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      Center(
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 16,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: AppTheme.success.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                LucideIcons.checkCircle,
                                size: 16,
                                color: AppTheme.success,
                              ),
                              SizedBox(width: 8),
                              Text(
                                'All Systems Operational',
                                style: TextStyle(
                                  color: AppTheme.success,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Active Incidents Alert
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              const Color(0xFF450a0a),
                              AppTheme.surface,
                            ], // Dark red to surface
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppTheme.error.withOpacity(0.3),
                          ),
                        ),
                        child: Row(
                          children: [
                            Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppTheme.error.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Icon(
                                LucideIcons.alertTriangle,
                                color: AppTheme.error,
                              ),
                            ),
                            const SizedBox(width: 16),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '3 Active Incidents',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.white,
                                    ),
                                  ),
                                  Text(
                                    'Requires immediate attention',
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.7),
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const IncidentsScreen(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppTheme.error,
                                foregroundColor: Colors.white,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 0,
                                ),
                                minimumSize: const Size(0, 36),
                              ),
                              child: const Text('Resolve'),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 24),
                      Text(
                        'ENVIRONMENT STATUS',
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(
                              color: AppTheme.textMuted,
                              letterSpacing: 1.2,
                            ),
                      ),
                      const SizedBox(height: 12),

                      // Env Grid
                      if (isMobile)
                        Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: _buildEnvCard(
                                context,
                                name: 'Production',
                                region: 'us-east-1',
                                icon: LucideIcons.rocket,
                                isHealthy: true,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                Expanded(
                                  child: _buildSmallStatusCard(
                                    'Staging',
                                    'Building',
                                    Colors.blue,
                                    LucideIcons.flaskConical,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Expanded(
                                  child: _buildSmallStatusCard(
                                    'Dev',
                                    'Degraded',
                                    Colors.orange,
                                    LucideIcons.code,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      else
                        Row(
                          children: [
                            Expanded(
                              flex: 2,
                              child: _buildEnvCard(
                                context,
                                name: 'Production',
                                region: 'us-east-1',
                                icon: LucideIcons.rocket,
                                isHealthy: true,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              flex: 1,
                              child: _buildSmallStatusCard(
                                'Staging',
                                'Building',
                                Colors.blue,
                                LucideIcons.flaskConical,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              flex: 1,
                              child: _buildSmallStatusCard(
                                'Dev',
                                'Degraded',
                                Colors.orange,
                                LucideIcons.code,
                              ),
                            ),
                          ],
                        ),

                      const SizedBox(height: 24),
                      Text(
                        'SERVICES AT RISK',
                        style: Theme.of(context).textTheme.labelMedium
                            ?.copyWith(
                              color: AppTheme.textMuted,
                              letterSpacing: 1.2,
                            ),
                      ),
                      const SizedBox(height: 12),

                      if (isMobile)
                        Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              child: _buildRiskCard(
                                'Main DB',
                                '88%',
                                'CPU Usage',
                                Colors.orange,
                                LucideIcons.database,
                              ),
                            ),
                            const SizedBox(height: 12),
                            SizedBox(
                              width: double.infinity,
                              child: _buildRiskCard(
                                'Payment API',
                                '4.2%',
                                '5xx Errors',
                                AppTheme.error,
                                LucideIcons.creditCard,
                              ),
                            ),
                          ],
                        )
                      else
                        Row(
                          children: [
                            Expanded(
                              child: _buildRiskCard(
                                'Main DB',
                                '88%',
                                'CPU Usage',
                                Colors.orange,
                                LucideIcons.database,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: _buildRiskCard(
                                'Payment API',
                                '4.2%',
                                '5xx Errors',
                                AppTheme.error,
                                LucideIcons.creditCard,
                              ),
                            ),
                          ],
                        ),

                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'LIVE ACTIVITY',
                            style: Theme.of(context).textTheme.labelMedium
                                ?.copyWith(
                                  color: AppTheme.textMuted,
                                  letterSpacing: 1.2,
                                ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: AppTheme.surfaceHighlight,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: const Row(
                              children: [
                                Text(
                                  'Last 24h',
                                  style: TextStyle(fontSize: 12),
                                ),
                                Icon(LucideIcons.chevronDown, size: 14),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),

                      // Filter Chips
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            _buildFilterChip('All', true),
                            _buildFilterChip(
                              'Critical',
                              false,
                              dotColor: AppTheme.error,
                            ),
                            _buildFilterChip(
                              'Warning',
                              false,
                              dotColor: Colors.orange,
                            ),
                            _buildFilterChip(
                              'Deploys',
                              false,
                              icon: LucideIcons.rocket,
                            ),
                            _buildFilterChip(
                              'Infra',
                              false,
                              icon: LucideIcons.server,
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),
                      // Activity Feed List
                      _buildActivityItem(
                        'Sarah Jenkins',
                        'initiated rollback on',
                        'Production',
                        '10:42 AM • v2.4.1 -> v2.4.0',
                        LucideIcons.user,
                      ),
                      _buildActivityItem(
                        'CPU usage spike detected on',
                        '',
                        'Node-4',
                        '10:40 AM • Alert Rule #829',
                        LucideIcons.zap,
                        iconColor: AppTheme.error,
                      ),
                      _buildActivityItem(
                        'Auto-scaling group stabilized',
                        '',
                        '',
                        '10:35 AM • Capacity at 12 instances',
                        LucideIcons.cloud,
                        iconColor: AppTheme.success,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildEnvCard(
    BuildContext context, {
    required String name,
    required String region,
    required IconData icon,
    required bool isHealthy,
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
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppTheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(icon, color: AppTheme.primary),
          ),
          const SizedBox(width: 12),
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
                  region,
                  style: const TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          if (isHealthy)
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppTheme.success,
                shape: BoxShape.circle,
              ),
            ),
          const SizedBox(width: 4),
          const Text('Healthy', style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  Widget _buildSmallStatusCard(
    String name,
    String status,
    Color color,
    IconData icon,
  ) {
    return Container(
      padding: const EdgeInsets.all(12),
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
              Icon(icon, size: 16, color: color),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: color.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  status.toUpperCase(),
                  style: TextStyle(
                    color: color,
                    fontSize: 8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(
            'Status info...',
            style: const TextStyle(color: AppTheme.textMuted, fontSize: 10),
          ),
        ],
      ),
    );
  }

  Widget _buildRiskCard(
    String name,
    String value,
    String unit,
    Color color,
    IconData icon,
  ) {
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
            children: [
              Icon(icon, size: 16, color: color),
              const SizedBox(width: 8),
              Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              Text(
                'High Load',
                style: TextStyle(
                  color: color,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  unit,
                  style: const TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          // Mini bar chart
          Row(
            children: List.generate(
              5,
              (index) => Expanded(
                child: Container(
                  height: (index + 2) * 4.0,
                  margin: const EdgeInsets.only(right: 4),
                  decoration: BoxDecoration(
                    color: index == 4 ? color : color.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(
    String label,
    bool isSelected, {
    Color? dotColor,
    IconData? icon,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : AppTheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          color: isSelected ? Colors.white : AppTheme.surfaceHighlight,
        ),
      ),
      child: Row(
        children: [
          if (dotColor != null) ...[
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: dotColor,
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 8),
          ],
          if (icon != null) ...[
            Icon(
              icon,
              size: 14,
              color: isSelected ? Colors.black : AppTheme.textMuted,
            ),
            const SizedBox(width: 8),
          ],
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : AppTheme.textMuted,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(
    String actor,
    String action,
    String target,
    String timestamp,
    IconData icon, {
    Color? iconColor,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppTheme.surface, // Should be circle actually
              shape: BoxShape.circle,
              border: Border.all(color: AppTheme.surfaceHighlight),
            ),
            child: Icon(icon, size: 16, color: iconColor ?? AppTheme.text),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.white),
                    children: [
                      TextSpan(
                        text: actor,
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ' $action ',
                        style: const TextStyle(color: AppTheme.textMuted),
                      ),
                      TextSpan(
                        text: target,
                        style: const TextStyle(color: AppTheme.primary),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  timestamp,
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
