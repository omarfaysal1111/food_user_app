import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/app_media.dart';
import 'package:food_user_app/features/restaurant/domain/entities/menu_item.dart';

class ProductCard extends StatelessWidget {
  final MenuItem item;

  const ProductCard({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    // Ensuring RTL context for the text alignment
    return Directionality(
      textDirection: TextDirection.rtl,
      child: InkWell(
        onTap: () {
          context.push(RouteNames.menuItemDetail, extra: item);
        },
        borderRadius: BorderRadius.circular(12),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.surfaceCard(context),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.05),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Top: Image Stack
              SizedBox(
                height: 92, // To leave 71px for text area (Total 164 - 92 - 1 = 71)
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                      child: item.imageUrl.isNotEmpty
                          ? AppNetworkImage(item.imageUrl, fit: BoxFit.cover)
                          : AppRasterImage.asset(
                              AppAssets.productBurgerCombo,
                              fit: BoxFit.cover,
                            ),
                    ),
                    // Arrow Button inside the image
                    Positioned(
                      left: 8,
                      bottom: 8,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: AppColors.surfaceCard(context),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.1),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Center(
                          child: Image.asset(
                            AppAssets.restaurantProductCardArrowIcon,
                            width: 16,
                            height: 16,
                            color: AppColors.onSurface(context),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              
              // Middle: Divider
              Divider(height: 1, thickness: 1, color: Colors.grey.shade200),
              
              // Bottom: Text Area
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        textAlign: TextAlign.right,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTextStyles.body(context).copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: AppColors.onSurface(context),
                          height: 1.2,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '${item.price.toStringAsFixed(0)} ج.م',
                        textAlign: TextAlign.right,
                        style: AppTextStyles.body(context).copyWith(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                          color: AppColors.onSurface(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
