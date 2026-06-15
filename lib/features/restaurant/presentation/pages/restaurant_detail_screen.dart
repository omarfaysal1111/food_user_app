import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/app_radius.dart';
import 'package:food_user_app/core/theme/app_spacing.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/app_media.dart';
import 'package:food_user_app/features/cart/domain/entities/cart_item.dart';
import 'package:food_user_app/features/restaurant/presentation/mock/restaurant_mock_data.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({this.restaurantId = 'az-al-sham', super.key});

  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final copy = _RestaurantDetailCopy.of(context);
    final restaurant = mockRestaurant;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground(context),
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: _RestaurantHero(
                  title: copy.title,
                  restaurantId: restaurant.id,
                ),
              ),
              SliverPadding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                  AppSpacing.md,
                  42,
                  AppSpacing.md,
                  24,
                ),
                sliver: SliverList.list(
                  children: [
                    _RestaurantIntro(
                      restaurant: restaurant,
                      locale: locale,
                      copy: copy,
                    ),
                    const SizedBox(height: 20),
                    _CouponRow(copy: copy),
                    const SizedBox(height: 20),
                    _MenuTabs(categories: restaurant.categories(locale)),
                    const SizedBox(height: 20),
                    _MenuGrid(items: restaurant.menu),
                  ],
                ),
              ),
            ],
          ),
          PositionedDirectional(
            top: 168,
            start: 0,
            end: 0,
            child: Center(
              child: _RestaurantLogo(imageAsset: restaurant.logoAsset),
            ),
          ),
        ],
      ),
    );
  }
}

class _RestaurantHero extends StatelessWidget {
  const _RestaurantHero({required this.title, required this.restaurantId});

  final String title;
  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            color: AppColors.primary,
            child: Row(
              children: const [
                Expanded(
                  child: AppRasterImage.asset(
                    AppAssets.productBurgerCombo,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          Container(color: Colors.black.withValues(alpha: 0.2)),
          SafeArea(
            bottom: false,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 18, 16, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      _GlassIconButton(
                        icon: Icons.search_rounded,
                        onTap: () => context.push(
                          _routeWithId(
                            RouteNames.restaurantSearch,
                            restaurantId,
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      _GlassIconButton(
                        icon: Icons.favorite_border_rounded,
                        onTap: () => _showDesignSnackBar(
                          context,
                          _RestaurantDetailCopy.of(context).favoriteTodo,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.heading4(context).copyWith(
                          color: Colors.white,
                          fontSize: 16,
                          height: 1.4,
                        ),
                      ),
                      const SizedBox(width: AppSpacing.xs),
                      _GlassIconButton(
                        icon: Icons.arrow_back_ios_new_rounded,
                        size: 28,
                        iconSize: 18,
                        onTap: () => context.pop(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GlassIconButton extends StatelessWidget {
  const _GlassIconButton({
    required this.icon,
    required this.onTap,
    this.size = 32,
    this.iconSize = 22,
  });

  final IconData icon;
  final VoidCallback onTap;
  final double size;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white.withValues(alpha: 0.1),
      borderRadius: const BorderRadius.all(AppRadius.sm),
      child: InkWell(
        onTap: onTap,
        borderRadius: const BorderRadius.all(AppRadius.sm),
        child: SizedBox(
          width: size,
          height: size,
          child: Icon(icon, color: Colors.white, size: iconSize),
        ),
      ),
    );
  }
}

class _RestaurantLogo extends StatelessWidget {
  const _RestaurantLogo({required this.imageAsset});

  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68,
      height: 68,
      padding: const EdgeInsetsDirectional.all(2),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard(context),
        borderRadius: const BorderRadius.all(AppRadius.full),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 6),
        ],
      ),
      child: ClipOval(
        child: AppRasterImage.asset(imageAsset, fit: BoxFit.cover),
      ),
    );
  }
}

class _RestaurantIntro extends StatelessWidget {
  const _RestaurantIntro({
    required this.restaurant,
    required this.locale,
    required this.copy,
  });

  final MockRestaurant restaurant;
  final Locale locale;
  final _RestaurantDetailCopy copy;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          restaurant.name(locale),
          style: AppTextStyles.body(
            context,
          ).copyWith(fontSize: 14, height: 1.25),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          restaurant.description(locale),
          textAlign: TextAlign.center,
          style: AppTextStyles.caption(
            context,
          ).copyWith(fontSize: 12, height: 1.3),
        ),
        const SizedBox(height: 12),
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10,
          runSpacing: AppSpacing.sm,
          children: [
            GestureDetector(
              onTap: () => context.push(
                _routeWithId(RouteNames.restaurantRate, restaurant.id),
              ),
              child: _Metric(
                icon: Icons.star_rounded,
                iconColor: const Color(0xFFFFB800),
                label:
                    '${restaurant.rating.toStringAsFixed(1)} (${restaurant.ratingCount})',
              ),
            ),
            _Dot(),
            _Metric(
              icon: Icons.schedule_rounded,
              iconColor: AppColors.success,
              label: restaurant.deliveryTime(locale),
            ),
            _Dot(),
            _Metric(
              icon: Icons.delivery_dining_rounded,
              iconColor: AppColors.primary,
              label: restaurant.deliveryFee(locale),
            ),
          ],
        ),
      ],
    );
  }
}

class _Metric extends StatelessWidget {
  const _Metric({
    required this.icon,
    required this.iconColor,
    required this.label,
  });

