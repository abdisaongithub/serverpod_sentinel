import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import '../dashboard/dashboard_screen.dart';
import '../registry/service_registry_screen.dart';
import 'incident_detail_screen.dart';

class IncidentsScreen extends StatefulWidget {
  const IncidentsScreen({super.key});

  @override
  State<IncidentsScreen> createState() => _IncidentsScreenState();
}

class _IncidentsScreenState extends State<IncidentsScreen> {
  int _selectedIndex = 1; // Incidents tab

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1200),
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundImage: NetworkImage(
                          'https://i.pravatar.cc/150?img=11',
                        ), // Placeholder
                        radius: 20,
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello, Alex',
                            style: TextStyle(
                              color: AppTheme.textMuted,
                              fontSize: 12,
                            ),
                          ),
                          const Text(
                            'Incidents',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(LucideIcons.search),
                        style: IconButton.styleFrom(
                          backgroundColor: AppTheme.surface,
                          padding: const EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(LucideIcons.plus),
                        style: IconButton.styleFrom(
                          backgroundColor: AppTheme.primary,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.all(12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                // Stat Cards
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      _buildStatCard('ACTIVE', '12', '↑ 2', AppTheme.surface),
                      const SizedBox(width: 12),
                      _buildStatCard(
                        'CRITICAL',
                        '4',
                        '+10%',
                        AppTheme.surfaceHighlight,
                        hasDot: true,
                      ),
                      const SizedBox(width: 12),
                      _buildStatCard('RESOLVED', '48', '+5%', AppTheme.surface),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Filters
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    children: [
                      _buildFilterChip('All', true),
                      const SizedBox(width: 8),
                      _buildFilterChip(
                        'Critical',
                        false,
                        color: AppTheme.error,
                      ),
                      const SizedBox(width: 8),
                      _buildFilterChip('Major', false, color: Colors.orange),
                      const SizedBox(width: 8),
                      _buildFilterChip(
                        'My Team',
                        false,
                        icon: LucideIcons.user,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 24),

                // Ongoing Incidents Title
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'ONGOING INCIDENTS',
                      style: TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),

                // Incident List
                Expanded(
                  child: ListView(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: [
                      _buildIncidentCard(
                        context,
                        id: '#INC-204',
                        priority: 'CRITICAL',
                        title: 'Database Latency Spike',
                        service: 'Payment Service',
                        time: '00:24:12',
                        color: AppTheme.error,
                      ),
                      const SizedBox(height: 16),
                      _buildIncidentCard(
                        context,
                        id: '#INC-203',
                        priority: 'MAJOR',
                        title: 'API 500 Errors',
                        service: 'Auth Service',
                        time: '01:12:45',
                        color: Colors.orange,
                        status: 'Acknowledged',
                        isLocked: true,
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'RESOLVED RECENTLY',
                        style: TextStyle(
                          color: AppTheme.textMuted,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1,
                        ),
                      ),
                      const SizedBox(height: 12),
                      _buildResolvedCard(
                        context,
                        id: '#INC-198',
                        title: 'High Memory Usage',
                        service: 'Image Processor',
                        duration: '45m duration',
                      ),
                      const SizedBox(height: 12),
                      _buildResolvedCard(
                        context,
                        id: '#INC-197',
                        title: 'Frontend Build Failure',
                        service: 'CI/CD Pipeline',
                        duration: '12m duration',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppTheme.background,
        selectedItemColor: AppTheme.primary,
        unselectedItemColor: AppTheme.textMuted,
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const DashboardScreen()),
            );
          } else if (index == 2) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (_) => const ServiceRegistryScreen()),
            );
          }
          // index 1 is this screen
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
    );
  }

  Widget _buildStatCard(
    String label,
    String value,
    String trend,
    Color bgColor, {
    bool hasDot = false,
  }) {
    return Container(
      width: 120,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                label,
                style: const TextStyle(
                  color: AppTheme.textMuted,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (hasDot)
                Container(
                  width: 6,
                  height: 6,
                  decoration: const BoxDecoration(
                    color: AppTheme.error,
                    shape: BoxShape.circle,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Text(
                value,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(width: 8),
              Text(
                trend,
                style: TextStyle(
                  color: trend.contains('↑') || trend.contains('+')
                      ? AppTheme.error
                      : AppTheme.success,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(
    String label,
    bool isSelected, {
    Color? color,
    IconData? icon,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? Colors.white : AppTheme.surface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.surfaceHighlight),
      ),
      child: Row(
        children: [
          if (color != null) ...[
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
            ),
            const SizedBox(width: 8),
          ],
          if (icon != null) ...[
            Icon(icon, size: 14, color: AppTheme.textMuted),
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

  Widget _buildIncidentCard(
    BuildContext context, {
    required String id,
    required String priority,
    required String title,
    required String service,
    required String time,
    required Color color,
    String? status,
    bool isLocked = false,
  }) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => const IncidentDetailScreen()),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.surfaceHighlight),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Left border strip
              Container(
                width: 4,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    bottomLeft: Radius.circular(12),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            id,
                            style: const TextStyle(color: AppTheme.textMuted),
                          ),
                          const SizedBox(width: 8),
                          Icon(
                            LucideIcons.dot,
                            size: 12,
                            color: AppTheme.textMuted,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            priority,
                            style: TextStyle(
                              color: color,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const Spacer(),
                          if (priority == 'CRITICAL')
                            Icon(LucideIcons.alertTriangle, color: color),
                          if (priority == 'MAJOR')
                            Icon(LucideIcons.alertCircle, color: color),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Text(
                        title,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                isLocked
                                    ? LucideIcons.lock
                                    : LucideIcons.layoutGrid,
                                size: 16,
                                color: AppTheme.textMuted,
                              ),
                              const SizedBox(width: 8),
                              Text(
                                service,
                                style: const TextStyle(
                                  color: AppTheme.textMuted,
                                ),
                              ),
                              if (status != null) ...[
                                const SizedBox(width: 12),
                                const Icon(
                                  LucideIcons.checkCircle,
                                  size: 16,
                                  color: Colors.orange,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  status,
                                  style: const TextStyle(color: Colors.orange),
                                ),
                              ],
                            ],
                          ),
                          if (status == null)
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Row(
                                children: [
                                  const Icon(
                                    LucideIcons.clock,
                                    size: 12,
                                    color: AppTheme.error,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    time,
                                    style: const TextStyle(
                                      fontFamily: 'monospace',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          if (status != null)
                            Text(
                              'Active for $time',
                              style: const TextStyle(color: AppTheme.textMuted),
                            ),
                        ],
                      ),
                      if (status == null) ...[
                        const SizedBox(height: 16),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: AppTheme.background,
                                  side: const BorderSide(
                                    color: AppTheme.surfaceHighlight,
                                  ),
                                ),
                                child: const Text('Acknowledge'),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppTheme.primary,
                                ),
                                child: const Text('Resolve'),
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
        ),
      ),
    );
  }

  Widget _buildResolvedCard(
    BuildContext context, {
    required String id,
    required String title,
    required String service,
    required String duration,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceHighlight),
      ),
      child: IntrinsicHeight(
        child: Row(
          children: [
            Container(
              width: 4,
              height: double.infinity,
              decoration: BoxDecoration(
                color: AppTheme.success,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        id,
                        style: const TextStyle(color: AppTheme.textMuted),
                      ),
                      const SizedBox(width: 8),
                      Icon(
                        LucideIcons.dot,
                        size: 12,
                        color: AppTheme.textMuted,
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'RESOLVED',
                        style: TextStyle(
                          color: AppTheme.success,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      const Text(
                        'Yesterday',
                        style: TextStyle(color: AppTheme.textMuted),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            LucideIcons.image,
                            size: 14,
                            color: AppTheme.textMuted,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            service,
                            style: const TextStyle(color: AppTheme.textMuted),
                          ),
                        ],
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.success.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              LucideIcons.history,
                              size: 12,
                              color: AppTheme.success,
                            ),
                            const SizedBox(width: 4),
                            Text(
                              duration,
                              style: const TextStyle(
                                color: AppTheme.success,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
