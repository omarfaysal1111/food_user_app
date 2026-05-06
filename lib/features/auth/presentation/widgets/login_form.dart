import 'package:flutter/material.dart';
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

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? _validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) {
      return 'البريد الالكتروني مطلوب';
    }

    final emailRegex = RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$');
    if (!emailRegex.hasMatch(email)) {
      return 'يرجى إدخال بريد الكتروني صحيح';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if ((value ?? '').trim().isEmpty) {
      return 'كلمة المرور مطلوبة';
    }
    return null;
  }

  void _onSubmit() {
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
            obscureText: true,
            suffixIcon: Image.network(
              'https://www.figma.com/api/mcp/asset/0f231293-87b1-461f-9b1f-b4ea67d9e515',
              width: 16,
              height: 16,
            ),
            validator: _validatePassword,
          ),
          const SizedBox(height: 8),
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: widget.onForgotPassword,
              child: const Text(
                'نسيت كلمة المرور؟',
                style: TextStyle(
                  color: Color(0xFF1B1B1B),
                  decoration: TextDecoration.underline,
                  fontSize: 12,
                ),
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
