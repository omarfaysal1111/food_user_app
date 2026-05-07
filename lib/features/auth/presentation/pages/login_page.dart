import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/app_media.dart';
import 'package:food_user_app/features/auth/presentation/widgets/login_form.dart';
import 'package:food_user_app/features/auth/presentation/widgets/social_login_buttons.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_language_chip.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthScaffold(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: AuthLanguageChip(
              label: 'عربي',
              flagAsset: AppAssets.flagEg,
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                      'Language switch is coming soon',
                      style: AppTextStyles.snackBarMessage(context),
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: AppSvgImage.asset(
              AppAssets.loginLogo,
              width: 84,
              height: 68,
              fit: BoxFit.contain,
            ),
          ),
          const SizedBox(height: 40),
          Text(
            'تسجيل دخول !',
            textAlign: TextAlign.right,
            style: AppTextStyles.screenTitle(context),
          ),
          const SizedBox(height: 8),
          Text(
            'مرحبا بعودتك مره اخرى سجل دخول الان !',
            textAlign: TextAlign.right,
            style: AppTextStyles.subtitle(context),
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
                text: TextSpan(
                  style: AppTextStyles.richTextBase14,
                  children: [
                    TextSpan(
                      text: 'ليس لديك حساب من قبل ؟ ',
                      style: AppTextStyles.footerSecondary(context),
                    ),
                    const TextSpan(
                      text: 'إنشاء حساب',
                      style: AppTextStyles.linkEmphasis,
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
