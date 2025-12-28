import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/step_indicator.dart';
import 'define_rules_screen.dart';

class InstallAgentScreen extends StatefulWidget {
  const InstallAgentScreen({super.key});

  @override
  State<InstallAgentScreen> createState() => _InstallAgentScreenState();
}

class _InstallAgentScreenState extends State<InstallAgentScreen> {
  String _selectedTab = 'Docker';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Set up your Agent'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(LucideIcons.chevronLeft),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const OnboardingStepper(
                currentStep: 2,
                steps: ['Env', 'Service', 'Agent', 'Verify'],
              ),
              const SizedBox(height: 32),

              Text(
                'Install the Agent',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 12),
              Text(
                "Copy the command below and run it on your host machine to connect it to the DevOps platform.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 32),

              // Tabs
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppTheme.surfaceHighlight),
                ),
                child: Row(
                  children: [
                    _buildTab('Docker'),
                    _buildTab('Kubernetes'),
                    _buildTab('Linux'),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Terminal Block
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1E1E1E), // Terminal black/grey
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppTheme.surfaceHighlight),
                ),
                child: Column(
                  children: [
                    // Terminal Header
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      child: Row(
                        children: [
                          _buildWindowDot(Colors.red),
                          const SizedBox(width: 8),
                          _buildWindowDot(Colors.orange),
                          const SizedBox(width: 8),
                          _buildWindowDot(Colors.green),
                          const Spacer(),
                          Text(
                            'TERMINAL',
                            style: TextStyle(
                              color: AppTheme.textDim,
                              fontSize: 10,
                              letterSpacing: 1.5,
                            ),
                          ),
                          const Spacer(),
                        ],
                      ),
                    ),
                    const Divider(height: 1, color: AppTheme.surfaceHighlight),

                    // Terminal Content
                    Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text.rich(
                            TextSpan(
                              text: '➜  ~ \n\n',
                              style: TextStyle(
                                color: AppTheme.success,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'monospace',
                              ),
                              children: [
                                TextSpan(
                                  text: 'curl',
                                  style: TextStyle(color: Colors.pinkAccent),
                                ),
                                TextSpan(
                                  text:
                                      ' -sL https://ops-platform.io/install.sh | ',
                                  style: TextStyle(color: Colors.white),
                                ),
                                TextSpan(
                                  text: 'sudo',
                                  style: TextStyle(color: Colors.yellow),
                                ),
                                TextSpan(
                                  text: ' bash -s -- --token=',
                                  style: TextStyle(color: Colors.white),
                                ),
                                TextSpan(
                                  text: '834jdf983...',
                                  style: TextStyle(color: AppTheme.success),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 24),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton.icon(
                              onPressed: () {
                                Clipboard.setData(
                                  const ClipboardData(
                                    text:
                                        'curl -sL https://ops-platform.io/install.sh | sudo bash -s -- --token=834jdf983...',
                                  ),
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('Copied to clipboard'),
                                  ),
                                );
                              },
                              icon: const Icon(
                                LucideIcons.copy,
                                size: 16,
                                color: Colors.white,
                              ),
                              label: const Text(
                                'Copy',
                                style: TextStyle(color: Colors.white),
                              ),
                              style: TextButton.styleFrom(
                                backgroundColor: AppTheme.surfaceHighlight,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 8,
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

              const SizedBox(height: 24),
              // Share instructions button
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(LucideIcons.share, size: 18),
                  label: const Text('Share installation instructions'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    side: const BorderSide(color: AppTheme.surfaceHighlight),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 48),

              // Listening Status
              Center(
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                  decoration: BoxDecoration(
                    color: AppTheme.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: AppTheme.primary.withOpacity(0.3),
                    ),
                  ),
                  child: const Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 12,
                        height: 12,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: AppTheme.primary,
                        ),
                      ), // Or a pulsing dot
                      SizedBox(width: 12),
                      Text(
                        'Listening for agent connection...',
                        style: TextStyle(
                          color: AppTheme.primary,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),

              PrimaryButton(
                label: 'Verify Installation',
                icon: LucideIcons.arrowRight,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DefineRulesScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String title) {
    bool isSelected = _selectedTab == title;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedTab = title;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected ? AppTheme.primary : Colors.transparent,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: isSelected ? Colors.white : AppTheme.textMuted,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildWindowDot(Color color) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
