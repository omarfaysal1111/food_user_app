import 'package:flutter/material.dart';

import 'package:food_user_app/core/theme/app_colors.dart';

class RestaurantRateScreen extends StatelessWidget {
  const RestaurantRateScreen({this.restaurantId = 'az-al-sham', super.key});

  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground(context),
      appBar: AppBar(title: const Text('التقييمات')),
      body: const Center(
        child: Text('جاري ربط البيانات بالـ API...'),
      ),
    );
  }
}
