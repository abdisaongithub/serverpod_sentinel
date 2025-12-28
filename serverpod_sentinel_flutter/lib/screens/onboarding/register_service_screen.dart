import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/step_indicator.dart';
import '../../widgets/selection_card.dart';
import 'install_agent_screen.dart';

class RegisterServiceScreen extends StatefulWidget {
  const RegisterServiceScreen({super.key});

  @override
  State<RegisterServiceScreen> createState() => _RegisterServiceScreenState();
}

class _RegisterServiceScreenState extends State<RegisterServiceScreen> {
  String _selectedServiceType = 'Web Service';

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
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const OnboardingStepper(
                    currentStep: 1,
                    steps: [
                      'Env',
                      'Service',
                      'Agent',
                      'Verify',
                    ], // Abbreviated to match screenshot closer
                  ),
                  const SizedBox(height: 32),
                  Text(
                    'Register your first service',
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    "Let's define what you're running. We'll automatically detect buildpacks based on your repo language.",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const SizedBox(height: 32),
                  const CustomTextField(
                    label: 'Service Name',
                    hint: 'e.g. my-backend-api',
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Must be lowercase and URL friendly.',
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: AppTheme.textDim),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Service Type',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Expanded(
                        child: _buildTypeCard('Web Service', LucideIcons.globe),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildTypeCard('Worker', LucideIcons.settings),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildTypeCard('Cron Job', LucideIcons.clock),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Text(
                    'Source Repository',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: AppTheme.surfaceHighlight),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          LucideIcons.gitCommit,
                          color: AppTheme.textMuted,
                        ), // Placeholder for code-xml/github
                        const SizedBox(width: 12),
                        Text(
                          'Connect to GitHub...',
                          style: TextStyle(
                            color: AppTheme.textMuted,
                            fontSize: 16,
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          LucideIcons.chevronRight,
                          color: AppTheme.textMuted,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Divider(color: AppTheme.surfaceHighlight),
                  Theme(
                    data: Theme.of(
                      context,
                    ).copyWith(dividerColor: Colors.transparent),
                    child: ExpansionTile(
                      title: const Text('Environment Variables (Optional)'),
                      iconColor: AppTheme.textMuted,
                      collapsedIconColor: AppTheme.textMuted,
                      tilePadding: EdgeInsets.zero,
                      children: [
                        Container(height: 50, color: AppTheme.surface),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  Row(
                    children: [
                      SizedBox(
                        width: 100,
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: AppTheme.surfaceHighlight,
                            ),
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Back',
                            style: TextStyle(color: AppTheme.text),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: PrimaryButton(
                          label: 'Register & Continue',
                          icon: LucideIcons.arrowRight,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const InstallAgentScreen(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTypeCard(String title, IconData icon) {
    return SelectionCard(
      title: title,
      icon: icon,
      isSelected: _selectedEnvType == title,
      onTap: () {
        setState(() {
          _selectedEnvType = title;
        });
      },
    );
  }

  // Correction: Used _selectedEnvType instead of _selectedServiceType
  String get _selectedEnvType => _selectedServiceType;
  set _selectedEnvType(String val) => _selectedServiceType = val;
}
