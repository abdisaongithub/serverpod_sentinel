import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';

class IntegrationsManagerScreen extends StatelessWidget {
  const IntegrationsManagerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Integrations',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.arrowLeft),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'CONNECTED SERVICES',
            style: TextStyle(
              color: AppTheme.textMuted,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          _buildIntegrationItem(
            'GitHub',
            'Source Control',
            true,
            LucideIcons.github,
            const Color(0xFF10b981),
          ),
          _buildIntegrationItem(
            'AWS',
            'Cloud Provider',
            true,
            LucideIcons.cloud,
            Colors.orange,
          ),
          _buildIntegrationItem(
            'Slack',
            'Notifications',
            true,
            LucideIcons.messageSquare,
            Colors.pink,
          ),

          const SizedBox(height: 32),
          const Text(
            'AVAILABLE INTEGRATIONS',
            style: TextStyle(
              color: AppTheme.textMuted,
              fontSize: 12,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.2,
            ),
          ),
          const SizedBox(height: 12),
          _buildIntegrationItem(
            'Jira',
            'Issue Tracking',
            false,
            LucideIcons.bug,
            Colors.blue,
          ),
          _buildIntegrationItem(
            'Datadog',
            'Monitoring',
            false,
            LucideIcons.activity,
            Colors.purple,
          ),
          _buildIntegrationItem(
            'Kubernetes',
            'Orchestration',
            false,
            LucideIcons.container,
            Colors.blueAccent,
          ),
        ],
      ),
    );
  }

  Widget _buildIntegrationItem(
    String name,
    String type,
    bool isConnected,
    IconData icon,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.surfaceHighlight),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color),
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
                  type,
                  style: const TextStyle(
                    color: AppTheme.textMuted,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          if (isConnected)
            OutlinedButton(onPressed: () {}, child: const Text('Configure'))
          else
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                foregroundColor: Colors.white,
              ),
              child: const Text('Connect'),
            ),
        ],
      ),
    );
  }
}
