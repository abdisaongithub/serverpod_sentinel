import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theme/app_theme.dart';
import '../routes.dart';
import '../providers/auth_provider.dart';
import '../widgets/loading_button.dart';
import '../widgets/app_text_field.dart';
import '../utils/validators.dart';

class LoginScreen extends StatelessWidget {
  static String route = '/login';

  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.darkBackground,
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;

          if (isDesktop) {
            return Row(
              children: [
                const Expanded(child: _BrandingPanel()),
                Expanded(child: _LoginFormPanel()),
              ],
            );
          }

          return _LoginFormPanel();
        },
      ),
    );
  }
}

class _BrandingPanel extends StatelessWidget {
  const _BrandingPanel();

  @override
  Widget build(BuildContext context) {
    const bgColor = AppTheme.darkBackground;

    return Stack(
      children: [
        Positioned.fill(
          child: Image.network(
            "https://lh3.googleusercontent.com/aida-public/AB6AXuABI9zpB9fT1ReazjGxIMdIZAiMA9xenP5fumclKwPXg5An6Feokbpxc12RB6Z05xwu8exvWRusqNCs8RUoQGe0NvU85HOp4Qxd3S4jbtAyGwc1XdPVyUQEKrMdaRkUO2vTdw1Y4W9yyiCEQJ093RtQILurFQdDcPJ4-oQ_DlXsrivIywvw-0o8Q_oPT3iXuv2FCARgF6BE99itGDXh0-6gjUSVpOyi5CSangGiPtoNV0rELJZy8Hz4ILfNlnRce61WJupeKgRM7W8",
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  bgColor.withOpacity(0.9),
                  AppTheme.primary.withOpacity(0.3),
                  bgColor,
                ],
              ),
            ),
          ),
        ),
        Positioned.fill(child: Container(color: Colors.black.withOpacity(0.4))),

