import 'package:flutter/material.dart';

import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class DiscountPointsScreen extends StatelessWidget {
  const DiscountPointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final title = AppLocalizations.of(context)!.accountDiscountPoints;

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Center(
        child: Text(title, style: AppTextStyles.homeHeadline(context)),
      ),
    );
  }
}
