import 'package:flutter/material.dart';
import 'package:food_user_app/core/theme/text_styles.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomePlaceholderPage();
  }
}

class HomePlaceholderPage extends StatelessWidget {
  const HomePlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Center(
          child: Text(
            'الصفحة الرئيسية المؤقتة',
            style: AppTextStyles.homeHeadline(context),
          ),
        ),
      ),
    );
  }
}