        Padding(
          padding: const EdgeInsets.all(64.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [AppTheme.primary, Color(0xFF60A5FA)],
                        begin: Alignment.bottomLeft,
                        end: Alignment.topRight,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Icon(
                      Icons.terminal,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sentinel',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        'ENTERPRISE PLATFORM',
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Colors.blue.shade200,
                          letterSpacing: 1.2,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(100),
                  border: Border.all(color: Colors.white.withOpacity(0.2)),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: const BoxDecoration(
                        color: AppTheme.success,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      'All Systems Operational',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Colors.white, Colors.white70],
                ).createShader(bounds),
                child: Text(
                  'Monitor, Deploy,',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Colors.white,
                    height: 1.1,
                  ),
                ),
              ),
              ShaderMask(
                shaderCallback: (bounds) => const LinearGradient(
                  colors: [Color(0xFF60A5FA), Color(0xFF34D399)],
                ).createShader(bounds),
                child: Text(
                  'Scale Confidence.',
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                    color: Colors.white,
                    height: 1.1,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Seamlessly manage your infrastructure with real-time observability and automated deployment pipelines securely from anywhere.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: AppTheme.darkTextSecondary,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 32),
              Container(
                padding: const EdgeInsets.only(top: 24),
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(color: Colors.white.withOpacity(0.1)),
                  ),
                ),
                child: const Row(
                  children: [
                    _StatItem(label: 'Uptime SLA', value: '99.99%'),
                    SizedBox(width: 32),
                    _StatItem(label: 'Support Access', value: '24/7'),
                    SizedBox(width: 32),
                    _StatItem(label: 'Compliant', value: 'SOC2'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StatItem extends StatelessWidget {
  final String label;
  final String value;
  const _StatItem({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: const TextStyle(color: AppTheme.darkTextMuted, fontSize: 13),
        ),
      ],
    );
  }
}

class _LoginFormPanel extends ConsumerStatefulWidget {
  @override
  ConsumerState<_LoginFormPanel> createState() => _LoginFormPanelState();
}

class _LoginFormPanelState extends ConsumerState<_LoginFormPanel> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      final success = await ref
          .read(authProvider.notifier)
          .signIn(_emailController.text, _passwordController.text);

      if (success && mounted) {
        context.go(AppRoutes.dashboard);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop =
        MediaQuery.of(context).size.width >= AppTheme.tabletBreakpoint;
    final authState = ref.watch(authProvider);

    return Center(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          horizontal: isDesktop ? 64 : 24,
          vertical: 48,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 440),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (!isDesktop) ...[
                  Row(
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppTheme.primary, Color(0xFF60A5FA)],
                          ),
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: const Icon(
                          Icons.terminal,
                          color: Colors.white,
                          size: 18,
                        ),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Sentinel',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 48),
                ],

                Row(
                  children: [
                    const Icon(Icons.lock, color: AppTheme.primary, size: 16),
                    const SizedBox(width: 8),
                    const Text(
                      'SECURE ACCESS',
                      style: TextStyle(
                        color: AppTheme.primary,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.1,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                Text(
                  'Welcome back',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  'Please enter your details to sign in.',
                  style: Theme.of(
                    context,
                  ).textTheme.bodyLarge?.copyWith(color: AppTheme.darkTextMuted),
                ),
                const SizedBox(height: 24),

                if (authState.error != null)
                  Container(
                    padding: const EdgeInsets.all(12),
                    margin: const EdgeInsets.only(bottom: 24),
                    decoration: BoxDecoration(
                      color: AppTheme.error.withOpacity(0.1),
                      border: Border.all(color: AppTheme.error.withOpacity(0.3)),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.error_outline,
                          color: AppTheme.error,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            authState.error!,
                            style: const TextStyle(color: AppTheme.error),
                          ),
                        ),
                      ],
                    ),
                  ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AppTextField(
                      label: 'Work Email',
                      controller: _emailController,
                      hint: 'engineer@company.com',
                      prefixIcon: LucideIcons.mail,
                      keyboardType: TextInputType.emailAddress,
                      validator: Validators.email,
                      enabled: !authState.isLoading,
                    ),
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Password',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        TextButton(
                          onPressed: () => context.go(AppRoutes.forgotPassword),
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              color: AppTheme.primary,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    AppTextField(
                      label: '', 
                      controller: _passwordController,
                      hint: '••••••••',
                      prefixIcon: LucideIcons.lock,
                      obscureText: _obscurePassword,
                      enabled: !authState.isLoading,
                      validator: Validators.required,
                      suffixIcon: _obscurePassword
                          ? LucideIcons.eye
                          : LucideIcons.eyeOff,
                      onSuffixPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    const SizedBox(height: 32),
                    SizedBox(
                      width: double.infinity,
                      child: LoadingButton(
                        label: 'Log In',
                        icon: Icons.arrow_forward,
                        isLoading: authState.isLoading,
                        onPressed: _handleLogin,
                      ),
                    ),
                    const SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(color: AppTheme.darkTextMuted),
                        ),
                        TextButton(
                          onPressed: () => context.go(AppRoutes.signup),
                          child: const Text('Sign up'),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 32),
                Row(
                  children: [
                    const Expanded(child: Divider(color: AppTheme.darkBorder)),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Text(
                        'OR CONTINUE WITH',
                        style: TextStyle(
                          color: AppTheme.darkTextDim,
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                    const Expanded(child: Divider(color: AppTheme.darkBorder)),
                  ],
                ),
                const SizedBox(height: 24),

                Row(
                  children: [
                    Expanded(
                      child: _SocialButton(
                        label: 'GitHub',
                        icon: LucideIcons.github,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _SocialButton(
                        label: 'Google',
                        icon: LucideIcons.chrome,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                const _SocialButton(
                  label: 'Single Sign-On (SAML)',
                  icon: Icons.admin_panel_settings,
                  isFullWidth: true,
                ),

                const SizedBox(height: 48),
                Center(
                  child: Column(
                    children: [
                      const Text(
                        'Protected by reCAPTCHA and subject to the Privacy Policy and Terms of Service.',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: AppTheme.darkTextDim, fontSize: 12),
                      ),
                      const SizedBox(height: 16),
                      Text(
                        'v2.4.0 • Sentinel Inc.',
                        style: TextStyle(
                          color: AppTheme.darkSurfaceHighlight,
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isFullWidth;

  const _SocialButton({
    required this.label,
    required this.icon,
    this.isFullWidth = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      width: isFullWidth ? double.infinity : null,
      decoration: BoxDecoration(
        color: AppTheme.darkSurface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppTheme.darkBorderHighlight),
      ),
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 20, color: Colors.white),
            const SizedBox(width: 10),
            Text(
              label,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
