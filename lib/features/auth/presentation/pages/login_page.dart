import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/localization/context_locale_ext.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/app_media.dart';
import 'package:food_user_app/features/auth/presentation/widgets/login_form.dart';
import 'package:food_user_app/features/auth/presentation/widgets/social_login_buttons.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_scaffold.dart';
import 'package:food_user_app/features/auth/presentation/widgets/app_language_picker_modal.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_language_chip.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final isArabic = Directionality.of(context) == TextDirection.rtl;

    return AuthScaffold(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: isArabic ? Alignment.centerLeft : Alignment.centerRight,
            child: AuthLanguageChip(
              label: context.isArabic ? l10n.languageArabic : l10n.languageEnglish,
              flagAsset: context.isArabic ? AppAssets.flagEg : AppAssets.flagUsa,
              onTap: () => showAppLanguagePicker(context),
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
            l10n.loginTitle,
            textAlign: TextAlign.start,
            style: AppTextStyles.screenTitle(context),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.loginSubtitle,
            textAlign: TextAlign.start,
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
                      text: l10n.loginNoAccount,
                      style: AppTextStyles.footerSecondary(context),
                    ),
                    TextSpan(
                      text: l10n.loginCreateAccount,
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
