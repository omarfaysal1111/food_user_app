import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_back_button.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_primary_button.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_text_field.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final passController = TextEditingController();
    final confirmController = TextEditingController();
    return AuthScaffold(
      padding: const EdgeInsets.fromLTRB(16, 64, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AuthBackButton(),
          const SizedBox(height: 20),
          const Text(
            'إعادة تعيين كلمة المرور !',
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
            'ادخل كلمة مرور جديدة لحماية جميع بياناتك',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 12, color: Color(0xFFA7A7A7), height: 1.3),
          ),
          const SizedBox(height: 32),
          AuthTextField(
            controller: passController,
            label: 'كلمة المرور',
            hintText: 'كلمة المرور',
            obscureText: true,
            suffixIcon: Image.network(
              'https://www.figma.com/api/mcp/asset/0f231293-87b1-461f-9b1f-b4ea67d9e515',
              width: 16,
              height: 16,
            ),
          ),
          const SizedBox(height: 20),
          AuthTextField(
            controller: confirmController,
            label: 'تأكيد كلمه المرور',
            hintText: 'تأكيد كلمه المرور',
            obscureText: true,
            suffixIcon: Image.network(
              'https://www.figma.com/api/mcp/asset/0f231293-87b1-461f-9b1f-b4ea67d9e515',
              width: 16,
              height: 16,
            ),
          ),
          const SizedBox(height: 24),
          AuthPrimaryButton(
            label: 'تأكيد',
            onPressed: () => context.go(RouteNames.login),
          ),
        ],
      ),
    );
  }
}
