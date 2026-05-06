import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/features/auth/presentation/widgets/login_form.dart';
import 'package:food_user_app/features/auth/presentation/widgets/social_login_buttons.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_language_chip.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: Reconnect AuthBloc and real API after backend is ready.
    return AuthScaffold(
      padding: const EdgeInsets.fromLTRB(16, 64, 16, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: AuthLanguageChip(
              flagImageUrl:
                  'https://www.figma.com/api/mcp/asset/6e3cc6f8-d12f-4d1c-9753-0507771dd5d7',
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Language switch is coming soon')),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: Image.network(
              'https://www.figma.com/api/mcp/asset/553de026-e6c3-456a-aa8c-a7c4dbeee6b9',
              width: 84,
              height: 68,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 40),
          const Text(
            'تسجيل دخول !',
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
            'مرحبا بعودتك مره اخرى سجل دخول الان !',
            textAlign: TextAlign.right,
            style: TextStyle(fontSize: 12, color: Color(0xFFA7A7A7), height: 1.3),
          ),
          const SizedBox(height: 32),
          LoginForm(
            onForgotPassword: () => context.push(RouteNames.forgotPassword),
            onLoginSuccess: () => context.go(RouteNames.home),
          ),
          const SizedBox(height: 24),
          const SocialLoginButtons(),
          const SizedBox(height: 24),
          Center(
            child: TextButton(
              onPressed: () => context.push(RouteNames.register),
              child: RichText(
                text: const TextSpan(
                  style: TextStyle(fontSize: 14),
                  children: [
                    TextSpan(
                      text: 'ليس لديك حساب من قبل ؟ ',
                      style: TextStyle(color: Color(0xFFA7A7A7), height: 1.35),
                    ),
                    TextSpan(
                      text: 'إنشاء حساب',
                      style: TextStyle(
                        color: Color(0xFFA3090F),
                        fontWeight: FontWeight.w600,
                        height: 1.25,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
