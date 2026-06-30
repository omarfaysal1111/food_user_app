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
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: _RestaurantTopSection(
              hero: _RestaurantHero(
                title: copy.title,
                restaurantId: restaurant.id,
              ),
              infoCard: _RestaurantInfoCard(
                restaurant: restaurant,
                locale: locale,
                copy: copy,
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsetsDirectional.fromSTEB(
              AppSpacing.md,
              8,
              AppSpacing.md,
              24,
            ),
            sliver: SliverList.list(
              children: [
                _CouponStrip(copy: copy),
                const SizedBox(height: 18),
                _MenuTabs(categories: restaurant.categories(locale)),
                const SizedBox(height: 20),
                _MenuGrid(items: restaurant.menu),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _RestaurantTopSection extends StatelessWidget {
  const _RestaurantTopSection({required this.hero, required this.infoCard});

  final Widget hero;
  final Widget infoCard;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 244,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(bottom: 64, child: hero),
          PositionedDirectional(top: 128, start: 16, end: 16, child: infoCard),
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
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final actions = Row(
      textDirection: TextDirection.ltr,
      children: isArabic
          ? [
              _GlassIconButton(
                assetName: AppAssets.restaurantSearchIcon,
                iconWidth: 24,
                iconHeight: 24,
                onTap: () => context.push(
                  _routeWithId(RouteNames.restaurantSearch, restaurantId),
                ),
              ),
              const SizedBox(width: 12),
              _GlassIconButton(
                assetName: AppAssets.restaurantFavoriteIcon,
                iconWidth: 24,
                iconHeight: 24,
                onTap: () => _showDesignSnackBar(
                  context,
                  _RestaurantDetailCopy.of(context).favoriteTodo,
                ),
              ),
            ]
          : [
              _GlassIconButton(
                assetName: AppAssets.restaurantFavoriteIcon,
                iconWidth: 24,
                iconHeight: 24,
                onTap: () => _showDesignSnackBar(
                  context,
                  _RestaurantDetailCopy.of(context).favoriteTodo,
                ),
              ),
              const SizedBox(width: 12),
              _GlassIconButton(
                assetName: AppAssets.restaurantSearchIcon,
                iconWidth: 24,
                iconHeight: 24,
                onTap: () => context.push(
                  _routeWithId(RouteNames.restaurantSearch, restaurantId),
                ),
              ),
            ],
    );
    final titleText = Text(
      title,
      style: AppTextStyles.heading4(
        context,
      ).copyWith(color: Colors.white, fontSize: 16, height: 1.4),
    );
    final heroBackButton = _GlassIconButton(
      assetName: AppAssets.restaurantHeaderBackIcon,
      mirrorAsset: !isArabic,
      size: 28,
      iconWidth: 9,
      iconHeight: 16,
      onTap: () => context.pop(),
    );
    final titleAction = Row(
      textDirection: TextDirection.ltr,
      children: isArabic
          ? [titleText, const SizedBox(width: AppSpacing.xs), heroBackButton]
          : [heroBackButton, const SizedBox(width: AppSpacing.xs), titleText],
    );
    return SizedBox(
      height: 180,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(color: AppColors.primary),
          const Positioned(
            left: 0,
            bottom: -20,
            child: AppRasterImage.asset(
              AppAssets.restaurantHeroFries,
              width: 171,
              height: 162,
              fit: BoxFit.contain,
            ),
          ),
          const Positioned(
            right: -14,
            bottom: -12,
            child: AppRasterImage.asset(
              AppAssets.restaurantHeroBurger,
              width: 176,
              height: 120,
              fit: BoxFit.contain,
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
                textDirection: TextDirection.ltr,
                children: isArabic
                    ? [actions, titleAction]
                    : [titleAction, actions],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RestaurantInfoCard extends StatelessWidget {
  const _RestaurantInfoCard({
    required this.restaurant,
    required this.locale,
    required this.copy,
  });

  final MockRestaurant restaurant;
  final Locale locale;
  final _RestaurantDetailCopy copy;

  @override
  Widget build(BuildContext context) {
    final isArabic = locale.languageCode == 'ar';
    final backButton = IconButton(
      onPressed: () => context.pop(),
      visualDensity: VisualDensity.compact,
      style: IconButton.styleFrom(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        minimumSize: const Size(28, 28),
        padding: EdgeInsets.zero,
      ),
      icon: Transform.scale(
        scaleX: isArabic ? 1 : -1,
        child: const AppRasterImage.asset(
          AppAssets.restaurantInfoBackIcon,
          width: 20,
          height: 20,
        ),
      ),
    );
    final logo = ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: AppRasterImage.asset(
        restaurant.logoAsset,
        width: 40,
        height: 40,
        fit: BoxFit.cover,
      ),
    );
    final restaurantText = Flexible(
      flex: 8,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: Column(
          crossAxisAlignment: isArabic
              ? CrossAxisAlignment.end
              : CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: isArabic
                  ? MainAxisAlignment.end
                  : MainAxisAlignment.start,
              children: [
                if (isArabic) _StatusPill(label: copy.available),
                if (isArabic) const SizedBox(width: AppSpacing.sm),
                Flexible(
                  child: Text(
                    restaurant.name(locale),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: isArabic ? TextAlign.end : TextAlign.start,
                    style: AppTextStyles.body(context).copyWith(
                      fontSize: 14,
                      height: 1.45,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                if (!isArabic) const SizedBox(width: AppSpacing.sm),
                if (!isArabic) _StatusPill(label: copy.available),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              restaurant.description(locale),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: isArabic ? TextAlign.end : TextAlign.start,
              style: AppTextStyles.caption(
                context,
              ).copyWith(fontSize: 9, height: 1.25),
            ),
          ],
        ),
      ),
    );

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard(context),
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 2),
        ],
      ),
      child: Column(
        children: [
          Row(
            textDirection: TextDirection.ltr,
            children: isArabic
                ? [
                    backButton,
                    const Spacer(),
                    restaurantText,
                    const SizedBox(width: AppSpacing.sm),
                    logo,
                  ]
                : [
                    logo,
                    const SizedBox(width: AppSpacing.sm),
                    restaurantText,
                    const Spacer(),
                    backButton,
                  ],
          ),
          const SizedBox(height: 12),
          Row(
            textDirection: TextDirection.ltr,
            children: isArabic
                ? [
                    _RatingMetric(restaurant: restaurant),
                    _VerticalDivider(),
                    Expanded(
                      child: _InfoMetric(
                        assetName: AppAssets.restaurantDeliveryScooterIcon,
                        label: restaurant.deliveryFee(locale),
                        iconOnRight: true,
                      ),
                    ),
                    _VerticalDivider(),
                    Expanded(
                      child: _InfoMetric(
                        assetName: AppAssets.restaurantWallClockIcon,
                        label: restaurant.deliveryTime(locale),
                        iconOnRight: true,
                      ),
                    ),
                  ]
                : [
                    Expanded(
                      child: _InfoMetric(
                        assetName: AppAssets.restaurantWallClockIcon,
                        label: restaurant.deliveryTime(locale),
                        iconOnRight: false,
                      ),
                    ),
                    _VerticalDivider(),
                    Expanded(
                      child: _InfoMetric(
                        assetName: AppAssets.restaurantDeliveryScooterIcon,
                        label: restaurant.deliveryFee(locale),
                        iconOnRight: false,
                      ),
                    ),
                    _VerticalDivider(),
                    _RatingMetric(restaurant: restaurant),
                  ],
          ),
        ],
      ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: AppTextStyles.caption(
            context,
          ).copyWith(color: AppColors.success, fontSize: 10, height: 1.25),
        ),
        const SizedBox(width: 4),
        Container(
          width: 4,
          height: 4,
          decoration: const BoxDecoration(
            color: AppColors.success,
            shape: BoxShape.circle,
          ),
        ),
      ],
    );
  }
}

class _InfoMetric extends StatelessWidget {
  const _InfoMetric({
    required this.assetName,
    required this.label,
    required this.iconOnRight,
  });

  final String assetName;
  final String label;
  final bool iconOnRight;

  @override
  Widget build(BuildContext context) {
    final children = [
      Text(
        label,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.body(context).copyWith(fontSize: 12, height: 1.3),
      ),
      const SizedBox(width: 4),
      _RestaurantIconAsset(assetName: assetName, size: 20),
    ];

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      textDirection: TextDirection.ltr,
      children: iconOnRight ? children : children.reversed.toList(),
    );
  }
}

class _RestaurantIconAsset extends StatelessWidget {
  const _RestaurantIconAsset({required this.assetName, required this.size});

  final String assetName;
  final double size;

  @override
  Widget build(BuildContext context) {
    if (assetName.endsWith('.svg')) {
      return AppSvgImage.asset(assetName, width: size, height: size);
    }

    return AppRasterImage.asset(assetName, width: size, height: size);
  }
}

class _DashedVerticalDivider extends StatelessWidget {
  const _DashedVerticalDivider({required this.color});

  final Color color;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(1, 20),
      painter: _DashedVerticalDividerPainter(color),
    );
  }
}

