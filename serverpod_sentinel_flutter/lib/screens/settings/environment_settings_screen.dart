import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import '../../widgets/app_sidebar.dart';

import '../../routes.dart';

class EnvironmentSettingsScreen extends StatefulWidget {
  const EnvironmentSettingsScreen({super.key});

  @override
  State<EnvironmentSettingsScreen> createState() =>
      _EnvironmentSettingsScreenState();
}

class _EnvironmentSettingsScreenState extends State<EnvironmentSettingsScreen> {
  // Scaling Policy State
  double _minInstances = 2;
  double _maxInstances = 12;
  double _targetCpu = 75;

  // Mock Env Vars
  final List<Map<String, String>> _envVars = [
    {
      'key': 'DB_HOST',
      'value': 'prod-db-cluster-01.aws.internal',
      'isSecret': 'false',
    },
    {'key': 'DB_PORT', 'value': '5432', 'isSecret': 'false'},
    {
      'key': 'API_SECRET_KEY',
      'value': 'sk_live_****************',
      'isSecret': 'true',
    },
    {
      'key': 'REDIS_URL',
      'value': 'redis://cache-cluster:6379',
      'isSecret': 'false',
    },
    {'key': 'LOG_LEVEL', 'value': 'INFO', 'isSecret': 'false'},
  ];

  @override
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;

