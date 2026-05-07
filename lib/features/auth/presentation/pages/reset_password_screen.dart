import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/utils/auth_validators.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_back_button.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_password_visibility_suffix.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_primary_button.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _passController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isConfirmPasswordVisible = false;

  @override
  void dispose() {
    _passController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }
    context.go(RouteNames.login);
  }

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      padding: const EdgeInsets.fromLTRB(16, 64, 16, 24),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const AuthBackButton(),
            const SizedBox(height: 20),
            const Text(
              'إعادة تعيين كلمة المرور !',
              textAlign: TextAlign.right,
              style: AppTextStyles.screenTitle,
            ),
            const SizedBox(height: 8),
            const Text(
              'ادخل كلمة مرور جديدة لحماية جميع بياناتك',
              textAlign: TextAlign.right,
              style: AppTextStyles.subtitle,
            ),
            const SizedBox(height: 32),
            AuthTextField(
              controller: _passController,
              label: 'كلمة المرور',
              hintText: 'كلمة المرور',
              obscureText: !_isPasswordVisible,
              suffixIcon: AuthPasswordVisibilitySuffix(
                isVisible: _isPasswordVisible,
                onPressed: () =>
                    setState(() => _isPasswordVisible = !_isPasswordVisible),
              ),
              validator: AuthValidators.passwordRequiredMin8,
            ),
            const SizedBox(height: 20),
            AuthTextField(
              controller: _confirmController,
              label: 'تأكيد كلمه المرور',
              hintText: 'تأكيد كلمه المرور',
              obscureText: !_isConfirmPasswordVisible,
              suffixIcon: AuthPasswordVisibilitySuffix(
                isVisible: _isConfirmPasswordVisible,
                onPressed: () => setState(
                  () => _isConfirmPasswordVisible = !_isConfirmPasswordVisible,
                ),
              ),
              validator: (value) => AuthValidators.confirmPassword(
                value,
                _passController.text,
              ),
            ),
            const SizedBox(height: 24),
            AuthPrimaryButton(
              label: 'تأكيد',
              onPressed: _onSubmit,
            ),
          ],
        ),
      ),
    );
  }
}
