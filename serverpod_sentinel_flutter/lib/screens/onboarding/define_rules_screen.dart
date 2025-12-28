import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../theme/app_theme.dart';
import '../../widgets/primary_button.dart';
import '../../widgets/step_indicator.dart';
import '../dashboard/dashboard_screen.dart';

class DefineRulesScreen extends StatefulWidget {
  const DefineRulesScreen({super.key});

  @override
  State<DefineRulesScreen> createState() => _DefineRulesScreenState();
}

class _DefineRulesScreenState extends State<DefineRulesScreen> {
  String _selectedTemplate = 'Auto-Assign Reviewers';

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
                currentStep: 3,
                steps: ['Env', 'Service', 'Agent', 'Rules'],
              ),
              const SizedBox(height: 32),

              Text(
                "Let's automate your first workflow",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 12),
              Text(
                "Choose a starter rule to help your team save time immediately. You can edit this later.",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 32),

              Text(
                'Popular Templates',
                style: Theme.of(
                  context,
                ).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 16),

              _buildTemplateCard(
                title: 'Auto-Assign Reviewers',
                description:
                    'Round-robin assignment for new PRs to distribute workload evenly.',
                icon: LucideIcons.users,
                color: const Color(0xFF3B82F6), // Blue
              ),
              const SizedBox(height: 16),
              _buildTemplateCard(
                title: 'Block Deploys on Failure',
                description:
                    'Automatically stop production deploys if critical tests fail.',
                icon: LucideIcons.ban, // close-circle
                // Note: using slash/ban/circle-off as rough approximation for 'block'
                color: const Color(0xFFEF4444), // Red
              ),
              const SizedBox(height: 16),
              _buildTemplateCard(
                title: 'Slack Notifications',
                description:
                    'Post to #dev-ops channel immediately when incidents occur.',
                icon: LucideIcons.bell,
                color: const Color(0xFFEAB308), // Yellow
              ),
              const SizedBox(height: 16),
              _buildTemplateCard(
                title: 'Stale Branch Cleanup',
                description:
                    'Delete merged branches older than 7 days to keep repo clean.',
                icon: LucideIcons.trash2, // broom or trash
                color: const Color(0xFF10B981), // Green
              ),

              const SizedBox(height: 48),

              PrimaryButton(
                label: 'Enable Rule & Finish',
                icon: LucideIcons.arrowRight,
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const DashboardScreen(),
                    ),
                    (route) => false,
                  );
                },
              ),
              const SizedBox(height: 16),
              Center(
                child: TextButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DashboardScreen(),
                      ),
                      (route) => false,
                    );
                  },
                  child: const Text(
                    'Skip for now',
                    style: TextStyle(color: AppTheme.textMuted),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTemplateCard({
    required String title,
    required String description,
    required IconData icon,
    required Color color,
  }) {
    bool isSelected = _selectedTemplate == title;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTemplate = title;
        });
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: AppTheme.surface,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppTheme.primary : AppTheme.surfaceHighlight,
            width: isSelected ? 2 : 1,
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color.withOpacity(0.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(icon, color: color, size: 24),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                        ),
                      ),
                      if (isSelected)
                        const Icon(
                          LucideIcons.checkCircle,
                          color: AppTheme.primary,
                          size: 20,
                        ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppTheme.textMuted,
                      height: 1.4,
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
