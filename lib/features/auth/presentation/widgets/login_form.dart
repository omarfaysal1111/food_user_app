import 'package:flutter/material.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/utils/auth_validators.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_password_visibility_suffix.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_primary_button.dart';

class LoginForm extends StatefulWidget {
  final VoidCallback onForgotPassword;
  final VoidCallback onLoginSuccess;

  const LoginForm({
    super.key,
    required this.onForgotPassword,
    required this.onLoginSuccess,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isSubmitting = false;
  bool _isPasswordVisible = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) =>
      AuthValidators.emailRequiredDotCom(value);

  String? _validatePassword(String? value) =>
      AuthValidators.passwordRequiredMin8(value);

  void _onSubmit() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    // TODO: Reconnect AuthBloc and real API after backend is ready.
    setState(() => _isSubmitting = true);
    Future<void>.delayed(const Duration(seconds: 1), () {
      if (!mounted) return;
      setState(() => _isSubmitting = false);
      widget.onLoginSuccess();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          AuthTextField(
            controller: _emailController,
            label: 'البريد الالكتروني',
            hintText: 'البريد الالكتروني',
            keyboardType: TextInputType.emailAddress,
            validator: _validateEmail,
          ),
          const SizedBox(height: 12),
          AuthTextField(
            controller: _passwordController,
            label: 'كلمة المرور',
            hintText: 'كلمة المرور',
            obscureText: !_isPasswordVisible,
            suffixIcon: AuthPasswordVisibilitySuffix(
              isVisible: _isPasswordVisible,
              onPressed: () =>
                  setState(() => _isPasswordVisible = !_isPasswordVisible),
            ),
            validator: _validatePassword,
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton(
              onPressed: widget.onForgotPassword,
              style: TextButton.styleFrom(
                foregroundColor: AppColors.onSurface,
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                minimumSize: Size.zero,
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'نسيت كلمة المرور؟',
                    style: AppTextStyles.textLink,
                  ),
                  const SizedBox(height: 2),
                  Container(width: 92, height: 1, color: AppColors.onSurface),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          AuthPrimaryButton(
            label: _isSubmitting ? '...' : 'تسجيل دخول',
            onPressed: _isSubmitting ? null : _onSubmit,
          ),
        ],
      ),
    );
  }
}
