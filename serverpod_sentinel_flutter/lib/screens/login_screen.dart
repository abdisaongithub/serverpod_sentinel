import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theme/app_theme.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/primary_button.dart';
import 'onboarding/welcome_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth > AppTheme.tabletBreakpoint;

          return Stack(
            children: [
              // Background
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xFF0F172A), Color(0xFF0B1121)],
                  ),
                ),
              ),
              if (isDesktop)
                // Desktop: Split Screen
                Row(
                  children: [
                    // Left: Branding Panel
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              AppTheme.primary.withOpacity(0.1),
                              AppTheme.background,
                            ],
                          ),
                        ),
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(24),
                                decoration: BoxDecoration(
                                  color: AppTheme.primary.withOpacity(0.1),
                                  borderRadius: BorderRadius.circular(24),
                                  border: Border.all(
                                    color: AppTheme.primary.withOpacity(0.2),
                                  ),
                                ),
                                child: const Icon(
                                  LucideIcons.network,
                                  size: 80,
                                  color: AppTheme.primary,
                                ),
                              ),
                              const SizedBox(height: 32),
                              Text(
                                'DevOps Nexus',
                                style: Theme.of(context).textTheme.displaySmall
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                'Enterprise Operations Platform',
                                style: Theme.of(context).textTheme.bodyLarge
                                    ?.copyWith(color: AppTheme.textMuted),
                              ),
                              const SizedBox(height: 48),
                              ConstrainedBox(
                                constraints: const BoxConstraints(
                                  maxWidth: 400,
                                ),
                                child: Text(
                                  'Unified monitoring, intelligent automation, and seamless incident management for your entire infrastructure.',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyMedium
                                      ?.copyWith(
                                        color: AppTheme.textMuted,
                                        height: 1.6,
                                      ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    // Right: Login Form
                    Expanded(child: _buildLoginForm(context)),
                  ],
                )
              else
                // Mobile/Tablet: Centered Form
                _buildLoginForm(context),
            ],
          );
        },
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo Icon (only shown on mobile/tablet)
              LayoutBuilder(
                builder: (context, constraints) {
                  // Check parent to see if we're in split mode
                  final screenWidth = MediaQuery.of(context).size.width;
                  if (screenWidth > AppTheme.tabletBreakpoint) {
                    return const SizedBox.shrink();
                  }
                  return Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: AppTheme.primary.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(
                            color: AppTheme.primary.withOpacity(0.2),
                          ),
                        ),
                        child: const Icon(
                          LucideIcons.network,
                          size: 40,
                          color: AppTheme.primary,
                        ),
                      ),
                      const SizedBox(height: 24),
                      Text(
                        'DevOps Nexus',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Enterprise Operations Platform',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      const SizedBox(height: 48),
                    ],
                  );
                },
              ),

              Text(
                'Welcome Back',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(height: 8),
              Text(
                'Access your infrastructure dashboard.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 32),

              // Form
              const CustomTextField(
                label: 'Email Address',
                hint: 'user@company.com',
                suffixIcon: LucideIcons.mail,
              ),
              const SizedBox(height: 24),
              const CustomTextField(
                label: 'Password',
                isPassword: true,
                hint: '••••••••',
              ),

              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot Password?'),
                ),
              ),
              const SizedBox(height: 24),

              Row(
                children: [
                  Expanded(
                    child: PrimaryButton(
                      label: 'Log In',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WelcomeScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 16),
                  // Face ID / Biometric Button
                  Container(
                    height: 52,
                    width: 52,
                    decoration: BoxDecoration(
                      color: AppTheme.surface,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppTheme.surfaceHighlight),
                    ),
                    child: IconButton(
                      icon: const Icon(
                        LucideIcons.scanFace,
                        color: AppTheme.primary,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 32),
              Row(
                children: [
                  const Expanded(
                    child: Divider(color: AppTheme.surfaceHighlight),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      'Or sign in with',
                      style: TextStyle(color: AppTheme.textMuted),
                    ),
                  ),
                  const Expanded(
                    child: Divider(color: AppTheme.surfaceHighlight),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Social Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _SocialButton(icon: LucideIcons.code),
                  _SocialButton(icon: LucideIcons.layoutGrid),
                  _SocialButton(icon: LucideIcons.circle),
                ],
              ),

              const SizedBox(height: 48),
              Text(
                'v4.2.0 • Enterprise Edition',
                style: Theme.of(
                  context,
                ).textTheme.bodySmall?.copyWith(color: AppTheme.textDim),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Privacy Policy',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const SizedBox(width: 16),
                  Text('Support', style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final IconData icon;

  const _SocialButton({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 50,
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppTheme.surfaceHighlight),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}
