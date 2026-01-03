import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';

class LiveStreamScreen extends StatelessWidget {
  const LiveStreamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;

        return Scaffold(
          backgroundColor: AppTheme.background,
          body: Column(
            children: [
              _Header(isDesktop: isDesktop),
              Expanded(
                child: SingleChildScrollView(
                  padding: EdgeInsets.all(isDesktop ? 24 : 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _StatsRow(),
                      const SizedBox(height: 24),
                      const _FilterBar(),
                      const SizedBox(height: 24),
                      _EventGrid(isDesktop: isDesktop),
                    ],
                  ),
                ),
              ),
            ],
          ),
          bottomNavigationBar: isDesktop
              ? null
              : BottomNavigationBar(
                  backgroundColor: const Color(0xFF111722),
                  selectedItemColor: AppTheme.primary,
                  unselectedItemColor: const Color(0xFF94A3B8),
                  type: BottomNavigationBarType.fixed,
                  currentIndex: 1,
                  onTap: (index) {
                    if (index == 0) {
                      context.go(AppRoutes.dashboard);
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
                      icon: Icon(Icons.monitor_heart),
                      label: 'Live',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.dns),
                      label: 'Nodes',
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(Icons.settings),
                      label: 'Settings',
                    ),
                  ],
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
      height: 64,
      padding: EdgeInsets.symmetric(horizontal: isDesktop ? 24 : 16),
      decoration: BoxDecoration(
        color: const Color(0xFF111722).withOpacity(0.95),
        border: const Border(bottom: BorderSide(color: Color(0xFF1E293B))),
      ),
      child: Row(
        children: [
          if (!isDesktop)
            IconButton(
              icon: const Icon(Icons.arrow_back, color: Color(0xFF94A3B8)),
              onPressed: () => context.pop(),
            ),
          Row(
            children: [
              const Text(
                'Real-time Health Stream',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 12),
              _PulsingDot(),
            ],
          ),
          if (isDesktop) ...[
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(4),
                border: Border.all(color: Colors.white.withOpacity(0.1)),
              ),
              child: const Text(
                'OPS-PLATFORM-ALPHA',
                style: TextStyle(
                  color: Color(0xFF94A3B8),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ],
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
                  Icon(Icons.search, color: Color(0xFF64748B), size: 18),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Filter stream...',
                      style: TextStyle(color: Color(0xFF64748B), fontSize: 14),
                    ),
                  ),
                ],
              ),
            ),
          const SizedBox(width: 16),
          Container(width: 1, height: 24, color: Colors.white.withOpacity(0.1)),
          const SizedBox(width: 16),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(Icons.pause, color: Colors.black, size: 18),
            label: Text(
              isDesktop ? 'Pause Stream' : '',
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primary,
              padding: EdgeInsets.symmetric(
                horizontal: isDesktop ? 16 : 12,
                vertical: 10,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
              elevation: 4,
              shadowColor: AppTheme.primary.withOpacity(0.2),
            ),
          ),
        ],
      ),
    );
  }
}

class _PulsingDot extends StatefulWidget {
  @override
  State<_PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<_PulsingDot>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 12,
      height: 12,
      child: Stack(
        children: [
          AnimatedBuilder(
            animation: _controller,
            builder: (_, __) => Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                color: AppTheme.primary.withOpacity(
                  0.75 * (1 - _controller.value),
                ),
                shape: BoxShape.circle,
              ),
            ),
          ),
          Center(
            child: Container(
              width: 12,
              height: 12,
              decoration: const BoxDecoration(
                color: AppTheme.primary,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _StatsRow extends StatelessWidget {
  const _StatsRow();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isSmall = constraints.maxWidth < 600;
        final cardWidth = isSmall
            ? (constraints.maxWidth - 16) / 2
            : (constraints.maxWidth - 48) / 4;
        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            _StatCard(
              label: 'Sys Uptime',
              value: '98.9%',
              trend: '+0.1%',
              trendUp: true,
              icon: Icons.dns,
              width: cardWidth,
            ),
            _StatCard(
              label: 'Active Nodes',
              value: '124',
              trend: '+2 New',
              trendUp: true,
              icon: Icons.hub,
              progress: 0.85,
              width: cardWidth,
            ),
            _StatCard(
              label: 'Error Rate',
              value: '0.02%',
              trend: '-0.01%',
              trendUp: false,
              icon: Icons.bug_report,
              progress: 0.05,
              color: AppTheme.success,
              width: cardWidth,
            ),
            _StatCard(
              label: 'Latency',
              value: '345ms',
              trend: 'Spiking',
              trendUp: null,
              icon: Icons.speed,
              progress: 0.75,
              color: const Color(0xFFF59E0B),
              isWarning: true,
              width: cardWidth,
            ),
          ],
        );
      },
    );
  }
}

