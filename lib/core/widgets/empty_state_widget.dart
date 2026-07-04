import 'package:flutter/material.dart';
import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/app_media.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

/// A reusable, responsive widget to display when there are no list/search/API results.
class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({
    super.key,
    this.message,
    this.imageWidth = 100,
    this.imageHeight = 100,
  });

  /// Optional custom message to display under the placeholder image.
  /// If null, defaults to localized "No results available" / "لا يوجد نتائج متاحه".
  final String? message;

  /// Width of the placeholder image.
  final double imageWidth;

  /// Height of the placeholder image.
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final displayMessage = message ?? l10n?.serviceNoResultsAvailable ?? 'No results available';

    return LayoutBuilder(
      builder: (context, constraints) {
        // Adjust padding and constraints based on available height/width
        final isCompact = constraints.maxHeight < 250;
        final padding = isCompact ? 12.0 : 24.0;
        final spacing = isCompact ? 12.0 : 20.0;

        return Center(
          child: SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(padding),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  AppRasterImage.asset(
                    AppAssets.serviceNotFoundFolder,
                    width: imageWidth,
                    height: imageHeight,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: spacing),
                  Text(
                    displayMessage,
                    textAlign: TextAlign.center,
                    style: AppTextStyles.body(context).copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.hint(context),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
