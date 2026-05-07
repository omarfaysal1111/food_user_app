import 'package:flutter/material.dart';
import 'package:food_user_app/core/theme/app_colors.dart';

class AuthPasswordVisibilitySuffix extends StatelessWidget {
  final bool isVisible;
  final VoidCallback onPressed;

  const AuthPasswordVisibilitySuffix({
    super.key,
    required this.isVisible,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        isVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
        size: 20,
        color: AppColors.iconMuted(context),
      ),
    );
  }
}
