import 'package:flutter/material.dart';
import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/app_media.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final dividerColor = AppColors.border(context);
    final appleAsset = Theme.of(context).brightness == Brightness.dark
        ? AppAssets.socialAppleDark
        : AppAssets.socialApple;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(child: Divider(color: dividerColor)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                l10n.socialDivider,
                textAlign: TextAlign.center,
                style: AppTextStyles.dividerLabel(context),
              ),
            ),
            Expanded(child: Divider(color: dividerColor)),
          ],
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  l10n.socialAppleSoon,
                  style: AppTextStyles.snackBarMessage(context),
                ),
              ),
            );
          },
          icon: AppSvgImage.asset(
            appleAsset,
            width: 23,
            height: 28,
            fit: BoxFit.contain,
          ),
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 44),
            side: BorderSide(color: AppColors.border(context)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          label: Text(
            l10n.socialAppleLabel,
            style: AppTextStyles.socialButtonLabel(context),
          ),
        ),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  l10n.socialGoogleSoon,
                  style: AppTextStyles.snackBarMessage(context),
                ),
              ),
            );
          },
          icon: const AppSvgImage.asset(
            AppAssets.socialGoogle,
            width: 28,
            height: 28,
            fit: BoxFit.contain,
          ),
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 44),
            side: BorderSide(color: AppColors.border(context)),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
          ),
          label: Text(
            l10n.socialGoogleLabel,
            style: AppTextStyles.socialButtonLabel(context),
          ),
        ),
      ],
    );
  }
}