class _DashedVerticalDividerPainter extends CustomPainter {
  const _DashedVerticalDividerPainter(this.color);

  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 0.5
      ..strokeCap = StrokeCap.round;
    const dashHeight = 3.0;
    const gap = 2.0;
    var y = 0.0;
    while (y < size.height) {
      canvas.drawLine(
        Offset(size.width / 2, y),
        Offset(size.width / 2, (y + dashHeight).clamp(0, size.height)),
        paint,
      );
      y += dashHeight + gap;
    }
  }

  @override
  bool shouldRepaint(covariant _DashedVerticalDividerPainter oldDelegate) =>
      oldDelegate.color != color;
}

class _RatingMetric extends StatelessWidget {
  const _RatingMetric({required this.restaurant});

  final MockRestaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: () => context.push(
          _routeWithId(RouteNames.restaurantRate, restaurant.id),
        ),
        borderRadius: const BorderRadius.all(AppRadius.sm),
        child: _InfoMetric(
          assetName: AppAssets.favoriteStarIcon,
          label:
              '${restaurant.rating.toStringAsFixed(1)} (${restaurant.ratingCount})',
          iconOnRight: true,
        ),
      ),
    );
  }
}

class _VerticalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(width: 0.5, height: 20, color: AppColors.border(context));
  }
}