        if (isDesktop) {
          return Scaffold(
            backgroundColor: AppTheme.background,
            body: Column(
              children: [
                _buildDesktopHeader(),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildResourceUsageSection(isDesktop: true),
                        const SizedBox(height: 24),
                        _buildMainContent(isDesktop: true),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        // Mobile Layout
        return Scaffold(
          appBar: AppBar(
            title: const Text(
              'Production Settings',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
            actions: [
              IconButton(
                onPressed: () {},
                icon: const Icon(LucideIcons.moreVertical),
              ),
            ],
          ),
          drawer: const Drawer(
            child: AppSidebar(activeRoute: AppRoutes.environmentSettings),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _buildResourceUsageSection(isDesktop: false),
                const SizedBox(height: 24),
                _buildMainContent(isDesktop: false),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildDesktopHeader() {
    return Container(
      height: 72,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: const BoxDecoration(
        color: AppTheme.surface,
        border: Border(bottom: BorderSide(color: AppTheme.surfaceHighlight)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(LucideIcons.server, size: 24, color: AppTheme.primary),
              const SizedBox(width: 12),
              const Text(
                'Production (US-East)',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 16),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFF10b981).withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: const Color(0xFF10b981).withValues(alpha: 0.2),
                  ),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Color(0xFF10b981),
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'HEALTHY',
                      style: TextStyle(
                        color: Color(0xFF10b981),
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              OutlinedButton.icon(
                onPressed: () {},
                icon: const Icon(LucideIcons.history, size: 16),
                label: const Text('Deploy History'),
              ),
              const SizedBox(width: 12),
              ElevatedButton.icon(
                onPressed: () {},
                icon: const Icon(LucideIcons.rocket, size: 16),
                label: const Text('Deploy'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppTheme.primary,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildResourceUsageSection({required bool isDesktop}) {
    final cards = [
      _buildUsageCard(
        title: 'CPU USAGE',
        value: '42%',
        icon: LucideIcons.cpu,
        color: Colors.blue,
        chartData: [0.3, 0.4, 0.35, 0.5, 0.42], // Simplified sparkline data
      ),
      _buildUsageCard(
        title: 'MEMORY',
        value: '2.4 GB',
        icon: LucideIcons
            .server, // Changed from microchip to server to remain safe
        color: Colors.purple,
        chartData: [0.6, 0.65, 0.62, 0.68, 0.7],
      ),
      _buildUsageCard(
        title: 'REQUESTS/SEC',
        value: '1,240',
        icon: LucideIcons.globe,
        color: const Color(0xFF10b981),
        chartData: [0.4, 0.5, 0.8, 0.7, 0.6],
      ),
    ];

    if (isDesktop) {
      return Row(
        children: [
          Expanded(child: cards[0]),
          const SizedBox(width: 16),
          Expanded(child: cards[1]),
          const SizedBox(width: 16),
          Expanded(child: cards[2]),
        ],
      );
    } else {
      return Column(
        children: cards
            .map(
              (c) =>
                  Padding(padding: const EdgeInsets.only(bottom: 16), child: c),
            )
            .toList(),
      );
    }
  }

  Widget _buildUsageCard({
    required String title,
    required String value,
    required IconData icon,
    required Color color,
    required List<double> chartData,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
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
                  color: AppTheme.textMuted,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              Icon(icon, size: 16, color: AppTheme.textMuted),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            value,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 40,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: chartData.map((d) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: FractionallySizedBox(
                      heightFactor: d,
                      child: Container(
                        decoration: BoxDecoration(
                          color: color.withValues(alpha: 0.5),
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainContent({required bool isDesktop}) {
    final leftColumn = Column(
      children: [
        _buildScalingPolicyCard(),
        const SizedBox(height: 24),
        _buildHealthChecksCard(),
      ],
    );

    final rightColumn = _buildEnvVarsCard();

    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 5, child: leftColumn), // 5/8 width
          const SizedBox(width: 24),
          Expanded(flex: 3, child: rightColumn), // 3/8 width
        ],
      );
    } else {
      return Column(
        children: [leftColumn, const SizedBox(height: 24), rightColumn],
      );
    }
  }

  Widget _buildScalingPolicyCard() {
    return _buildCard(
      title: 'Auto-Scaling Policy',
      icon: LucideIcons.barChart2,
      child: Column(
        children: [
          _buildSliderControl(
            'Min Instances',
            _minInstances,
            1,
            5,
            (val) => setState(() => _minInstances = val),
            'Keep at least this instances running',
          ),
          const Divider(height: 32, color: AppTheme.surfaceHighlight),
          _buildSliderControl(
            'Max Instances',
            _maxInstances,
            5,
            20,
            (val) => setState(() => _maxInstances = val),
            'Burst limit for high traffic',
          ),
          const Divider(height: 32, color: AppTheme.surfaceHighlight),
          _buildSliderControl(
            'Target CPU Usage',
            _targetCpu,
            40,
            90,
            (val) => setState(() => _targetCpu = val),
            'Scale out when avg CPU exceeds this %',
            isPercentage: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSliderControl(
    String label,
    double value,
    double min,
    double max,
    ValueChanged<double> onChanged,
    String helpText, {
    bool isPercentage = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
            Text(
              isPercentage ? '${value.round()}%' : value.round().toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                color: AppTheme.primary,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: AppTheme.primary,
            inactiveTrackColor: AppTheme.surfaceHighlight,
            thumbColor: AppTheme.primary,
            overlayColor: AppTheme.primary.withValues(alpha: 0.1),
          ),
          child: Slider(
            value: value,
            min: min,
            max: max,
            divisions: (max - min).toInt(),
            onChanged: onChanged,
          ),
        ),
        Text(
          helpText,
          style: const TextStyle(color: AppTheme.textMuted, fontSize: 12),
        ),
      ],
    );
  }

  Widget _buildEnvVarsCard() {
    return _buildCard(
      title: 'Environment Variables',
      icon: LucideIcons.key,
      child: Column(
        children: [
          ..._envVars.map(
            (env) => Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          env['key']!,
                          style: const TextStyle(
                            fontFamily: 'monospace',
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          env['isSecret'] == 'true'
                              ? '••••••••••••••••'
                              : env['value']!,
                          style: const TextStyle(
                            fontFamily: 'monospace',
                            color: AppTheme.textMuted,
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: const Icon(
                      LucideIcons.copy,
                      size: 14,
                      color: AppTheme.textMuted,
                    ),
                    onPressed: () {},
                    tooltip: 'Copy Value',
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          OutlinedButton.icon(
            onPressed: () {},
            icon: const Icon(LucideIcons.plus, size: 14),
            label: const Text('Add Variable'),
            style: OutlinedButton.styleFrom(
              minimumSize: const Size(double.infinity, 44),
              side: const BorderSide(color: AppTheme.surfaceHighlight),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildHealthChecksCard() {
    return _buildCard(
      title: 'Health Checks',
      icon: LucideIcons.heart,
      child: Column(
        children: [
          _buildHealthItem('Database Connection', true, '12ms latency'),
          const Divider(height: 24, color: AppTheme.surfaceHighlight),
          _buildHealthItem('Redis Cache', true, '2ms latency'),
          const Divider(height: 24, color: AppTheme.surfaceHighlight),
          _buildHealthItem('External API Gateway', true, '142ms latency'),
          const Divider(height: 24, color: AppTheme.surfaceHighlight),
          _buildHealthItem(
            'Disk Space',
            false,
            '92% used (WARNING)',
            isWarning: true,
          ),
        ],
      ),
    );
  }

  Widget _buildHealthItem(
    String label,
    bool isHealthy,
    String stats, {
    bool isWarning = false,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              isWarning ? LucideIcons.alertTriangle : LucideIcons.checkCircle,
              color: isWarning ? Colors.orange : const Color(0xFF10b981),
              size: 18,
            ),
            const SizedBox(width: 12),
            Text(label, style: const TextStyle(fontWeight: FontWeight.w500)),
          ],
        ),
        Text(
          stats,
          style: TextStyle(
            color: isWarning ? Colors.orange : AppTheme.textMuted,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  // Generic Card Wrapper
  Widget _buildCard({
    required String title,
    required IconData icon,
    required Widget child,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceHighlight),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Icon(icon, size: 20, color: AppTheme.textMuted),
                const SizedBox(width: 12),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const Divider(height: 1, color: AppTheme.surfaceHighlight),
          Padding(padding: const EdgeInsets.all(24), child: child),
        ],
      ),
    );
  }
}
