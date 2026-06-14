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
  static const _smallHeightBreakpoint = 700.0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final scaffoldBg = AppColors.scaffoldBackground(context);
    final collageAsset = Theme.of(context).brightness == Brightness.dark
        ? AppAssets.onboardingCollageDark
        : AppAssets.onboardingCollage;

    return Scaffold(
      backgroundColor: scaffoldBg,
      body: SafeArea(
        top: false,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bottomInset = MediaQuery.paddingOf(context).bottom;
            final bottomPadding = 20.0 + bottomInset;

            final availableHeight = constraints.maxHeight;
            final isSmallHeight = availableHeight < _smallHeightBreakpoint;

            final scooterWidth = isSmallHeight ? 78.0 : 95.0;
            final scooterHeight = isSmallHeight ? 70.0 : 84.0;

            final mainGap = isSmallHeight ? 14.0 : 24.0;
            final titleDescGap = isSmallHeight ? 8.0 : 12.0;

            // Conservative estimates to prevent bottom overflow on short screens.
            const titleEstimate = 56.0;
            const descriptionEstimate = 44.0;

            final desiredCollageH = availableHeight * 0.60;
            final minCollageH = isSmallHeight
                ? availableHeight * 0.42
                : availableHeight * 0.50;

            final reservedContentH = mainGap + // top padding inside content block
                scooterHeight +
                mainGap +
                titleEstimate +
                titleDescGap +
                descriptionEstimate +
                mainGap +
                48.0 + // CTA button height
                bottomPadding;

            final computedCollageH =
                (availableHeight - reservedContentH).clamp(minCollageH, desiredCollageH);

            final enableScrollFallback = availableHeight < 650;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(_collageBottomRadius),
                    bottomRight: Radius.circular(_collageBottomRadius),
                  ),
                  child: SizedBox(
                    height: computedCollageH,
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
                Expanded(
                  child: SingleChildScrollView(
                    physics: enableScrollFallback
                        ? const BouncingScrollPhysics()
                        : const NeverScrollableScrollPhysics(),
                    child: Padding(
                      padding: EdgeInsets.fromLTRB(
                        _horizontalPad,
                        mainGap,
                        _horizontalPad,
                        bottomPadding,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Center(
                            child: AppSvgImage.asset(
                              AppAssets.onboardingScooter,
                              width: scooterWidth,
                              height: scooterHeight,
                            ),
                          ),
                          SizedBox(height: mainGap),
                          _OnboardingTitle(l10n: l10n),
                          SizedBox(height: titleDescGap),
                          Text(
                            l10n.onboardingDescription,
                            textAlign: TextAlign.center,
                            style: AppTextStyles.onboardingDescription(context),
                          ),
                          SizedBox(height: mainGap),
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
                  ),
                ),
              ],
            );
          },
        ),
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
