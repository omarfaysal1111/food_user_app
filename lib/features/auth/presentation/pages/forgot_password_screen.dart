import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_back_button.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_primary_button.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_text_field.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    return AuthScaffold(
      padding: const EdgeInsets.fromLTRB(16, 64, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AuthBackButton(),
          const SizedBox(height: 20),
          const Text(
            'نسيت كلمة المرور !',
            textAlign: TextAlign.right,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Color(0xFF1B1B1B),
              height: 1.4,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'قم بادخال البريد الالكتروني الخاص بك للتأكد من حسابك',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 12, color: Color(0xFFA7A7A7), height: 1.3),
          ),
          const SizedBox(height: 32),
          AuthTextField(
            controller: emailController,
            label: 'البريد الالكتروني',
            hintText: 'البريد الالكتروني',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 20),
          AuthPrimaryButton(
            label: 'تأكيد',
            onPressed: () => context.push(RouteNames.otp),
          ),
        ],
      ),
    );
  }
}
