import 'package:flutter/material.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';

class AuthPrimaryButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final double height;

  /// Optional icon after the label (e.g. onboarding arrow). Follows ambient
  /// [Directionality] unless [preserveContentOrder] is true.
  final Widget? trailing;

  /// When true, label then [trailing] stay in LTR order regardless of locale.
  final bool preserveContentOrder;

  const AuthPrimaryButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.height = 48,
    this.trailing,
    this.preserveContentOrder = false,
  });

  @override
  Widget build(BuildContext context) {
    final row = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: AppTextStyles.primaryButtonLabel,
        ),
        if (trailing != null) ...[
          const SizedBox(width: 8),
          trailing!,
        ],
      ],
    );

    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.text,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: preserveContentOrder
            ? Directionality(
                textDirection: TextDirection.ltr,
                child: row,
              )
            : row,
      ),
    );
  }
}
