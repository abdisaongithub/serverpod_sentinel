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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: colorScheme.onSurface),
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
      final id = await notifier.startPasswordReset(_emailController.text);
      if (id != null && mounted) {
        setState(() {
          _requestId = id;
          _codeSent = true;
        });
      }
    } else {
      if (_requestId == null) return;
      final token = await notifier.verifyPasswordReset(
        _requestId!,
        _codeController.text,
      );

      if (token != null && mounted) {
        context.go(AppRoutes.resetPassword, extra: token);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final authState = ref.watch(authProvider);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: colorScheme.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.lock_reset, color: colorScheme.primary, size: 32),
          ),
          const SizedBox(height: 24),
          Text(
            _codeSent ? 'Enter Verification Code' : 'Reset password',
            style: theme.textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            _codeSent
                ? 'We sent a code to ${_emailController.text}'
                : 'Enter the email address associated with your account and we\'ll send you a link to reset your password.',
            style: theme.textTheme.bodyMedium,
          ),

          if (authState.error != null)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                authState.error!,
                style: TextStyle(color: colorScheme.error),
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
            ),
          ),
          const SizedBox(height: 24),
          Center(
            child: TextButton(
              onPressed: () => context.go(AppRoutes.login),
              child: Text('Return to Login', style: theme.textTheme.bodySmall),
            ),
          ),
        ],
      ),
    );
  }
}
