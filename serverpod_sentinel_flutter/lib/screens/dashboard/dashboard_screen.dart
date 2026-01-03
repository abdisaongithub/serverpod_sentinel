import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'dart:math' as math;
import '../../theme/app_theme.dart';
import '../../routes.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;

        return Scaffold(
          backgroundColor: const Color(0xFF0B1019),
          body: Column(
            children: [
              _Header(isDesktop: isDesktop),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(isDesktop ? 32 : 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _TopRow(isDesktop: isDesktop),
                      const SizedBox(height: 24),
                      const _EnvironmentStatusSection(),
                      const SizedBox(height: 24),
                      _BottomSection(isDesktop: isDesktop),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: isDesktop
              ? null
              : Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFF161E2D),
                    border: Border(top: BorderSide(color: Color(0xFF2D3748))),
                  ),
                  child: BottomNavigationBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    type: BottomNavigationBarType.fixed,
                    selectedItemColor: AppTheme.primary,
                    unselectedItemColor: const Color(0xFF94A3B8),
                    currentIndex: _currentIndex,
                    onTap: (index) {
                      if (index == _currentIndex) return;
                      setState(() => _currentIndex = index);
                      if (index == 1) {
                        context.go(AppRoutes.incidents);
                      } else if (index == 2) {
                        context.go(AppRoutes.serviceRegistry);
                      } else if (index == 3) {
                        context.go(AppRoutes.settings);
                      }
                    },
                    items: const [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.dashboard),
                        label: 'Dashboard',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.notifications),
                        label: 'Alerts',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.dns),
                        label: 'Infrastructure',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.settings),
                        label: 'Settings',
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  final bool isDesktop;
  const _Header({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF161E2D).withOpacity(0.8),
        border: const Border(bottom: BorderSide(color: Color(0xFF2D3748))),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: const [
                  Text(
                    'Operations',
                    style: TextStyle(color: Color(0xFF94A3B8), fontSize: 14),
                  ),
                  Text(
                    ' / ',
                    style: TextStyle(color: Color(0xFF64748B), fontSize: 14),
                  ),
                  Text(
                    'Main Dashboard',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              const Text(
                'System Overview',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const Spacer(),
          if (isDesktop)
            Container(
              width: 256,
              height: 40,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: const Color(0xFF1E293B),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: const [
                  Icon(Icons.search, color: Color(0xFF64748B), size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Search services, logs...',
                      style: TextStyle(color: Color(0xFF64748B), fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(width: 16),
          Stack(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF2D3748)),
                ),
                child: const Icon(
                  Icons.notifications_outlined,
                  color: Color(0xFFCBD5E1),
                  size: 20,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: const Color(0xFFEF4444),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: const Color(0xFF161E2D),
                      width: 2,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TopRow extends StatelessWidget {
  final bool isDesktop;
  const _TopRow({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: _HealthCard()),
          const SizedBox(width: 24),
          const Expanded(flex: 1, child: _CriticalAlertCard()),
        ],
      );
    } else {
      return Column(
        children: [
          _HealthCard(),
          const SizedBox(height: 16),
          const _CriticalAlertCard(),
        ],
      );
    }
  }
}

class _HealthCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF161E2D),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF2D3748)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 128,
            height: 128,
            child: CustomPaint(
              painter: _HealthRingPainter(0.992),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      '99.2%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'HEALTH',
                      style: TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 32),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Text(
                      'Overall System Health',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF22C55E).withOpacity(0.1),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Row(
                        children: const [
                          Icon(
                            Icons.check_circle,
                            color: Color(0xFF22C55E),
                            size: 14,
                          ),
                          SizedBox(width: 4),
                          Text(
                            'Operational',
                            style: TextStyle(
                              color: Color(0xFF22C55E),
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'All core systems are functioning within normal parameters. Real-time monitoring enabled across 142 services.',
                  style: TextStyle(
                    color: Color(0xFF94A3B8),
                    fontSize: 14,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 16),
                Wrap(
                  spacing: 16,
                  children: [
                    _StatChip(label: 'Uptime', value: '14d 2h'),
                    _StatChip(label: 'Avg Latency', value: '24ms'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HealthRingPainter extends CustomPainter {
  final double progress;
  _HealthRingPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 8;
    final strokeWidth = 8.0;

    final bgPaint = Paint()
      ..color = const Color(0xFF1E293B)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawCircle(center, radius, bgPaint);

    final progressPaint = Paint()
      ..color = const Color(0xFF22C55E)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * progress,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _StatChip extends StatelessWidget {
  final String label;
  final String value;
  const _StatChip({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: const Color(0xFF2D3748)),
      ),
      child: Row(
        children: [
          Text(
            label.toUpperCase(),
            style: const TextStyle(
              color: Color(0xFF64748B),
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class _CriticalAlertCard extends StatelessWidget {
  const _CriticalAlertCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            const Color(0xFF7F1D1D).withOpacity(0.9),
            const Color(0xFF101622),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFEF4444).withOpacity(0.3)),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFEF4444).withOpacity(0.15),
            blurRadius: 30,
            spreadRadius: 2,
          ),
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.4),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.warning_amber, color: Color(0xFFEF4444), size: 20),
                  SizedBox(width: 8),
                  Text(
                    'CRITICAL ALERT',
                    style: TextStyle(
                      color: Color(0xFFEF4444),
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1,
                    ),
                  ),
                ],
              ),
              const Text(
                'INC-2023-882',
                style: TextStyle(
                  color: Color(0xFFEF4444),
                  fontSize: 11,
                  fontFamily: 'monospace',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Text(
            '3 Active Incidents',
            style: TextStyle(
              color: Colors.white,
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Immediate attention required in API Gateway and User Auth service regions.',
            style: TextStyle(color: Color(0xFFCBD5E1), fontSize: 14),
          ),
          const SizedBox(height: 24),
          Row(
            children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () => context.go(AppRoutes.incidents),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEF4444),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    elevation: 4,
                    shadowColor: const Color(0xFFEF4444).withOpacity(0.2),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'View Incidents',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(width: 8),
                      Icon(Icons.arrow_forward, size: 18),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.more_horiz, color: Colors.white),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _EnvironmentStatusSection extends StatelessWidget {
  const _EnvironmentStatusSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'ENVIRONMENT STATUS',
              style: TextStyle(
                color: Color(0xFF94A3B8),
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'View all envs',
                style: TextStyle(color: AppTheme.primary, fontSize: 12),
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            final isSmall = constraints.maxWidth < 700;
            return isSmall
                ? Column(
                    children: [
                      _EnvCard(
                        name: 'Production',
                        region: 'us-east-1',
                        icon: Icons.rocket_launch,
                        iconColor: const Color(0xFF6366F1),
                        status: 'Healthy',
                        statusColor: const Color(0xFF22C55E),
                        version: 'v2.4.0',
                      ),
                      const SizedBox(height: 16),
                      _EnvCard(
                        name: 'Staging',
                        region: 'CI/CD Active',
                        icon: Icons.science,
                        iconColor: const Color(0xFF3B82F6),
                        status: 'Building',
                        statusColor: const Color(0xFF3B82F6),
                        version: '#8291 running',
                      ),
                      const SizedBox(height: 16),
                      _EnvCard(
                        name: 'Development',
                        region: 'High Latency',
                        icon: Icons.code,
                        iconColor: const Color(0xFFF59E0B),
                        status: 'Degraded',
                        statusColor: const Color(0xFFF59E0B),
                        version: 'Load > 85%',
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        child: _EnvCard(
                          name: 'Production',
                          region: 'us-east-1',
                          icon: Icons.rocket_launch,
                          iconColor: const Color(0xFF6366F1),
                          status: 'Healthy',
                          statusColor: const Color(0xFF22C55E),
                          version: 'v2.4.0',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _EnvCard(
                          name: 'Staging',
                          region: 'CI/CD Active',
                          icon: Icons.science,
                          iconColor: const Color(0xFF3B82F6),
                          status: 'Building',
                          statusColor: const Color(0xFF3B82F6),
                          version: '#8291 running',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _EnvCard(
                          name: 'Development',
                          region: 'High Latency',
                          icon: Icons.code,
                          iconColor: const Color(0xFFF59E0B),
                          status: 'Degraded',
                          statusColor: const Color(0xFFF59E0B),
                          version: 'Load > 85%',
                        ),
                      ),
                    ],
                  );
          },
        ),
      ],
    );
  }
}

class _EnvCard extends StatelessWidget {
  final String name;
  final String region;
  final IconData icon;
  final Color iconColor;
  final String status;
  final Color statusColor;
  final String version;

  const _EnvCard({
    required this.name,
    required this.region,
    required this.icon,
    required this.iconColor,
    required this.status,
    required this.statusColor,
    required this.version,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF161E2D),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2D3748)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              color: iconColor.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 24),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Icon(
                      status == 'Healthy' ? Icons.public : Icons.speed,
                      size: 14,
                      color: const Color(0xFF94A3B8),
                    ),
                    const SizedBox(width: 4),
                    Text(
                      region,
                      style: const TextStyle(
                        color: Color(0xFF94A3B8),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  if (status == 'Healthy') ...[
                    Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: statusColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                  ],
                  Text(
                    status,
                    style: TextStyle(
                      color: statusColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Text(
                version,
                style: const TextStyle(color: Color(0xFF64748B), fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _BottomSection extends StatelessWidget {
  final bool isDesktop;
  const _BottomSection({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    if (isDesktop) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(flex: 2, child: _ServicesAtRiskSection()),
          const SizedBox(width: 24),
          const Expanded(flex: 1, child: _ActivityFeed()),
        ],
      );
    } else {
      return Column(
        children: [
          _ServicesAtRiskSection(),
          const SizedBox(height: 24),
          const _ActivityFeed(),
        ],
      );
    }
  }
}

class _ServicesAtRiskSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'SERVICES AT RISK',
          style: TextStyle(
            color: Color(0xFF94A3B8),
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 16),
        LayoutBuilder(
          builder: (context, constraints) {
            final isSmall = constraints.maxWidth < 500;
            return isSmall
                ? Column(
                    children: [
                      _RiskCard(
                        name: 'Main DB Cluster',
                        subtitle: 'db-prod-primary',
                        status: 'High Load',
                        statusColor: const Color(0xFFF59E0B),
                        value: '88%',
                        unit: 'CPU Usage',
                        secondary: '12.4k',
                        secondaryUnit: 'Ops/Sec',
                      ),
                      const SizedBox(height: 16),
                      _RiskCard(
                        name: 'Payment Gateway API',
                        subtitle: 'api-v2-payments',
                        status: 'Elevated Errors',
                        statusColor: const Color(0xFFEF4444),
                        value: '4.2%',
                        unit: 'Error Rate (5xx)',
                        secondary: '320ms',
                        secondaryUnit: 'P99 Latency',
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Expanded(
                        child: _RiskCard(
                          name: 'Main DB Cluster',
                          subtitle: 'db-prod-primary',
                          status: 'High Load',
                          statusColor: const Color(0xFFF59E0B),
                          value: '88%',
                          unit: 'CPU Usage',
                          secondary: '12.4k',
                          secondaryUnit: 'Ops/Sec',
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: _RiskCard(
                          name: 'Payment Gateway API',
                          subtitle: 'api-v2-payments',
                          status: 'Elevated Errors',
                          statusColor: const Color(0xFFEF4444),
                          value: '4.2%',
                          unit: 'Error Rate (5xx)',
                          secondary: '320ms',
                          secondaryUnit: 'P99 Latency',
                        ),
                      ),
                    ],
                  );
          },
        ),
      ],
    );
  }
}

class _RiskCard extends StatelessWidget {
  final String name;
  final String subtitle;
  final String status;
  final Color statusColor;
  final String value;
  final String unit;
  final String secondary;
  final String secondaryUnit;

  const _RiskCard({
    required this.name,
    required this.subtitle,
    required this.status,
    required this.statusColor,
    required this.value,
    required this.unit,
    required this.secondary,
    required this.secondaryUnit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF161E2D),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFF2D3748)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: const Color(0xFF1E293B),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(
                  statusColor == const Color(0xFFF59E0B)
                      ? Icons.storage
                      : Icons.api,
                  color: statusColor,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  status,
                  style: TextStyle(
                    color: statusColor,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    unit.toUpperCase(),
                    style: const TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    secondary,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    secondaryUnit.toUpperCase(),
                    style: const TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 16),
          _MiniBarChart(color: statusColor),
        ],
      ),
    );
  }
}

class _MiniBarChart extends StatelessWidget {
  final Color color;
  const _MiniBarChart({required this.color});

  @override
  Widget build(BuildContext context) {
    final heights = [0.4, 0.6, 0.5, 0.8, 0.7, 0.9, 0.85, 0.75];
    return SizedBox(
      height: 48,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: heights
            .map(
              (h) => Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 2),
                  decoration: BoxDecoration(
                    color: color.withOpacity(h < 0.8 ? 0.3 : 1.0),
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(2),
                    ),
                  ),
                  height: 48 * h,
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

class _ActivityFeed extends StatelessWidget {
  const _ActivityFeed();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Text(
              'LIVE ACTIVITY FEED',
              style: TextStyle(
                color: Color(0xFF94A3B8),
                fontSize: 12,
                fontWeight: FontWeight.bold,
                letterSpacing: 1,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: AppTheme.primary,
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF161E2D),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xFF2D3748)),
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF1E293B),
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                ),
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Today, Oct 24',
                    style: TextStyle(
                      color: Color(0xFF64748B),
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _ActivityItem(
                      avatar: true,
                      text: 'Sarah Jenkins initiated rollback on',
                      tag: 'Production',
                      tagColor: const Color(0xFF6366F1),
                      time: '10:42 AM',
                      detail: 'v2.4.1 → v2.4.0',
                    ),
                    _ActivityItem(
                      icon: Icons.bolt,
                      iconBgColor: const Color(0xFFEF4444),
                      text: 'CPU usage spike detected on',
                      tag: 'Node-4',
                      tagColor: const Color(0xFF64748B),
                      time: '10:40 AM',
                      detail: 'Alert Rule #829',
                      detailColor: const Color(0xFFEF4444),
                    ),
                    _ActivityItem(
                      icon: Icons.cloud_done,
                      iconBgColor: const Color(0xFF22C55E),
                      text: 'Auto-scaling group stabilized',
                      time: '10:35 AM',
                      detail: 'Capacity at 12 instances',
                      detailColor: const Color(0xFF22C55E),
                    ),
                    _ActivityItem(
                      icon: Icons.terminal,
                      iconBgColor: const Color(0xFF64748B),
                      text: 'Scheduled database backup completed',
                      time: '09:15 AM',
                      detail: '45GB snapshot created',
                      isLast: true,
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 12),
                decoration: const BoxDecoration(
                  color: Color(0xFF1E293B),
                  border: Border(top: BorderSide(color: Color(0xFF2D3748))),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(12),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'View all activity history',
                    style: TextStyle(
                      color: AppTheme.primary,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final bool avatar;
  final IconData? icon;
  final Color? iconBgColor;
  final String text;
  final String? tag;
  final Color? tagColor;
  final String time;
  final String? detail;
  final Color? detailColor;
  final bool isLast;

  const _ActivityItem({
    this.avatar = false,
    this.icon,
    this.iconBgColor,
    required this.text,
    this.tag,
    this.tagColor,
    required this.time,
    this.detail,
    this.detailColor,
    this.isLast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color:
                      iconBgColor?.withOpacity(0.1) ?? const Color(0xFF1E293B),
                  shape: BoxShape.circle,
                ),
                child: avatar
                    ? const Icon(
                        Icons.person,
                        color: Color(0xFF94A3B8),
                        size: 18,
                      )
                    : Icon(icon, color: iconBgColor, size: 16),
              ),
              if (!isLast)
                Container(width: 2, height: 24, color: const Color(0xFF1E293B)),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    style: const TextStyle(color: Colors.white, fontSize: 14),
                    children: [
                      TextSpan(text: text),
                      if (tag != null)
                        WidgetSpan(
                          child: Container(
                            margin: const EdgeInsets.only(left: 4),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 6,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color:
                                  tagColor?.withOpacity(0.1) ??
                                  Colors.transparent,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              tag!,
                              style: TextStyle(
                                color: tagColor,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      time,
                      style: const TextStyle(
                        color: Color(0xFF64748B),
                        fontSize: 12,
                      ),
                    ),
                    if (detail != null) ...[
                      const Text(
                        ' • ',
                        style: TextStyle(color: Color(0xFF475569)),
                      ),
                      Text(
                        detail!,
                        style: TextStyle(
                          color: detailColor ?? const Color(0xFF64748B),
                          fontSize: 12,
                          fontFamily: detail!.contains('→')
                              ? 'monospace'
                              : null,
                        ),
                      ),
                    ],
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
