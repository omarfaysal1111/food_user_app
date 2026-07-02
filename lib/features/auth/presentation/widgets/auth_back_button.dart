import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/widgets/app_directional_icons.dart';

class AuthBackButton extends StatelessWidget {
  const AuthBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: SizedBox(
        width: 40,
        height: 40,
        child: InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: () => context.pop(),
          child: Icon(
            AppDirectionalIcons.backArrow(context),
            size: 24,
            color: AppColors.onSurface(context),
          ),
        ),
      ),
    );
  }
}
