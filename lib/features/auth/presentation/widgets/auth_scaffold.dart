import 'package:flutter/material.dart';
import 'package:food_user_app/core/theme/app_colors.dart';

class AuthScaffold extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const AuthScaffold({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.fromLTRB(16, 24, 16, 24),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground(context),
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: () => FocusScope.of(context).unfocus(),
            child: SingleChildScrollView(
              padding: padding,
              keyboardDismissBehavior:
                  ScrollViewKeyboardDismissBehavior.onDrag,
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