class _GlassIconButton extends StatelessWidget {
  const _GlassIconButton({
    required this.onTap,
    required this.assetName,
    this.mirrorAsset = false,
    this.size = 32,
    this.iconWidth,
    this.iconHeight,
  });

  final String assetName;
  final bool mirrorAsset;
  final VoidCallback onTap;
  final double size;
  final double? iconWidth;
  final double? iconHeight;

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
          child: Center(
            child: Transform.scale(
              scaleX: mirrorAsset ? -1 : 1,
              child: AppRasterImage.asset(
                assetName,
                width: iconWidth,
                height: iconHeight,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _CouponStrip extends StatelessWidget {
  const _CouponStrip({required this.copy});

  final _RestaurantDetailCopy copy;

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';

    return SizedBox(
      height: 42,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          reverse: isArabic,
          itemCount: 2,
          separatorBuilder: (_, _) => const SizedBox(width: 12),
          itemBuilder: (context, index) => _CouponCard(copy: copy),
        ),
      ),
    );
  }
}

class _CouponCard extends StatelessWidget {
  const _CouponCard({required this.copy});

  final _RestaurantDetailCopy copy;

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    const icon = AppRasterImage.asset(
      AppAssets.restaurantCouponIcon,
      width: 20,
      height: 20,
    );
    final divider = _DashedVerticalDivider(color: AppColors.primary);
    final discountText = Text(
      copy.discountSubtitle,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: isArabic ? TextAlign.right : TextAlign.left,
      textDirection: isArabic ? TextDirection.rtl : TextDirection.ltr,
      style: AppTextStyles.caption(context).copyWith(
        color: AppColors.onSurface(context),
        fontSize: 10,
        height: 1.25,
      ),
    );
    final viewProducts = Text(
      copy.viewProducts,
      style: AppTextStyles.textLinkUnderline(context).copyWith(
        color: AppColors.primary,
        decorationColor: AppColors.primary,
        fontSize: 10,
        height: 1.25,
      ),
    );

