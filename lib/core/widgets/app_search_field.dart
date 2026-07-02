import 'package:flutter/material.dart';

import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/app_radius.dart';
import 'package:food_user_app/core/theme/app_spacing.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/app_media.dart';

class AppSearchField extends StatelessWidget {
  const AppSearchField({
    required this.controller,
    required this.hint,
    super.key,
    this.focusNode,
    this.onChanged,
    this.onClear,
    this.isLoading = false,
    this.height = 40,
    this.iconAsset,
    this.iconGap = AppSpacing.sm,
    this.horizontalPadding = 12,
    this.showClearButton = false,
    this.loadingSize = 18,
    this.loadingStrokeWidth = 2,
    this.hintColor,
    this.textStyle,
  });

  final TextEditingController controller;
  final FocusNode? focusNode;
  final String hint;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onClear;
  final bool isLoading;
  final double height;
  final String? iconAsset;
  final double iconGap;
  final double horizontalPadding;
  final bool showClearButton;
  final double loadingSize;
  final double loadingStrokeWidth;
  final Color? hintColor;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    final hasText = controller.text.isNotEmpty;

    return Container(
      height: height,
      padding: EdgeInsetsDirectional.symmetric(horizontal: horizontalPadding),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard(context),
        borderRadius: const BorderRadius.all(AppRadius.sm),
        border: Border.all(color: AppColors.border(context), width: 0.5),
      ),
      child: Row(
        children: [
          _SearchIcon(iconAsset: iconAsset),
          SizedBox(width: iconGap),
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              onChanged: onChanged,
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.search,
              cursorColor: AppColors.cursor(context),
              style:
                  textStyle ??
                  AppTextStyles.inputText(
                    context,
                  ).copyWith(fontSize: 12, height: 1.3),
              decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                contentPadding: EdgeInsetsDirectional.zero,
                hintText: hint,
                hintStyle: AppTextStyles.inputHint(context).copyWith(
                  color: hintColor,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                ),
              ),
            ),
          ),
          if (isLoading)
            SizedBox(
              width: loadingSize,
              height: loadingSize,
              child: CircularProgressIndicator(
                strokeWidth: loadingStrokeWidth,
                color: AppColors.paragraph(context),
              ),
            )
          else if (showClearButton && hasText && onClear != null)
            IconButton(
              onPressed: onClear,
              style: IconButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: const Size(36, 36),
                padding: EdgeInsets.zero,
              ),
              icon: Icon(
                Icons.close_rounded,
                size: 18,
                color: AppColors.paragraph(context),
              ),
            ),
        ],
      ),
    );
  }
}

class _SearchIcon extends StatelessWidget {
  const _SearchIcon({required this.iconAsset});

  final String? iconAsset;

  @override
  Widget build(BuildContext context) {
    if (iconAsset == null) {
      return Icon(
        Icons.search_rounded,
        color: AppColors.hint(context),
        size: 20,
      );
    }

    return AppSvgImage.asset(
      iconAsset!,
      width: 16,
      height: 16,
      color: AppColors.paragraph(context),
    );
  }
}
