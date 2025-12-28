import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import 'service_detail_screen.dart';

class ServiceRegistryScreen extends StatelessWidget {
  const ServiceRegistryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service Registry'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16),
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: AppTheme.primary,
              shape: BoxShape.circle,
            ),
            child: const Icon(LucideIcons.plus, size: 20, color: Colors.white),
          ),
        ],
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1200),
          child: Column(
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.all(16),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      LucideIcons.search,
                      color: AppTheme.textMuted,
                    ),
                    hintText: 'Search services by name or ID',
                    filled: true,
                    fillColor: AppTheme.surface,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  ),
                ),
              ),

              // Filters
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    _buildDropdownFilter('Env: All'),
                    const SizedBox(width: 8),
                    _buildDropdownFilter('Health: All'),
                    const SizedBox(width: 16),
                    Container(
                      height: 24,
                      width: 1,
                      color: AppTheme.surfaceHighlight,
                    ),
                    const SizedBox(width: 16),
                    _buildFilterChip(
                      'Critical',
                      true,
                      dotColor: AppTheme.error,
                      bgColor: AppTheme.error.withOpacity(0.2),
                      borderColor: AppTheme.error,
                    ),
                    const SizedBox(width: 8),
                    _buildFilterChip('Prod', false),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'REGISTERED SERVICES (5)',
                      style: TextStyle(
                        color: AppTheme.textMuted,
                        fontSize: 12,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'View All',
                      style: TextStyle(
                        color: AppTheme.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              // List
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.all(16),
                  children: [
                    _buildServiceCard(
                      context,
                      name: 'Auth-Service',
                      id: '#srv-001',
                      team: 'Team Alpha',
                      time: '2m ago',
                      status: 'Healthy',
                      env: 'Prod',
                      icon: LucideIcons.checkCircle,
                      color: AppTheme.success,
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const ServiceDetailScreen(),
                          ),
                        );
                      },
                    ),
                    _buildServiceCard(
                      context,
                      name: 'Payment-Gateway',
                      id: 'High Latency', // Using ID slot for status desc
                      team: 'FinOps',
                      time: '10s ago',
                      status: 'Warning',
                      env: 'Prod',
                      icon: LucideIcons.alertTriangle,
                      color: Colors.orange,
                      leftBorderHighlight: true,
                    ),
                    _buildServiceCard(
                      context,
                      name: 'Email-Worker',
                      id: 'Connection Refused',
                      team: 'Comm Team',
                      time: '5h ago',
                      status: 'Critical',
                      env: 'Staging',
                      icon: LucideIcons.alertOctagon,
                      color: AppTheme.error,
                      envColor: const Color(0xFF6366f1), // Indigo
                      hasRefresh: true,
                    ),
                    _buildServiceCard(
                      context,
                      name: 'Analytics-Stream',
                      id: 'Maintenance Mode',
                      team: 'Data Eng',
                      time: '1d ago',
                      status: 'Maintenance',
                      env: 'Prod',
                      icon: LucideIcons.wrench,
                      color: AppTheme.textMuted,
                    ),
                    _buildServiceCard(
                      context,
                      name: 'User-Profile',
                      id: 'Healthy',
                      team: 'Team Alpha',
                      time: '1h ago',
                      status: 'Healthy',
                      env: 'Dev',
                      icon: LucideIcons.checkCircle,
                      color: AppTheme.success,
                      envColor: AppTheme.success,
                    ),

                    const SizedBox(height: 24),
                    const Center(
                      child: Text(
                        'End of list',
                        style: TextStyle(color: AppTheme.textDim),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppTheme.surface,
        selectedItemColor: AppTheme.primary,
        unselectedItemColor: AppTheme.textMuted,
        type: BottomNavigationBarType.fixed,
        currentIndex: 1, // Registry selected
        items: const [
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.layoutGrid),
            label: 'Ops',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.server),
            label: 'Registry',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.activity),
            label: 'Infra',
          ),
          BottomNavigationBarItem(
            icon: Icon(LucideIcons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownFilter(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.surfaceHighlight),
      ),
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(
              color: AppTheme.text,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SizedBox(width: 8),
          const Icon(
            LucideIcons.chevronDown,
            size: 14,
            color: AppTheme.textMuted,
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(
    String label,
    bool isSelected, {
    Color? dotColor,
    Color? bgColor,
    Color? borderColor,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: bgColor ?? (isSelected ? Colors.white : AppTheme.surface),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color:
              borderColor ??
              (isSelected ? Colors.white : AppTheme.surfaceHighlight),
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
          Text(
            label,
            style: TextStyle(
              color: isSelected && bgColor == null
                  ? Colors.black
                  : (bgColor != null ? borderColor : AppTheme.textMuted),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildServiceCard(
    BuildContext context, {
    required String name,
    required String id,
    required String team,
    required String time,
    required String status,
    required String env,
    required IconData icon,
    required Color color,
    Color? envColor,
    bool leftBorderHighlight = false,
    bool hasRefresh = false,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppTheme.surfaceHighlight),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (leftBorderHighlight) Container(width: 4, color: color),

              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          // Icon Circle
                          Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: AppTheme.surfaceHighlight.withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            child: Stack(
                              clipBehavior: Clip.none,
                              children: [
                                Icon(icon, size: 24, color: color),
                                if (status == 'Healthy') // Add small green dot
                                  Positioned(
                                    right: -2,
                                    bottom: -2,
                                    child: Container(
                                      width: 10,
                                      height: 10,
                                      decoration: BoxDecoration(
                                        color: AppTheme.success,
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: AppTheme.surface,
                                          width: 2,
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
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
                                  id,
                                  style: TextStyle(
                                    color: status == 'Critical'
                                        ? AppTheme.error
                                        : AppTheme.textMuted,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // Env Badge
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: (envColor ?? const Color(0xFF1e3a8a))
                                  .withOpacity(0.3), // blue-900
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                color: (envColor ?? const Color(0xFF1e3a8a))
                                    .withOpacity(0.5),
                              ),
                            ),
                            child: Text(
                              env,
                              style: TextStyle(
                                color: envColor ?? const Color(0xFF60a5fa),
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                              ),
                            ), // blue-400
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          const Icon(
                            LucideIcons.users,
                            size: 14,
                            color: AppTheme.textMuted,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            team,
                            style: const TextStyle(
                              color: AppTheme.textMuted,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Icon(
                            LucideIcons.clock,
                            size: 14,
                            color: AppTheme.textMuted,
                          ),
                          const SizedBox(width: 6),
                          Text(
                            time,
                            style: const TextStyle(
                              color: AppTheme.textMuted,
                              fontSize: 12,
                            ),
                          ), // Add generic date color here
                          const Spacer(),
                          if (hasRefresh)
                            Container(
                              padding: const EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                color: AppTheme.surfaceHighlight,
                                shape: BoxShape.circle,
                              ),
                              child: const Icon(
                                LucideIcons.refreshCcw,
                                size: 12,
                                color: AppTheme.error,
                              ),
                            )
                          else
                            const Icon(
                              LucideIcons.chevronRight,
                              size: 16,
                              color: AppTheme.textMuted,
                            ),
                        ],
                      ),
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
}
