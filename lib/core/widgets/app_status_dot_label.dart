import 'package:flutter/material.dart';

import 'package:food_user_app/core/theme/app_radius.dart';
import 'package:food_user_app/core/theme/text_styles.dart';

class AppStatusDotLabel extends StatelessWidget {
  const AppStatusDotLabel({
    required this.label,
    required this.color,
    this.gap = 2,
    this.dotSize = 4,
    this.fontSize = 10,
    super.key,
  });

  final String label;
  final Color color;
  final double gap;
  final double dotSize;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final dot = Container(
      width: dotSize,
      height: dotSize,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(AppRadius.full),
      ),
    );
    final gapWidget = SizedBox(width: gap);
    final labelWidget = Flexible(
      child: Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: AppTextStyles.caption(
          context,
        ).copyWith(color: color, fontSize: fontSize, height: 1.25),
      ),
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      textDirection: TextDirection.ltr,
      children: isArabic
          ? [labelWidget, gapWidget, dot]
          : [dot, gapWidget, labelWidget],
    );
  }
}