class _StatCard extends StatelessWidget {
  final String label;
  final String value;
  final String trend;
  final bool? trendUp;
  final IconData icon;
  final double? progress;
  final Color? color;
  final bool isWarning;
  final double? width;

  const _StatCard({
    required this.label,
    required this.value,
    required this.trend,
    this.trendUp,
    required this.icon,
    this.progress,
    this.color,
    this.isWarning = false,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final primaryColor = color ?? AppTheme.success;
    return Container(
      width: width,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isWarning
            ? const Color(0xFFF59E0B).withOpacity(0.05)
            : const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isWarning
              ? const Color(0xFFF59E0B).withOpacity(0.2)
              : Colors.white.withOpacity(0.05),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label.toUpperCase(),
                style: TextStyle(
                  color: isWarning
                      ? const Color(0xFFF59E0B)
                      : const Color(0xFF94A3B8),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5,
                ),
              ),
              Icon(
                icon,
                color: isWarning
                    ? const Color(0xFFF59E0B).withOpacity(0.5)
                    : const Color(0xFF334155),
                size: 20,
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                value,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'monospace',
                  letterSpacing: -1,
                ),
              ),
              const SizedBox(width: 8),
              Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Row(
                  children: [
                    if (trendUp != null)
                      Icon(
                        trendUp! ? Icons.arrow_upward : Icons.arrow_downward,
                        color: primaryColor,
                        size: 14,
                      ),
                    if (trendUp == null)
                      Icon(
                        Icons.warning,
                        color: const Color(0xFFF59E0B),
                        size: 14,
                      ),
                    const SizedBox(width: 2),
                    Text(
                      trend,
                      style: TextStyle(
                        color: trendUp == null
                            ? const Color(0xFFF59E0B)
                            : primaryColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          if (progress != null) ...[
            const SizedBox(height: 12),
            SizedBox(
              height: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: LinearProgressIndicator(
                  value: progress!,
                  backgroundColor: const Color(0xFF334155),
                  valueColor: AlwaysStoppedAnimation(primaryColor),
                ),
              ),
            ),
          ] else ...[
            const SizedBox(height: 12),
            Row(
              children: List.generate(
                5,
                (i) => Expanded(
                  child: Container(
                    height: 4,
                    margin: EdgeInsets.only(right: i < 4 ? 2 : 0),
                    decoration: BoxDecoration(
                      color: i < 4
                          ? primaryColor
                          : primaryColor.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(100),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _FilterBar extends StatelessWidget {
  const _FilterBar();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: const Color(0xFF1E293B),
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.white.withOpacity(0.05)),
          ),
          child: Row(
            children: [
              _FilterTab(label: 'All Events', isActive: true),
              _FilterTab(label: 'Critical', dotColor: const Color(0xFFEF4444)),
              _FilterTab(label: 'Warnings', dotColor: const Color(0xFFF59E0B)),
              _FilterTab(label: 'Info', dotColor: const Color(0xFF3B82F6)),
            ],
          ),
        ),
        Row(
          children: [
            Text(
              'Last update: ',
              style: TextStyle(
                color: const Color(0xFF94A3B8),
                fontSize: 12,
                fontFamily: 'monospace',
              ),
            ),
            const Text(
              'Just now',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'monospace',
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(4)),
              child: const Icon(
                Icons.refresh,
                color: Color(0xFF64748B),
                size: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _FilterTab extends StatelessWidget {
  final String label;
  final bool isActive;
  final Color? dotColor;

  const _FilterTab({required this.label, this.isActive = false, this.dotColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isActive ? Colors.white.withOpacity(0.1) : Colors.transparent,
        borderRadius: BorderRadius.circular(4),
        boxShadow: isActive
            ? [BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 4)]
            : null,
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
          Text(
            label.toUpperCase(),
            style: TextStyle(
              color: isActive ? Colors.white : const Color(0xFF94A3B8),
              fontSize: 10,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

class _EventGrid extends StatelessWidget {
  final bool isDesktop;
  const _EventGrid({required this.isDesktop});

  @override
  Widget build(BuildContext context) {
    final events = [
      _EventData(
        type: EventType.critical,
        time: '14:05:01.42',
        title: 'Database Connection Timeout',
        description:
            'Connection to shard 04 timed out after 5000ms. Retrying connection pool...',
        tags: ['Database-Shard-04', 'us-east-1a'],
        showActions: true,
      ),
      _EventData(
        type: EventType.warning,
        time: '14:04:55.10',
        title: 'Latency Spike Detected',
        description: '95th percentile latency exceeded 300ms threshold.',
        tags: ['API-Gateway'],
      ),
      _EventData(
        type: EventType.info,
        time: '14:04:22.05',
        title: 'Deployment Successful',
        description: 'v2.4.1 deployed to 12 instances. Health checks passing.',
        tags: ['Auth-Service'],
      ),
      _EventData(
        type: EventType.system,
        time: '14:04:10.00',
        title: 'Daily Cleanup Completed',
        description: 'Temp files removed. 4.2GB space reclaimed.',
        tags: ['System'],
      ),
      _EventData(
        type: EventType.system,
        time: '14:03:55.88',
        title: 'Scale Down Event',
        description: 'Worker nodes scaled from 15 to 12.',
      ),
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        int crossAxisCount = 1;
        if (constraints.maxWidth >= 1400)
          crossAxisCount = 4;
        else if (constraints.maxWidth >= 1000)
          crossAxisCount = 3;
        else if (constraints.maxWidth >= 600)
          crossAxisCount = 2;

        return Wrap(
          spacing: 16,
          runSpacing: 16,
          children: [
            ...events.map(
              (e) => SizedBox(
                width:
                    (constraints.maxWidth - (crossAxisCount - 1) * 16) /
                    crossAxisCount,
                child: _EventCard(data: e),
              ),
            ),
            SizedBox(
              width:
                  (constraints.maxWidth - (crossAxisCount - 1) * 16) /
                  crossAxisCount,
              child: _ListeningCard(),
            ),
          ],
        );
      },
    );
  }
}

enum EventType { critical, warning, info, system }

class _EventData {
  final EventType type;
  final String time;
  final String title;
  final String description;
  final List<String>? tags;
  final bool showActions;

  _EventData({
    required this.type,
    required this.time,
    required this.title,
    required this.description,
    this.tags,
    this.showActions = false,
  });
}

class _EventCard extends StatelessWidget {
  final _EventData data;
  const _EventCard({required this.data});

  @override
  Widget build(BuildContext context) {
    Color color;
    IconData icon;
    String label;
    switch (data.type) {
      case EventType.critical:
        color = const Color(0xFFEF4444);
        icon = Icons.error;
        label = 'Critical';
        break;
      case EventType.warning:
        color = const Color(0xFFF59E0B);
        icon = Icons.warning;
        label = 'Warning';
        break;
      case EventType.info:
        color = const Color(0xFF3B82F6);
        icon = Icons.info;
        label = 'Deployment';
        break;
      case EventType.system:
        color = const Color(0xFF64748B);
        icon = Icons.schedule;
        label = data.title.contains('Scale') ? 'Auto Scale' : 'Cron Job';
        break;
    }

    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(width: 4, color: color),
            Expanded(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: color.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: color.withOpacity(0.2),
                                ),
                              ),
                              child: Row(
                                children: [
                                  Icon(icon, color: color, size: 12),
                                  const SizedBox(width: 4),
                                  Text(
                                    label.toUpperCase(),
                                    style: TextStyle(
                                      color: color,
                                      fontSize: 10,
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 0.5,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Text(
                              data.time,
                              style: const TextStyle(
                                color: Color(0xFF64748B),
                                fontSize: 12,
                                fontFamily: 'monospace',
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Text(
                          data.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        if (data.tags != null) ...[
                          const SizedBox(height: 12),
                          Wrap(
                            spacing: 8,
                            children: data.tags!
                                .map(
                                  (t) => Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8,
                                      vertical: 4,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.4),
                                      borderRadius: BorderRadius.circular(4),
                                      border: Border.all(
                                        color: Colors.white.withOpacity(0.05),
                                      ),
                                    ),
                                    child: Text(
                                      t.toUpperCase(),
                                      style: const TextStyle(
                                        color: Color(0xFFCBD5E1),
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                      ),
                                    ),
                                  ),
                                )
                                .toList(),
                          ),
                        ],
                        const SizedBox(height: 12),
                        Text(
                          data.description,
                          style: const TextStyle(
                            color: Color(0xFFCBD5E1),
                            fontSize: 14,
                            height: 1.5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (data.showActions)
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.1),
                        border: const Border(
                          top: BorderSide(color: Color(0x0DFFFFFF)),
                        ),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.05),
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(
                                  color: Colors.white.withOpacity(0.1),
                                ),
                              ),
                              child: const Center(
                                child: Text(
                                  'Investigate',
                                  style: TextStyle(
                                    color: Color(0xFFCBD5E1),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8),
                              child: const Center(
                                child: Text(
                                  'Logs',
                                  style: TextStyle(
                                    color: Color(0xFF94A3B8),
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ListeningCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white.withOpacity(0.05),
          width: 2,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: 28,
              height: 28,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor: AlwaysStoppedAnimation(const Color(0xFF64748B)),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'LISTENING...',
              style: TextStyle(
                color: Color(0xFF64748B),
                fontSize: 10,
                fontWeight: FontWeight.bold,
                letterSpacing: 2,
                fontFamily: 'monospace',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
