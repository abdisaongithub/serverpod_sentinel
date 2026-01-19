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

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => context.go(AppRoutes.login),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 440),
            child: const _ForgotPasswordForm(),
          ),
        ),
      ),
    );
  }
}

class _ForgotPasswordForm extends ConsumerStatefulWidget {
  const _ForgotPasswordForm();

  @override
  ConsumerState<_ForgotPasswordForm> createState() =>
      _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends ConsumerState<_ForgotPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _codeController = TextEditingController();

  bool _codeSent = false;
  UuidValue? _requestId;

  @override
  void dispose() {
    _emailController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;

    final notifier = ref.read(authProvider.notifier);

    if (!_codeSent) {
      // Request Code
      final id = await notifier.startPasswordReset(_emailController.text);
      if (id != null && mounted) {
        setState(() {
          _requestId = id;
          _codeSent = true;
        });
      }
    } else {
      // Verify Code
      if (_requestId == null) return;
      final token = await notifier.verifyPasswordReset(
        _requestId!,
        _codeController.text,
      );

      if (token != null && mounted) {
        // Navigate to Reset Password Screen with the token
        // Since we can't easily pass args via route without query params or state,
        // we might store it in a global state or pass it via extra.
        // For now, let's assume route parameter or simple state provider.
        // But better yet, let's keep it simple and maybe merge ResetPasswordScreen here
        // or just use query parameter.
        // However, token might be long/sensitive.
        // Let's use `extra` in go_router.
        context.go(AppRoutes.resetPassword, extra: token);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authProvider);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppTheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(
              Icons.lock_reset,
              color: AppTheme.primary,
              size: 32,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            _codeSent ? 'Enter Verification Code' : 'Reset password',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            _codeSent
                ? 'We sent a code to ${_emailController.text}'
                : 'Enter the email address associated with your account and we\'ll send you a link to reset your password.',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppTheme.textMuted),
          ),

          if (authState.error != null)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                authState.error!,
                style: const TextStyle(color: Colors.red),
              ),
            ),

          const SizedBox(height: 32),

          if (!_codeSent)
            AppTextField(
              label: 'Email Address',
              controller: _emailController,
              hint: 'name@company.com',
              prefixIcon: LucideIcons.mail,
              keyboardType: TextInputType.emailAddress,
              validator: Validators.email,
              enabled: !authState.isLoading,
            ),

          if (_codeSent)
            AppTextField(
              label: 'Verification Code',
              controller: _codeController,
              hint: '123456',
              prefixIcon: LucideIcons.key,
              keyboardType: TextInputType.number,
              validator: Validators.required,
              enabled: !authState.isLoading,
            ),

          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: LoadingButton(
              label: _codeSent ? 'Verify Code' : 'Send Reset Link',
              icon: Icons.arrow_forward,
              isLoading: authState.isLoading,
              onPressed: _handleSubmit,
              backgroundColor: AppTheme.primary,
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: TextButton(
              onPressed: () => context.go(AppRoutes.login),
              child: const Text(
                'Return to Login',
                style: TextStyle(color: Color(0xFF94A3B8)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
