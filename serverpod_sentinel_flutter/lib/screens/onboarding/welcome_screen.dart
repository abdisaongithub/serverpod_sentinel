import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import '../../widgets/primary_button.dart';
import 'create_env_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              color: AppTheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(LucideIcons.box, color: AppTheme.primary),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {},
            child: const Text(
              'Skip Tour',
              style: TextStyle(color: AppTheme.textMuted),
            ),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Hero Image Placeholder
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(24),
                  border: Border.all(color: AppTheme.surfaceHighlight),
                  // Placeholder for the network graphic
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/network_placeholder.png',
                    ), // Will fail gracefully if missing
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Center(
                  child: Icon(
                    LucideIcons.rocket,
                    size: 64,
                    color: AppTheme.primary,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              Text(
                'Welcome to OpsPilot',
                style: Theme.of(context).textTheme.headlineLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                'Streamline your infrastructure in 4 simple steps. Automate workflows and gain full visibility instantly.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppTheme.textMuted,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 48),

              // Steps List
              _buildStepItem(
                context,
                '1',
                'Create Environment',
                'Set up your workspace boundaries to organize your resources.',
                isActive: true,
              ),
              _buildStepItem(
                context,
                '2',
                'Register Service',
                'Connect your first repository or application service.',
              ),
              _buildStepItem(
                context,
                '3',
                'Install Agent',
                'Deploy the listener to your server for real-time monitoring.',
              ),
              _buildStepItem(
                context,
                '4',
                'Define First Rule',
                'Automate your first response action to a trigger.',
              ),

              const SizedBox(height: 48),

              PrimaryButton(
                label: 'Initialize Setup',
                icon: LucideIcons.arrowRight,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateEnvScreen(),
                    ),
                  );
                },
              ),
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {},
                child: RichText(
                  text: const TextSpan(
                    text: 'Already have an environment? ',
                    style: TextStyle(color: AppTheme.textMuted),
                    children: [
                      TextSpan(
                        text: 'Log in',
                        style: TextStyle(
                          color: AppTheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
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

  Widget _buildStepItem(
    BuildContext context,
    String number,
    String title,
    String description, {
    bool isActive = false,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isActive ? AppTheme.primary : AppTheme.surface,
              border: Border.all(
                color: isActive ? AppTheme.primary : AppTheme.surfaceHighlight,
              ),
            ),
            child: Center(
              child: Text(
                number,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: isActive ? Colors.white : AppTheme.textMuted,
                ),
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: Theme.of(
                    context,
                  ).textTheme.bodyMedium?.copyWith(color: AppTheme.textMuted),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
