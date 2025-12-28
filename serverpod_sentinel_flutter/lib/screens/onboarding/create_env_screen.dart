import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/custom_text_field.dart';
import '../../widgets/step_indicator.dart';
import 'register_service_screen.dart';

class CreateEnvScreen extends StatefulWidget {
  const CreateEnvScreen({super.key});

  @override
  State<CreateEnvScreen> createState() => _CreateEnvScreenState();
}

class _CreateEnvScreenState extends State<CreateEnvScreen> {
  String _selectedEnvType = 'Production';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Onboarding'),
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
                currentStep: 0,
                steps: [
                  'Create Environment',
                  'Register Service',
                  'Install Agent',
                ],
              ), // Adjusted steps to match flow or screenshots
              // Note: Screenshot 3 shows "Create Account", "Create Environment", "Connect Cloud".
              // But Screenshot 4 shows "Create Env", "Register Service", "Configure Deploy".
              // I will stick to the Welcome Screen flow: 1. Env, 2. Service, 3. Agent.
              const SizedBox(height: 32),
              Text(
                'Set up your first Environment',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 12),
              Text(
                "An environment groups your services and resources. Most teams start with 'Staging' or 'Production'.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 32),

              const CustomTextField(
                label: 'Environment Name',
                hint: 'e.g. My Production',
              ),
              const SizedBox(height: 24),

              Text(
                'Environment Type',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Container(
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppTheme.surfaceHighlight),
                ),
                child: Row(
                  children: [
                    _buildEnvTypeTab('Development'),
                    _buildEnvTypeTab('Staging'),
                    _buildEnvTypeTab('Production'),
                  ],
                ),
              ),

              const SizedBox(height: 24),
              Text(
                'Region',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.surface,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppTheme.surfaceHighlight),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: 'US East (N. Virginia)',
                    isExpanded: true,
                    dropdownColor: AppTheme.surface,
                    icon: const Icon(
                      LucideIcons.chevronDown,
                      color: AppTheme.textMuted,
                    ),
                    items:
                        [
                          'US East (N. Virginia)',
                          'EU West (Ireland)',
                          'Asia Pacific (Tokyo)',
                        ].map((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(
                              value,
                              style: const TextStyle(color: Colors.white),
                            ),
                          );
                        }).toList(),
                    onChanged: (_) {},
                  ),
                ),
              ),

              const SizedBox(height: 48), // Spacer
              // Bottom Action
              Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Import existing environment instead',
                    style: TextStyle(color: AppTheme.textMuted),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              PrimaryButton(
                label: 'Create Environment',
                icon: LucideIcons.arrowRight,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterServiceScreen(),
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

  Widget _buildEnvTypeTab(String title) {
    bool isSelected = _selectedEnvType == title;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedEnvType = title;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          decoration: BoxDecoration(
            color: isSelected
                ? AppTheme.surfaceHighlight
                : Colors.transparent, // Highlight selected
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
}
