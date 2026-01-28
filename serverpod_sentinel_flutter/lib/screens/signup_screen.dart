import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:serverpod_client/serverpod_client.dart';
import '../theme/app_theme.dart';
import '../routes.dart';
import '../providers/auth_provider.dart';
import '../widgets/loading_button.dart';
import '../widgets/app_text_field.dart';
import '../utils/validators.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isDesktop = constraints.maxWidth >= AppTheme.tabletBreakpoint;

          if (isDesktop) {
            return Row(
              children: [
                const Expanded(child: _BrandingPanel()),
                Expanded(child: _SignupFormPanel()),
              ],
            );
          }

          return _SignupFormPanel();
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
        Padding(
          padding: const EdgeInsets.all(64.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              Text(
                'Join the Future of DevOps.',
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: Colors.white,
                  height: 1.1,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Create your account to start managing infrastructure securely.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.6),
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ],
    );
  }
}

class _SignupFormPanel extends ConsumerStatefulWidget {
  @override
  ConsumerState<_SignupFormPanel> createState() => _SignupFormPanelState();
}

enum _SignupStep { email, code, password }

class _SignupFormPanelState extends ConsumerState<_SignupFormPanel> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _codeController = TextEditingController();
  final _passwordController = TextEditingController();

  _SignupStep _currentStep = _SignupStep.email;
  UuidValue? _accountRequestId;
  String? _registrationToken;

  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _codeController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _handleStep() async {
    if (!_formKey.currentState!.validate()) return;

    final notifier = ref.read(authProvider.notifier);

    if (_currentStep == _SignupStep.email) {
      final id = await notifier.startRegistration(_emailController.text);
      if (id != null && mounted) {
        setState(() {
          _accountRequestId = id;
          _currentStep = _SignupStep.code;
        });
      }
    } else if (_currentStep == _SignupStep.code) {
      if (_accountRequestId == null) return;
      final token = await notifier.verifyRegistration(
        _accountRequestId!,
        _codeController.text,
      );
      if (token != null && mounted) {
        setState(() {
          _registrationToken = token;
          _currentStep = _SignupStep.password;
        });
      }
    } else if (_currentStep == _SignupStep.password) {
      if (_registrationToken == null) return;
      final success = await notifier.finishRegistration(
        _registrationToken!,
        _passwordController.text,
      );
      if (success && mounted) {
        context.go(AppRoutes.welcome);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);
    final isDesktop =
        MediaQuery.of(context).size.width >= AppTheme.tabletBreakpoint;

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
                if (!isDesktop) ...[const SizedBox(height: 20)],
                Row(
                  children: [
                    const Icon(
                      Icons.person_add,
                      color: AppTheme.primary,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'CREATE ACCOUNT - STEP ${(_currentStep.index + 1)}/3',
                      style: const TextStyle(
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
                  _currentStep == _SignupStep.email
                      ? 'Get Started'
                      : _currentStep == _SignupStep.code
                      ? 'Verify Email'
                      : 'Set Password',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 8),
                Text(
                  _currentStep == _SignupStep.email
                      ? 'Enter your email to verify your account.'
                      : _currentStep == _SignupStep.code
                      ? 'We sent a code to ${_emailController.text}'
                      : 'Create a strong password for your account.',
                  style: Theme.of(context).textTheme.bodyMedium,
                ),

                if (authState.error != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 16),
                    child: Text(
                      authState.error!,
                      style: const TextStyle(color: AppTheme.error),
                    ),
                  ),

                const SizedBox(height: 32),

                if (_currentStep == _SignupStep.email)
                  AppTextField(
                    label: 'Work Email',
                    controller: _emailController,
                    hint: 'engineer@company.com',
                    prefixIcon: LucideIcons.mail,
                    keyboardType: TextInputType.emailAddress,
                    validator: Validators.email,
                    enabled: !authState.isLoading,
                  ),

                if (_currentStep == _SignupStep.code)
                  AppTextField(
                    label: 'Verification Code',
                    controller: _codeController,
                    hint: '123456',
                    prefixIcon: LucideIcons.key,
                    keyboardType: TextInputType.number,
                    validator: Validators.required,
                    enabled: !authState.isLoading,
                  ),

                if (_currentStep == _SignupStep.password)
                  AppTextField(
                    label: 'Password',
                    controller: _passwordController,
                    hint: '••••••••',
                    prefixIcon: LucideIcons.lock,
                    obscureText: _obscurePassword,
                    enabled: !authState.isLoading,
                    validator: (val) {
                      if (val == null || val.length < 8) return 'Min 8 chars';
                      return null;
                    },
                    suffixIcon: _obscurePassword
                        ? LucideIcons.eye
                        : LucideIcons.eyeOff,
                    onSuffixPressed: () =>
                        setState(() => _obscurePassword = !_obscurePassword),
                  ),

                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: LoadingButton(
                    label: _currentStep == _SignupStep.password
                        ? 'Create Account'
                        : 'Continue',
                    icon: Icons.arrow_forward,
                    isLoading: authState.isLoading,
                    onPressed: _handleStep,
                  ),
                ),

                const SizedBox(height: 24),
                if (_currentStep == _SignupStep.email)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      TextButton(
                        onPressed: () => context.go(AppRoutes.login),
                        child: const Text('Log in'),
                      ),
                    ],
                  ),
                if (_currentStep != _SignupStep.email)
                  Center(
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          _currentStep = _SignupStep.email;
                          _accountRequestId = null;
                          _registrationToken = null;
                        });
                      },
                      child: Text(
                        'Back to start',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
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
