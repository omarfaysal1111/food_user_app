import 'package:flutter/material.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/app_media.dart';

class AuthLanguageChip extends StatelessWidget {
  final String label;
  final String? flagAsset;

  /// When null, shows [AppColors.flagRed] as a tiny placeholder (no network call).
  final VoidCallback? onTap;

  const AuthLanguageChip({
    super.key,
    this.label = 'عربي',
    this.flagAsset,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(4),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border, width: 0.5),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: SizedBox(
                width: 16,
                height: 16,
                child: flagAsset == null
                    ? const ColoredBox(color: AppColors.flagRed)
                    : AppSvgImage.asset(
                        flagAsset!,
                        width: 16,
                        height: 16,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(width: 4),
            Text(label, style: AppTextStyles.languageChipLabel),
          ],
        ),
      ),
    );
  }
}