    return Container(
      width: 272,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard(context),
        borderRadius: const BorderRadius.all(AppRadius.sm),
        border: Border.all(color: AppColors.primary, width: 0.5),
      ),
      child: Row(
        textDirection: TextDirection.ltr,
        children: isArabic
            ? [
                viewProducts,
                const SizedBox(width: 18),
                Expanded(child: discountText),
                const SizedBox(width: AppSpacing.sm),
                divider,
                const SizedBox(width: AppSpacing.sm),
                icon,
              ]
            : [
                icon,
                const SizedBox(width: AppSpacing.sm),
                divider,
                const SizedBox(width: AppSpacing.sm),
                Expanded(child: discountText),
                const SizedBox(width: 18),
                viewProducts,
              ],
      ),
    );
  }
}

class _MenuTabs extends StatelessWidget {
  const _MenuTabs({required this.categories});

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final orderedCategories = isArabic ? categories.reversed : categories;

    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.border(context), width: 0.5),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        textDirection: TextDirection.ltr,
        children: [
          for (final category in orderedCategories)
            _MenuTab(label: category, selected: category == categories.first),
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
      width: 60,
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
    return Directionality(
      textDirection: TextDirection.ltr,
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 8,
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
      ),
    );
  }
}

class _MenuItemCard extends StatelessWidget {
  const _MenuItemCard({required this.item});

  final MockMenuItem item;

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
                        child: AppRasterImage.asset(
                          item.imageAsset,
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
                              color: Colors.black.withValues(alpha: 0.08),
                              blurRadius: 2,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Transform.scale(
                            scaleX: isArabic ? 1 : -1,
                            child: const AppRasterImage.asset(
                              AppAssets.restaurantProductCardArrowIcon,
                              width: 9,
                              height: 16,
                            ),
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
                          item.name(locale),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          textAlign: isArabic ? TextAlign.end : TextAlign.start,
                          style: AppTextStyles.caption(context).copyWith(
                            fontSize: 12,
                            height: 1.3,
                            color: AppColors.onSurface(context),
                          ),
                        ),
                        Text(
                          item.priceLabel(locale),
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
    required this.available,
    required this.discountSubtitle,
    required this.viewProducts,
    required this.favoriteTodo,
  });

  final String title;
  final String available;
  final String discountSubtitle;
  final String viewProducts;
  final String favoriteTodo;

  static _RestaurantDetailCopy of(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return isArabic ? _arabic : _english;
  }

  static const _arabic = _RestaurantDetailCopy(
    title: 'تفاصيل المطعم',
    available: 'متاح',
    discountSubtitle: '50 %خصم على بعض المنتج',
    viewProducts: 'عرض المنتجات',
    favoriteTodo: 'المفضلة غير متاحة حالياً',
  );

  static const _english = _RestaurantDetailCopy(
    title: 'Restaurant details',
    available: 'Open',
    discountSubtitle: '50% off selected products',
    viewProducts: 'View products',
    favoriteTodo: 'Favorites are not available yet',
  );
}