  final IconData icon;
  final Color iconColor;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 16, color: iconColor),
        const SizedBox(width: 4),
        Text(
          label,
          style: AppTextStyles.body(
            context,
          ).copyWith(fontSize: 12, height: 1.3),
        ),
      ],
    );
  }
}

class _Dot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: 4,
      decoration: const BoxDecoration(
        color: Color(0xFF1B1B1B),
        shape: BoxShape.circle,
      ),
    );
  }
}

class _CouponRow extends StatelessWidget {
  const _CouponRow({required this.copy});

  final _RestaurantDetailCopy copy;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: _CouponCard(copy: copy)),
        const SizedBox(width: 12),
        Expanded(child: _CouponCard(copy: copy)),
      ],
    );
  }
}

class _CouponCard extends StatelessWidget {
  const _CouponCard({required this.copy});

  final _RestaurantDetailCopy copy;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Container(
          margin: const EdgeInsetsDirectional.only(top: 13),
          height: 91,
          padding: const EdgeInsetsDirectional.fromSTEB(14, 28, 14, 10),
          decoration: BoxDecoration(
            color: AppColors.surfaceCard(context),
            borderRadius: const BorderRadius.all(AppRadius.md),
            border: Border.all(color: AppColors.border(context), width: 0.5),
          ),
          child: Column(
            children: [
              Text(
                copy.discountTitle,
                style: AppTextStyles.body(
                  context,
                ).copyWith(fontSize: 14, height: 1.25),
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                copy.discountSubtitle,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: AppTextStyles.caption(
                  context,
                ).copyWith(fontSize: 10, height: 1.25),
              ),
            ],
          ),
        ),
        Container(
          width: 24,
          height: 24,
          decoration: const BoxDecoration(
            color: AppColors.primary,
            shape: BoxShape.circle,
          ),
          child: const Icon(Icons.local_offer, color: Colors.white, size: 14),
        ),
      ],
    );
  }
}

class _MenuTabs extends StatelessWidget {
  const _MenuTabs({required this.categories});

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.border(context), width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          for (var i = 0; i < categories.length; i++)
            _MenuTab(label: categories[i], selected: i == 0),
        ],
      ),
    );
  }
}

class _MenuTab extends StatelessWidget {
  const _MenuTab({required this.label, required this.selected});

  final String label;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 64,
      child: Column(
        children: [
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTextStyles.caption(context).copyWith(
              fontSize: 12,
              height: 1.3,
              color: selected
                  ? AppColors.onSurface(context)
                  : AppColors.paragraph(context),
              fontWeight: selected ? FontWeight.w500 : FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: 1.5,
            width: double.infinity,
            decoration: BoxDecoration(
              color: selected
                  ? AppColors.onSurface(context)
                  : Colors.transparent,
              borderRadius: const BorderRadius.vertical(top: AppRadius.full),
            ),
          ),
        ],
      ),
    );
  }
}

class _MenuGrid extends StatelessWidget {
  const _MenuGrid({required this.items});

  final List<MockMenuItem> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length + 2,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 165.5 / 165,
      ),
      itemBuilder: (context, index) {
        final item = items[index % items.length];
        return _MenuItemCard(item: item);
      },
    );
  }
}

class _MenuItemCard extends StatelessWidget {
  const _MenuItemCard({required this.item});

  final MockMenuItem item;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: AppRadius.md,
                        ),
                        child: AppRasterImage.asset(
                          item.imageAsset,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    PositionedDirectional(
                      start: AppSpacing.sm,
                      bottom: AppSpacing.sm,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: AppColors.surfaceCard(context),
                          borderRadius: const BorderRadius.all(AppRadius.sm),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: const Icon(Icons.add_rounded, size: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name(locale),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.caption(context).copyWith(
                        fontSize: 12,
                        height: 1.3,
                        color: AppColors.onSurface(context),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      item.priceLabel(locale),
                      style: AppTextStyles.body(
                        context,
                      ).copyWith(fontSize: 12, height: 1.3),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _openProductDetails(
  BuildContext context,
  MockMenuItem item,
  Locale locale,
) {
  context.push(
    RouteNames.productDetails,
    extra: CartItem(
      id: item.id,
      name: item.name(locale),
      description: item.description(locale),
      price: item.price,
      imageAsset: item.imageAsset,
    ),
  );
}

String _routeWithId(String route, String id) => route.replaceFirst(':id', id);

void _showDesignSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(SnackBar(content: Text(message)));
}

class _RestaurantDetailCopy {
  const _RestaurantDetailCopy({
    required this.title,
    required this.discountTitle,
    required this.discountSubtitle,
    required this.favoriteTodo,
  });

  final String title;
  final String discountTitle;
  final String discountSubtitle;
  final String favoriteTodo;

  static _RestaurantDetailCopy of(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return isArabic ? _arabic : _english;
  }

  static const _arabic = _RestaurantDetailCopy(
    title: 'تفاصيل المطعم',
    discountTitle: 'خصم 50%',
    discountSubtitle: 'عند شراء طلب بقيمة 500 جنية او اكثر تحصل على خصم',
    favoriteTodo: 'المفضلة غير متاحة حالياً',
  );

  static const _english = _RestaurantDetailCopy(
    title: 'Restaurant details',
    discountTitle: '50% off',
    discountSubtitle: 'Get a discount when you order EGP 500 or more',
    favoriteTodo: 'Favorites are not available yet',
  );
}
