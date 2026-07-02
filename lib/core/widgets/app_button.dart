import 'package:flutter/material.dart';

import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/app_radius.dart';
import 'package:food_user_app/core/theme/app_spacing.dart';
import 'package:food_user_app/core/theme/text_styles.dart';

class AppButton extends StatelessWidget {
  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isLoading = false,
    this.height = 48,
    this.backgroundColor,
    this.foregroundColor = AppColors.text,
    this.borderColor,
    this.icon,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;
  final double height;
  final Color? backgroundColor;
  final Color foregroundColor;
  final Color? borderColor;
  final Widget? icon;

  @override
  Widget build(BuildContext context) {
    final enabled = onPressed != null && !isLoading;
    final bg = backgroundColor ?? AppColors.primary;
    final effectiveForeground = enabled
        ? foregroundColor
        : foregroundColor.withValues(alpha: 0.55);

    return SizedBox(
      height: height,
      width: double.infinity,
      child: Material(
        color: enabled ? bg : bg.withValues(alpha: 0.55),
        borderRadius: const BorderRadius.all(AppRadius.sm),
        child: InkWell(
          onTap: enabled ? onPressed : null,
          borderRadius: const BorderRadius.all(AppRadius.sm),
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(AppRadius.sm),
              border: borderColor == null
                  ? null
                  : Border.all(color: borderColor!, width: 0.5),
            ),
            child: isLoading
                ? SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      color: effectiveForeground,
                    ),
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      if (icon != null) ...[
                        IconTheme(
                          data: IconThemeData(
                            color: effectiveForeground,
                            size: 20,
                          ),
                          child: icon!,
                        ),
                        const SizedBox(width: AppSpacing.sm),
                      ],
                      Flexible(
                        child: Text(
                          label,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.primaryButtonLabel.copyWith(
                            color: effectiveForeground,
                          ),
                        ),
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }
}
