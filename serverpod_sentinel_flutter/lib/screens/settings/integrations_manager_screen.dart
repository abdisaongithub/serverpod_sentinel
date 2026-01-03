import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';
import '../../widgets/app_sidebar.dart';

class _Integration {
  final String name;
  final String description;
  final String type;
  final IconData icon;
  final Color color;
  final bool isConnected;
  final bool isBeta;

  const _Integration({
    required this.name,
    required this.description,
    required this.type,
    required this.icon,
    required this.color,
    this.isConnected = false,
    this.isBeta = false,
  });
}

class IntegrationsManagerScreen extends StatefulWidget {
  const IntegrationsManagerScreen({super.key});

  @override
  State<IntegrationsManagerScreen> createState() =>
      _IntegrationsManagerScreenState();
}

class _IntegrationsManagerScreenState extends State<IntegrationsManagerScreen> {
  final List<_Integration> _integrations = [
    // Connected
    const _Integration(
      name: 'GitHub',
      description: 'Sync repositories and deployment events.',
      type: 'Source Control',
      icon: LucideIcons.github,
      color: Color(0xFF181717), // GitHub Black
      isConnected: true,
    ),
    const _Integration(
      name: 'AWS',
      description: 'CloudWatch metrics and hygiene scans.',
      type: 'Cloud Provider',
      icon: LucideIcons.cloud,
      color: Color(0xFFFF9900), // AWS Orange
      isConnected: true,
    ),
    const _Integration(
      name: 'Slack',
      description: 'Real-time alerts and ChatOps.',
      type: 'Notifications',
      icon: LucideIcons.messageSquare,
      color: Color(0xFF4A154B), // Slack Purple
      isConnected: true,
    ),
    // Available
    const _Integration(
      name: 'Jira',
      description: 'Create tickets from incidents automatically.',
      type: 'Issue Tracking',
      icon: LucideIcons.bug,
      color: Color(0xFF0052CC), // Jira Blue
    ),
    const _Integration(
      name: 'Datadog',
      description: 'Ingest metrics and traces.',
      type: 'Monitoring',
      icon: LucideIcons.activity,
      color: Color(0xFF632CA6), // Datadog Purple
    ),
    const _Integration(
      name: 'Kubernetes',
      description: 'Cluster health and pod monitoring.',
      type: 'Orchestration',
      icon: LucideIcons.container,
      color: Color(0xFF326CE5), // K8s Blue
    ),
    const _Integration(
      name: 'PagerDuty',
      description: 'On-call scheduling and escalation policies.',
      type: 'Incident Response',
      icon: LucideIcons.siren,
      color: Color(0xFF005f2f), // PagerDuty Green
    ),
    const _Integration(
      name: 'Sentry',
      description: 'Application error tracking.',
      type: 'Monitoring',
      icon: LucideIcons.alertOctagon,
      color: Color(0xFF362D59), // Sentry Purple
      isBeta: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;

        if (isDesktop) {
          return Scaffold(
            backgroundColor: AppTheme.background,
            body: Column(children: [Expanded(child: _buildDesktopLayout())]),
          );
        }

        return Scaffold(
          appBar: _buildMobileAppBar(),
          drawer: const Drawer(
            child: AppSidebar(activeRoute: AppRoutes.integrations),
          ),
          body: _buildMobileLayout(),
        );
      },
    );
  }

  // --- Mobile Components ---

  AppBar _buildMobileAppBar() {
    return AppBar(
      title: const Text(
        'Integrations',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
    );
  }

  Widget _buildMobileLayout() {
    final connected = _integrations.where((i) => i.isConnected).toList();
    final available = _integrations.where((i) => !i.isConnected).toList();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSectionTitle('CONNECTED SERVICES'),
        const SizedBox(height: 12),
        ...connected.map((i) => _buildIntegrationListTile(i)),
        const SizedBox(height: 32),
        _buildSectionTitle('AVAILABLE INTEGRATIONS'),
        const SizedBox(height: 12),
        ...available.map((i) => _buildIntegrationListTile(i)),
      ],
    );
  }

  Widget _buildIntegrationListTile(_Integration item) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceHighlight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        leading: Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: item.color.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(item.icon, color: item.color),
        ),
        title: Row(
          children: [
            Text(
              item.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            if (item.isBeta) ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppTheme.primary.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: const Text(
                  'BETA',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primary,
                  ),
                ),
              ),
            ],
          ],
        ),
        subtitle: Text(
          item.type,
          style: const TextStyle(color: AppTheme.textMuted, fontSize: 12),
        ),
        trailing: item.isConnected
            ? const Icon(
                LucideIcons.checkCircle,
                color: Color(0xFF10b981),
                size: 20,
              )
            : const Icon(LucideIcons.chevronRight, color: AppTheme.textMuted),
        onTap: () {},
      ),
    );
  }

  // --- Desktop Components ---

  Widget _buildDesktopLayout() {
    final connected = _integrations.where((i) => i.isConnected).toList();
    final available = _integrations.where((i) => !i.isConnected).toList();

    return Column(
      children: [
        _buildDesktopHeader(),
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildSectionTitle('CONNECTED SERVICES'),
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    childAspectRatio: 1.8, // Wider cards
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: connected.length,
                  itemBuilder: (context, index) =>
                      _buildDesktopCard(connected[index]),
                ),
                const SizedBox(height: 48),
                _buildSectionTitle('AVAILABLE INTEGRATIONS'),
                const SizedBox(height: 16),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 400,
                    childAspectRatio: 1.5,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemCount: available.length,
                  itemBuilder: (context, index) =>
                      _buildDesktopCard(available[index]),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopHeader() {
    return Container(
      height: 80,
      padding: const EdgeInsets.symmetric(horizontal: 32),
      decoration: const BoxDecoration(
        color: AppTheme.surface,
        border: Border(bottom: BorderSide(color: AppTheme.surfaceHighlight)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Integrations Manager',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 4),
              Text(
                'Manage your external service connections',
                style: TextStyle(color: AppTheme.textMuted, fontSize: 14),
              ),
            ],
          ),
          ElevatedButton.icon(
            onPressed: () {},
            icon: const Icon(LucideIcons.plus, size: 16),
            label: const Text('Add Custom Webhook'),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppTheme.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDesktopCard(_Integration item) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.surfaceHighlight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 10,
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
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: item.color.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(item.icon, color: item.color, size: 28),
              ),
              if (item.isConnected)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFF10b981).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: const Color(0xFF10b981).withOpacity(0.2),
                    ),
                  ),
                  child: const Row(
                    children: [
                      Icon(
                        LucideIcons.check,
                        size: 12,
                        color: Color(0xFF10b981),
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Active',
                        style: TextStyle(
                          color: Color(0xFF10b981),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                )
              else
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    side: const BorderSide(color: AppTheme.surfaceHighlight),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text('Connect'),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Text(
                item.name,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (item.isBeta) ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'BETA',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.primary,
                    ),
                  ),
                ),
              ],
            ],
          ),
          const SizedBox(height: 4),
          Text(
            item.description,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              color: AppTheme.textMuted,
              fontSize: 13,
              height: 1.4,
            ),
          ),
          const Spacer(),
          Row(
            children: [
              Icon(
                LucideIcons.tag,
                size: 14,
                color: AppTheme.textMuted.withOpacity(0.7),
              ),
              const SizedBox(width: 6),
              Text(
                item.type,
                style: const TextStyle(color: AppTheme.textMuted, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        color: AppTheme.textMuted,
        fontSize: 12,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.2,
      ),
    );
  }
}
