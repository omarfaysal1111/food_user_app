import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/utils/auth_validators.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_back_button.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_primary_button.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_text_field.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _onSubmit() {
    FocusManager.instance.primaryFocus?.unfocus();
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }
    context.push(RouteNames.otp);
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
              'نسيت كلمة المرور !',
              textAlign: TextAlign.right,
              style: AppTextStyles.screenTitle,
            ),
            const SizedBox(height: 8),
            const Text(
              'قم بادخال البريد الالكتروني الخاص بك للتأكد من حسابك',
              textAlign: TextAlign.right,
              style: AppTextStyles.subtitle,
            ),
            const SizedBox(height: 32),
            AuthTextField(
              controller: _emailController,
              label: 'البريد الالكتروني',
              hintText: 'البريد الالكتروني',
              keyboardType: TextInputType.emailAddress,
              validator: AuthValidators.emailRequiredDotCom,
            ),
            const SizedBox(height: 20),
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
