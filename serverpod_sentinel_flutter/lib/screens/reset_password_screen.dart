import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../theme/app_theme.dart';
import '../routes.dart';
import '../providers/auth_provider.dart';
import '../widgets/loading_button.dart';
import '../widgets/app_text_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String? token; // Token passed from Verify Step or Email Link
  const ResetPasswordScreen({this.token, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.background,
      appBar: AppBar(
        title: const Text('OpsCenter'),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const SizedBox.shrink(), // No back button
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 48),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 440),
            child: _ResetPasswordForm(token: token),
          ),
        ),
      ),
    );
  }
}

class _ResetPasswordForm extends ConsumerStatefulWidget {
  final String? token;
  const _ResetPasswordForm({this.token});

  @override
  ConsumerState<_ResetPasswordForm> createState() => _ResetPasswordFormState();
}

class _ResetPasswordFormState extends ConsumerState<_ResetPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _obscurePassword = true;
  bool _isSuccess = false;

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  Future<void> _handleSubmit() async {
    if (!_formKey.currentState!.validate()) return;
    if (widget.token == null) {
      // In real app, might show error that link is invalid
      return;
    }

    final success = await ref
        .read(authProvider.notifier)
        .finishPasswordReset(widget.token!, _passwordController.text);

    if (success && mounted) {
      setState(() {
        _isSuccess = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isSuccess) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(24),
            decoration: const BoxDecoration(
              color: AppTheme.success,
              shape: BoxShape.circle,
            ),
            child: const Icon(Icons.check, color: Colors.white, size: 40),
          ),
          const SizedBox(height: 24),
          Text(
            'Password Reset Complete',
            style: Theme.of(context).textTheme.headlineMedium,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'Your password has been successfully updated. You can now log in with your new password.',
            style: Theme.of(
              context,
            ).textTheme.bodyLarge?.copyWith(color: AppTheme.textMuted),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => context.go(AppRoutes.login),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppTheme.primary,
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: const Text('Log In Now'),
            ),
          ),
        ],
      );
    }

    final authState = ref.watch(authProvider);

    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Set new password',
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          const SizedBox(height: 8),
          Text(
            'Keep your account secure with a strong password.',
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

          if (widget.token == null)
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Icon(Icons.error, color: Colors.red),
                  const SizedBox(width: 8),
                  const Expanded(
                    child: Text(
                      'Missing reset token. Please request a new link.',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),

          if (widget.token != null) ...[
            AppTextField(
              label: 'New Password',
              controller: _passwordController,
              hint: '••••••••',
              prefixIcon: LucideIcons.lock,
              obscureText: _obscurePassword,
              enabled: !authState.isLoading,
              validator: (val) {
                if (val == null || val.length < 8) {
                  return 'Password must be at least 8 characters';
                }
                return null;
              },
              suffixIcon: _obscurePassword
                  ? LucideIcons.eye
                  : LucideIcons.eyeOff,
              onSuffixPressed: () =>
                  setState(() => _obscurePassword = !_obscurePassword),
            ),
            const SizedBox(height: 24),
            AppTextField(
              label: 'Confirm Password',
              controller: _confirmController,
              hint: '••••••••',
              prefixIcon: LucideIcons.lock,
              obscureText: _obscurePassword,
              enabled: !authState.isLoading,
              validator: (val) {
                if (val != _passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
            ),
            const SizedBox(height: 32),
            SizedBox(
              width: double.infinity,
              child: LoadingButton(
                label: 'Reset Password',
                icon: Icons.check_circle_outline,
                isLoading: authState.isLoading,
                onPressed: _handleSubmit,
                backgroundColor: AppTheme.primary,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
