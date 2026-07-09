import 'package:flutter/material.dart';

import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class RestaurantRateScreen extends StatelessWidget {
  const RestaurantRateScreen({this.restaurantId = 'az-al-sham', super.key});

  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground(context),
      appBar: AppBar(title: Text(l10n.rateOrderTitle)),
      body: Center(
        child: Text(l10n.connectingToApi),
      ),
    );
  }
}
