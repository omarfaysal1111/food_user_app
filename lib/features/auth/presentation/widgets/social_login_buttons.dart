import 'package:flutter/material.dart';
import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/app_media.dart';

class SocialLoginButtons extends StatelessWidget {
  const SocialLoginButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Row(
          children: [
            Expanded(child: Divider(color: AppColors.border)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'او',
                textAlign: TextAlign.center,
                style: AppTextStyles.dividerLabel,
              ),
            ),
            Expanded(child: Divider(color: AppColors.border)),
          ],
        ),
        const SizedBox(height: 12),
        OutlinedButton.icon(
          onPressed: () {
            // TODO: Reconnect AuthBloc and real API after backend is ready.
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'دخول عبر Apple قريباً',
                  style: AppTextStyles.snackBarMessage,
                ),
              ),
            );
          },
          icon: const AppSvgImage.asset(
            AppAssets.socialApple,
            width: 23,
            height: 28,
            fit: BoxFit.contain,
          ),
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(double.infinity, 44),
            side: const BorderSide(color: AppColors.border),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          label: const Text('دخول عبر Apple', style: AppTextStyles.socialButtonLabel),
        ),
        const SizedBox(height: 8),
        OutlinedButton.icon(
          onPressed: () {
            // TODO: Reconnect AuthBloc and real API after backend is ready.
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'دخول عبر Google قريباً',
                  style: AppTextStyles.snackBarMessage,
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
            side: const BorderSide(color: AppColors.border),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          ),
          label: const Text('دخول عبر Google', style: AppTextStyles.socialButtonLabel),
        ),
      ],
    );
  }
}
