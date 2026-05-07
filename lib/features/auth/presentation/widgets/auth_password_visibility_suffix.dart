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
      style: IconButton.styleFrom(
        foregroundColor: AppColors.hint,
        padding: EdgeInsets.zero,
        minimumSize: const Size(40, 40),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      icon: Icon(
        isVisible ? Icons.visibility_outlined : Icons.visibility_off_outlined,
        size: 20,
        color: AppColors.hint,
      ),
    );
  }
}
