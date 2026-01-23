import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:serverpod_sentinel_client/serverpod_sentinel_client.dart';
import '../../theme/app_theme.dart';
import '../../routes.dart';
import '../../widgets/app_sidebar.dart';
import '../../providers/settings_provider.dart';
import '../../providers/client_provider.dart';

class IntegrationsManagerScreen extends ConsumerStatefulWidget {
  const IntegrationsManagerScreen({super.key});

  @override
  ConsumerState<IntegrationsManagerScreen> createState() =>
      _IntegrationsManagerScreenState();
}

class _IntegrationsManagerScreenState
    extends ConsumerState<IntegrationsManagerScreen> {
  // Helper to map backend data to UI presentation
  _IntegrationUIInfo _getUIInfo(Integration integration) {
    switch (integration.provider.toLowerCase()) {
      case 'github':
        return const _IntegrationUIInfo(
          description: 'Sync repositories and deployment events.',
          icon: LucideIcons.github,
          color: Color(0xFF181717),
        );
      case 'aws':
        return const _IntegrationUIInfo(
          description: 'CloudWatch metrics and hygiene scans.',
          icon: LucideIcons.cloud,
          color: Color(0xFFFF9900),
        );
      case 'slack':
        return const _IntegrationUIInfo(
          description: 'Real-time alerts and ChatOps.',
          icon: LucideIcons.messageSquare,
          color: Color(0xFF4A154B),
        );
      case 'jira':
        return const _IntegrationUIInfo(
          description: 'Create tickets from incidents automatically.',
          icon: LucideIcons.bug,
          color: Color(0xFF0052CC),
        );
      case 'datadog':
        return const _IntegrationUIInfo(
          description: 'Ingest metrics and traces.',
          icon: LucideIcons.activity,
          color: Color(0xFF632CA6),
        );
      case 'kubernetes':
        return const _IntegrationUIInfo(
          description: 'Cluster health and pod monitoring.',
          icon: LucideIcons.container,
          color: Color(0xFF326CE5),
        );
      case 'pagerduty':
        return const _IntegrationUIInfo(
          description: 'On-call scheduling and escalation policies.',
          icon: LucideIcons.siren,
          color: Color(0xFF005f2f),
        );
      case 'sentry':
        return const _IntegrationUIInfo(
          description: 'Application error tracking.',
          icon: LucideIcons.alertOctagon,
          color: Color(0xFF362D59),
        );
      default:
        return const _IntegrationUIInfo(
          description: 'External service integration.',
          icon: LucideIcons.plug,
          color: Colors.grey,
        );
    }
  }

  Future<void> _testConnection(Integration integration) async {
    if (integration.id == null) return;
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Testing connection for ${integration.name}...')),
    );

    try {
      final client = ref.read(clientProvider);
      final result = await client.integration.testConnection(integration.id!);
      final isSuccess = result['success'] == true;
      
      if (mounted) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(isSuccess 
              ? 'Connection successful!' 
              : 'Connection failed. Check configuration.'),
            backgroundColor: isSuccess ? Colors.green : Colors.red,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error testing connection: $e'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final integrationsAsync = ref.watch(integrationsProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;

        return integrationsAsync.when(
          data: (integrations) {
            final connected = integrations.where((i) => i.isEnabled).toList();
            final available = integrations.where((i) => !i.isEnabled).toList();

            if (isDesktop) {
              return Scaffold(
                backgroundColor: AppTheme.background,
                body: Column(
                  children: [
                    _buildDesktopHeader(),
                    Expanded(child: _buildDesktopLayout(connected, available)),
                  ],
                ),
              );
            }

            return Scaffold(
              appBar: _buildMobileAppBar(),
              drawer: const Drawer(
                child: AppSidebar(activeRoute: AppRoutes.integrations),
              ),
              body: _buildMobileLayout(connected, available),
            );
          },
          loading: () =>
              const Scaffold(body: Center(child: CircularProgressIndicator())),
          error: (err, stack) =>
              Scaffold(body: Center(child: Text('Error: $err'))),
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

  Widget _buildMobileLayout(
    List<Integration> connected,
    List<Integration> available,
  ) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildSectionTitle('CONNECTED SERVICES'),
        const SizedBox(height: 12),
        if (connected.isEmpty)
          const Text(
            'No connected services',
            style: TextStyle(color: AppTheme.textMuted),
          ),
        ...connected.map((i) => _buildIntegrationListTile(i)),
        const SizedBox(height: 32),
        _buildSectionTitle('AVAILABLE INTEGRATIONS'),
        const SizedBox(height: 12),
        ...available.map((i) => _buildIntegrationListTile(i)),
      ],
    );
  }

  Widget _buildIntegrationListTile(Integration item) {
    final uiInfo = _getUIInfo(item);
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceHighlight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
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
            color: uiInfo.color.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(uiInfo.icon, color: uiInfo.color),
        ),
        title: Row(
          children: [
            Text(
              item.name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            // Example of beta flag logic, hardcoded for now or define logic based on provider
            if (item.provider.toLowerCase() == 'sentry') ...[
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: AppTheme.primary.withValues(alpha: 0.1),
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
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (item.isEnabled == true)
              IconButton(
                icon: const Icon(LucideIcons.refreshCw, size: 18),
                color: AppTheme.textMuted,
                onPressed: () => _testConnection(item),
              ),
            (item.isEnabled == true)
                ? const Icon(
                    LucideIcons.checkCircle,
                    color: Color(0xFF10b981),
                    size: 20,
                  )
                : const Icon(LucideIcons.chevronRight, color: AppTheme.textMuted),
          ],
        ),
        onTap: () {
          // Navigate to detail or show sheet to connect
          // For now, toggle logic placeholder
          _showConnectionDialog(context, item);
        },
      ),
    );
  }

  // --- Desktop Components ---

  Widget _buildDesktopLayout(
    List<Integration> connected,
    List<Integration> available,
  ) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildSectionTitle('CONNECTED SERVICES'),
          const SizedBox(height: 16),
          if (connected.isEmpty)
            const Padding(
              padding: EdgeInsets.only(bottom: 32),
              child: Text(
                'No connected services',
                style: TextStyle(color: AppTheme.textMuted),
              ),
            ),
          if (connected.isNotEmpty)
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
          if (connected.isNotEmpty) const SizedBox(height: 48),

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
            onPressed: () => _showAddWebhookDialog(context),
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

  Widget _buildDesktopCard(Integration item) {
    final uiInfo = _getUIInfo(item);
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppTheme.surfaceHighlight),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.03),
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
                  color: uiInfo.color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(uiInfo.icon, color: uiInfo.color, size: 28),
              ),
              if (item.isEnabled == true)
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFF10b981).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: const Color(0xFF10b981).withValues(alpha: 0.2),
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
                    ),
                    const SizedBox(width: 8),
                    IconButton(
                      icon: const Icon(LucideIcons.refreshCw, size: 16),
                      color: AppTheme.textMuted,
                      tooltip: 'Test Connection',
                      onPressed: () => _testConnection(item),
                    ),
                  ],
                )
              else
                OutlinedButton(
                  onPressed: () => _showConnectionDialog(context, item),
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
              if (item.provider.toLowerCase() == 'sentry') ...[
                const SizedBox(width: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withValues(alpha: 0.1),
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
            uiInfo.description,
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
                color: AppTheme.textMuted.withValues(alpha: 0.7),
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

  Future<void> _showConnectionDialog(
    BuildContext context,
    Integration item,
  ) async {
    final enabled = !item.isEnabled;
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('${enabled ? 'Connect' : 'Disconnect'} ${item.name}?'),
        content: Text(
          'Are you sure you want to ${enabled ? 'enable' : 'disable'} this integration?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Confirm'),
          ),
        ],
      ),
    );

    if (confirmed == true && item.id != null) {
      final result = await ref
          .read(settingsMutationProvider.notifier)
          .toggleIntegration(item.id!, enabled);

      if (mounted) {
        if (result != null) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                '${item.name} ${enabled ? 'connected' : 'disconnected'} successfully',
              ),
              backgroundColor: Colors.green,
            ),
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Failed to ${enabled ? 'connect' : 'disconnect'} ${item.name}',
              ),
              backgroundColor: Colors.red,
            ),
          );
        }
      }
    }
  }

  Future<void> _showAddWebhookDialog(BuildContext context) async {
    final nameController = TextEditingController();
    final urlController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    final created = await showDialog<Integration>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Add Custom Webhook'),
        content: Form(
          key: formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                  hintText: 'e.g., Slack Channel #alerts',
                ),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: urlController,
                decoration: const InputDecoration(
                  labelText: 'Webhook URL',
                  hintText: 'https://hooks.slack.com/...',
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Required';
                  if (!Uri.parse(value).isAbsolute) return 'Invalid URL';
                  return null;
                },
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              if (formKey.currentState!.validate()) {
                final newIntegration = Integration(
                  name: nameController.text,
                  type: 'webhook',
                  provider: 'webhook',
                  config: '{"url": "${urlController.text}"}',
                  isEnabled: true,
                  createdAt: DateTime.now(),
                  updatedAt: DateTime.now(),
                );

                final result = await ref
                    .read(settingsMutationProvider.notifier)
                    .createIntegration(newIntegration);

                if (context.mounted) {
                  if (result != null) {
                    Navigator.of(context).pop(result);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Failed to create webhook'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                }
              }
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );

    if (mounted && created != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Webhook added successfully'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }
}

class _IntegrationUIInfo {
  final String description;
  final IconData icon;
  final Color color;

  const _IntegrationUIInfo({
    required this.description,
    required this.icon,
    required this.color,
  });
}
