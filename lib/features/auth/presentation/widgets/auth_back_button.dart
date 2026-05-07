import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_user_app/core/theme/app_colors.dart';

class AuthBackButton extends StatelessWidget {
  const AuthBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: SizedBox(
        width: 40,
        height: 40,
        child: InkWell(
          borderRadius: BorderRadius.circular(999),
          onTap: () => context.pop(),
          child: const Icon(
            Icons.arrow_back_ios_new,
            size: 24,
            color: AppColors.onSurface,
          ),
        ),
      ),
    );
  }
}
