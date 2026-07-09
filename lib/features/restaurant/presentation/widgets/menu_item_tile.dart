import 'package:food_user_app/core/theme/app_radius.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/app_media.dart';
import 'package:food_user_app/features/restaurant/domain/entities/menu_item.dart';

class MenuItemTile extends StatelessWidget {
  const MenuItemTile({super.key, required this.item});

  final MenuItem item;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';

    return Material(
      color: AppColors.surfaceCard(context),
      borderRadius: const BorderRadius.all(AppRadius.md),
      child: InkWell(
        borderRadius: const BorderRadius.all(AppRadius.md),
        onTap: () => _openProductDetails(context, item, locale),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(AppRadius.md),
            border: Border.all(color: AppColors.border(context), width: 0.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: 100,
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: AppRadius.md,
                        ),
                        child: item.imageUrl.isNotEmpty
                            ? AppNetworkImage(item.imageUrl, fit: BoxFit.cover)
                            : const AppRasterImage.asset(
                                AppAssets.restaurantMenuBurgerFries1,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Positioned(
                      left: isArabic ? 8 : null,
                      right: isArabic ? null : 8,
                      bottom: 8,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: AppColors.surfaceCard(context),
                          borderRadius: const BorderRadius.all(AppRadius.sm),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.black.withValues(alpha: 0.08),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            size: 16,
                            color: AppColors.onSurface(context),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Directionality(
                    textDirection: TextDirection.ltr,
                    child: Column(
                      crossAxisAlignment: isArabic
                          ? CrossAxisAlignment.end
                          : CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          item.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.heading4(
                            context,
                          ).copyWith(fontSize: 16, height: 1.25),
                        ),
                        Text(
                          _formatPrice(item.price, locale),
                          textAlign: isArabic ? TextAlign.end : TextAlign.start,
                          style: AppTextStyles.body(
                            context,
                          ).copyWith(fontSize: 12, height: 1.3),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _formatPrice(double price, Locale locale) {
    final isArabic = locale.languageCode == 'ar';
    return isArabic
        ? '${price.toStringAsFixed(0)} ج.م'
        : 'EGP ${price.toStringAsFixed(0)}';
  }

  void _openProductDetails(BuildContext context, MenuItem item, Locale locale) {
    context.push(
      RouteNames.menuItemDetail,
      extra: item,
    );
  }
}
