import 'package:flutter/material.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/app_media.dart';

class AuthLanguageChip extends StatelessWidget {
  final String label;
  final String? flagAsset;
  final VoidCallback onTap;

  /// When null, shows [AppColors.flagRed] as a tiny placeholder (no network call).
  const AuthLanguageChip({
    super.key,
    this.label = 'عربي',
    required this.flagAsset,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          decoration: BoxDecoration(
            border: Border.all(color: AppColors.border(context), width: 0.5),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 16,
                height: 16,
                child: flagAsset != null
                    ? AppSvgImage.asset(
                        flagAsset!,
                        width: 16,
                        height: 16,
                        fit: BoxFit.cover,
                      )
                    : const ColoredBox(color: AppColors.flagRed),
              ),
              const SizedBox(width: 4),
              Text(label, style: AppTextStyles.languageChipLabel(context)),
            ],
          ),
        ),
      ),
    );
  }
}
