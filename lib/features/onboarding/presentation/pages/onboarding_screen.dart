import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/app_media.dart';
import 'package:food_user_app/features/auth/presentation/widgets/auth_primary_button.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

/// Welcome / onboarding from Figma node `6223:1359`.
class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  static const _horizontalPad = 16.0;
  static const _collageBottomRadius = 12.0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final screenHeight = MediaQuery.sizeOf(context).height;
    final bottomInset = MediaQuery.paddingOf(context).bottom;
    final collageH = screenHeight * 0.6;
    final scaffoldBg = AppColors.scaffoldBackground(context);
    final collageAsset = Theme.of(context).brightness == Brightness.dark
        ? AppAssets.onboardingCollageDark
        : AppAssets.onboardingCollage;

    return Scaffold(
      backgroundColor: scaffoldBg,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(_collageBottomRadius),
              bottomRight: Radius.circular(_collageBottomRadius),
            ),
            child: SizedBox(
              height: collageH,
              width: double.infinity,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  AppRasterImage.asset(
                    collageAsset,
                    fit: BoxFit.cover,
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          scaffoldBg.withValues(alpha: 0),
                          scaffoldBg.withValues(alpha: 0.35),
                          scaffoldBg,
                        ],
                        stops: const [0.45, 0.72, 1],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(
              _horizontalPad,
              24,
              _horizontalPad,
              24 + bottomInset,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Center(
                  child: AppSvgImage.asset(
                    AppAssets.onboardingScooter,
                    width: 95,
                    height: 84,
                  ),
                ),
                const SizedBox(height: 24),
                _OnboardingTitle(l10n: l10n),
                const SizedBox(height: 12),
                Text(
                  l10n.onboardingDescription,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.onboardingDescription(context),
                ),
                const SizedBox(height: 24),
                AuthPrimaryButton(
                  height: 48,
                  preserveContentOrder: true,
                  label: l10n.onboardingCta,
                  onPressed: () => context.go(RouteNames.login),
                  trailing: const AppSvgImage.asset(
                    AppAssets.onboardingArrow,
                    width: 20,
                    height: 20,
                    color: AppColors.text,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingTitle extends StatelessWidget {
  const _OnboardingTitle({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        style: AppTextStyles.screenTitle(context),
        children: [
          TextSpan(text: l10n.onboardingTitleLine1),
          TextSpan(
            text: l10n.onboardingTitleAccent,
            style: AppTextStyles.onboardingTitleAccent(context),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
