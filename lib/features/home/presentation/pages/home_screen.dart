import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/app_radius.dart';
import 'package:food_user_app/core/theme/app_spacing.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/app_media.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final copy = _HomeCopy.of(context);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground(context),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: _HomeHeader(copy: copy)),
          SliverPadding(
            padding: const EdgeInsets.only(top: 22, bottom: AppSpacing.lg),
            sliver: SliverList.list(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                  ),
                  child: _CategoryStrip(copy: copy),
                ),
                const SizedBox(height: 20),
                const _PromoSlider(),
                const SizedBox(height: 18),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                  ),
                  child: _SectionHeader(title: copy.missedOffersTitle),
                ),
                const SizedBox(height: 10),
                _OfferList(copy: copy),
                const SizedBox(height: 13),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                  ),
                  child: _SectionHeader(title: copy.mostOrderedTitle),
                ),
                const SizedBox(height: 10),
                _RestaurantList(copy: copy),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _HomeHeader extends StatelessWidget {
  const _HomeHeader({required this.copy});

  final _HomeCopy copy;

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.paddingOf(context).top;

    return Container(
      height: 148 + topPadding,
      decoration: const BoxDecoration(color: AppColors.primary),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: const Opacity(
              opacity: 0.1,
              child: AppRasterImage.asset(
                AppAssets.homeHeaderDecoration,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Positioned(
            left: 0,
            right: 0,
            top: 24,
            child: AppRasterImage.asset(
              AppAssets.homeHeaderDecorativeGroup,
              height: 167,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 16 + topPadding,
            right: AppSpacing.md,
            child: _LocationRow(copy: copy),
          ),
          PositionedDirectional(
            start: AppSpacing.md,
            end: AppSpacing.md,
            bottom: 25,
            child: _SearchEntry(copy: copy),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: -1,
            child: AppRasterImage.asset(
              AppAssets.homeWaveDivider,
              height: 10,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}

class _LocationRow extends StatelessWidget {
  const _LocationRow({required this.copy});

  final _HomeCopy copy;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          copy.deliveryTo,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.left,
          style: AppTextStyles.caption(context).copyWith(
            color: Colors.white.withValues(alpha: 0.72),
            fontSize: 10,
            height: 1.25,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          textDirection: TextDirection.rtl,
          children: [
            const Icon(
              Icons.location_on_rounded,
              size: 16,
              color: Colors.white,
            ),
            const SizedBox(width: 4),
            Text(
              copy.address,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: AppTextStyles.body(
                context,
              ).copyWith(color: Colors.white, fontSize: 12, height: 1.3),
            ),
            const SizedBox(width: 4),
            const Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 16,
              color: Colors.white,
            ),
          ],
        ),
      ],
    );
  }
}

class _SearchEntry extends StatelessWidget {
  const _SearchEntry({required this.copy});

  final _HomeCopy copy;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surfaceCard(context),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        onTap: () => context.push(RouteNames.search),
        child: Container(
          height: 40,
          padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
          child: Row(
            textDirection: TextDirection.rtl,
            children: [
              const Icon(
                Icons.search_rounded,
                color: Color(0xFFB6B6B6),
                size: 18,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  copy.searchHint,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.right,
                  style: AppTextStyles.inputHint(context).copyWith(
                    color: const Color(0xFF787878),
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    height: 1.3,
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

class _CategoryStrip extends StatelessWidget {
  const _CategoryStrip({required this.copy});

  final _HomeCopy copy;

  @override
  Widget build(BuildContext context) {
    final categories = copy.categories;

    return Row(
      children: [
        for (var index = 0; index < categories.length; index++) ...[
          Expanded(child: _CategoryTile(category: categories[index])),
          if (index != categories.length - 1) const SizedBox(width: 14),
        ],
      ],
    );
  }
}

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({required this.category});

  final _HomeCategory category;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 72,
          height: 72,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: AppColors.surfaceCard(context),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: AppColors.border(context), width: 0.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.06),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Stack(
            alignment: Alignment.center,
            children: [
              const PositionedDirectional(
                top: 1,
                start: 0,
                end: 0,
                child: AppRasterImage.asset(
                  AppAssets.homeCategoryStrokeTop,
                  height: 3,
                  fit: BoxFit.fill,
                ),
              ),
              const PositionedDirectional(
                bottom: 0,
                start: 0,
                end: 0,
                child: AppRasterImage.asset(
                  AppAssets.homeCategoryStrokeBottom,
                  height: 2,
                  fit: BoxFit.fill,
                ),
              ),
              AppRasterImage.asset(category.imageAsset, width: 56, height: 56),
            ],
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          category.label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.body(context).copyWith(
            fontSize: 12,
            height: 1.3,
            color: AppColors.onSurface(context),
          ),
        ),
      ],
    );
  }
}

class _PromoSlider extends StatefulWidget {
  const _PromoSlider();

  @override
  State<_PromoSlider> createState() => _PromoSliderState();
}

class _PromoSliderState extends State<_PromoSlider> {
  late final PageController _controller;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 155,
          child: PageView.builder(
            controller: _controller,
            onPageChanged: (page) => setState(() => _currentPage = page),
            itemCount: 4,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                child: const _PromoBanner(),
              );
            },
          ),
        ),
        const SizedBox(height: 12),
        _BannerIndicator(activePage: _currentPage),
      ],
    );
  }
}

class _PromoBanner extends StatelessWidget {
  const _PromoBanner();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          const AppRasterImage.asset(
            AppAssets.homePromoBanner,
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}

class _BannerIndicator extends StatelessWidget {
  const _BannerIndicator({required this.activePage});

  final int activePage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < 4; i++) ...[
          _IndicatorDot(
            color: i == activePage
                ? AppColors.primary
                : const Color(0xFFE7E7E7),
            width: i == activePage ? 32 : 8,
          ),
          if (i != 3) const SizedBox(width: AppSpacing.sm),
        ],
      ],
    );
  }
}

class _IndicatorDot extends StatelessWidget {
  const _IndicatorDot({required this.color, this.width = 8});

  final Color color;
  final double width;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: width,
      height: 8,
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(AppRadius.full),
      ),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.heading4(
          context,
        ).copyWith(fontSize: 15, height: 1.4),
      ),
    );
  }
}

class _OfferList extends StatelessWidget {
  const _OfferList({required this.copy});

  final _HomeCopy copy;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 175,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        scrollDirection: Axis.horizontal,
        itemCount: copy.offers.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) => _OfferCard(offer: copy.offers[index]),
      ),
    );
  }
}

class _OfferCard extends StatelessWidget {
  const _OfferCard({required this.offer});

  final _HomeOffer offer;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            child: AppRasterImage.asset(
              offer.imageAsset,
              height: 110,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              ClipOval(
                child: AppRasterImage.asset(
                  AppAssets.homeRestaurantLogo,
                  width: 12,
                  height: 12,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  offer.restaurant,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.caption(context).copyWith(
                    fontSize: 8,
                    fontWeight: FontWeight.w500,
                    height: 1.25,
                    color: AppColors.paragraph(context),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          Text(
            offer.title,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: AppTextStyles.body(context).copyWith(
              fontSize: 12,
              height: 1.3,
              fontWeight: FontWeight.w400,
              color: AppColors.onSurface(context),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            offer.price,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.body(context).copyWith(
              fontSize: 14,
              height: 1.25,
              color: AppColors.onSurface(context),
            ),
          ),
        ],
      ),
    );
  }
}

class _RestaurantList extends StatelessWidget {
  const _RestaurantList({required this.copy});

  final _HomeCopy copy;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 209,
      child: ListView.separated(
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
        scrollDirection: Axis.horizontal,
        itemCount: copy.restaurants.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) {
          return _RestaurantCard(
            restaurant: copy.restaurants[index],
            copy: copy,
          );
        },
      ),
    );
  }
}

class _RestaurantCard extends StatelessWidget {
  const _RestaurantCard({required this.restaurant, required this.copy});

  final _HomeRestaurant restaurant;
  final _HomeCopy copy;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surfaceCard(context),
      borderRadius: const BorderRadius.all(AppRadius.md),
      child: InkWell(
        borderRadius: const BorderRadius.all(AppRadius.md),
        onTap: () => context.push(
          RouteNames.restaurantDetail.replaceFirst(':id', restaurant.id),
        ),
        child: Container(
          width: 223,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            border: Border.all(color: AppColors.border(context), width: 0.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _RestaurantImage(restaurant: restaurant),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      textDirection: TextDirection.rtl,
                      children: [
                        Expanded(
                          child: Row(
                            textDirection: TextDirection.rtl,
                            children: [
                              Flexible(
                                child: Text(
                                  restaurant.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: AppTextStyles.body(
                                    context,
                                  ).copyWith(fontSize: 12, height: 1.3),
                                ),
                              ),
                              const SizedBox(width: 4),
                              _AvailabilityPill(
                                label: restaurant.isOpen
                                    ? copy.available
                                    : copy.closed,
                                isOpen: restaurant.isOpen,
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 8),
                        _RatingBadge(rating: restaurant.rating),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      restaurant.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.start,
                      style: AppTextStyles.caption(
                        context,
                      ).copyWith(fontSize: 10, height: 1.25),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      textDirection: Directionality.of(context),
                      children: [
                        const Icon(
                          Icons.schedule_rounded,
                          color: Color(0xFF666666),
                          size: 14,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          restaurant.deliveryTime,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: AppTextStyles.caption(context).copyWith(
                            fontSize: 10,
                            height: 1.25,
                            color: AppColors.onSurface(context),
                          ),
                        ),
                      ],
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

class _RestaurantImage extends StatelessWidget {
  const _RestaurantImage({required this.restaurant});

  final _HomeRestaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 124,
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
              child: AppRasterImage.asset(
                restaurant.imageAsset,
                fit: BoxFit.cover,
                width: double.infinity,
              ),
            ),
          ),
          Positioned(
            left: 10,
            top: 10,
            child: Container(
              width: 22,
              height: 22,
              decoration: BoxDecoration(
                color: AppColors.surfaceCard(context),
                borderRadius: const BorderRadius.all(AppRadius.full),
              ),
              child: Center(
                child: Icon(
                  Icons.favorite_border_rounded,
                  size: 14,
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _RatingBadge extends StatelessWidget {
  const _RatingBadge({required this.rating});

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(4),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackground(context),
        borderRadius: const BorderRadius.all(Radius.circular(4)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            rating,
            style: AppTextStyles.body(
              context,
            ).copyWith(fontSize: 10, height: 1.25),
          ),
          const SizedBox(width: 2),
          const Icon(Icons.star_rounded, color: Color(0xFFFFB800), size: 14),
        ],
      ),
    );
  }
}

class _AvailabilityPill extends StatelessWidget {
  const _AvailabilityPill({required this.label, required this.isOpen});

  final String label;
  final bool isOpen;

  @override
  Widget build(BuildContext context) {
    final color = isOpen ? AppColors.success : AppColors.error;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.caption(
            context,
          ).copyWith(color: color, fontSize: 10, height: 1.25),
        ),
        const SizedBox(width: 2),
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            color: color,
            borderRadius: const BorderRadius.all(AppRadius.full),
          ),
        ),
      ],
    );
  }
}

class _HomeCopy {
  const _HomeCopy({
    required this.deliveryTo,
    required this.address,
    required this.searchHint,
    required this.bannerEyebrow,
    required this.bannerTitle,
    required this.orderNow,
    required this.missedOffersTitle,
    required this.mostOrderedTitle,
    required this.available,
    required this.closed,
    required this.categories,
    required this.offers,
    required this.restaurants,
  });

  final String deliveryTo;
  final String address;
  final String searchHint;
  final String bannerEyebrow;
  final String bannerTitle;
  final String orderNow;
  final String missedOffersTitle;
  final String mostOrderedTitle;
  final String available;
  final String closed;
  final List<_HomeCategory> categories;
  final List<_HomeOffer> offers;
  final List<_HomeRestaurant> restaurants;

  static _HomeCopy of(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return isArabic ? _arabic : _english;
  }

  static const _arabic = _HomeCopy(
    deliveryTo: 'التوصيل إلى',
    address: 'مدينتي، حي الزهور',
    searchHint: 'إبحث عن ما تحب',
    bannerEyebrow: 'فاتح اللذة',
    bannerTitle: 'برجر\nمميز',
    orderNow: 'اطلب الآن',
    missedOffersTitle: 'عروض لا تفوتها',
    mostOrderedTitle: 'الأكثر طلباً',
    available: 'متاح',
    closed: 'مغلق',
    categories: [
      _HomeCategory(
        label: 'المطاعم',
        imageAsset: AppAssets.homeCategoryRestaurants,
      ),
      _HomeCategory(
        label: 'البقالة',
        imageAsset: AppAssets.homeCategoryGrocery,
      ),
      _HomeCategory(label: 'المتجر', imageAsset: AppAssets.homeCategoryStore),
      _HomeCategory(
        label: 'استلم بنفسك',
        imageAsset: AppAssets.homeCategoryPickup,
      ),
    ],
    offers: [
      _HomeOffer(
        restaurant: 'مطعم عز الشام',
        title: 'عرض البرجر مع الفرايز',
        price: '190 ج.م',
        imageAsset: AppAssets.homeOfferProduct,
      ),
      _HomeOffer(
        restaurant: 'مطعم عز الشام',
        title: 'عرض البرجر مع الفرايز',
        price: '190 ج.م',
        imageAsset: AppAssets.homeOfferProduct,
      ),
      _HomeOffer(
        restaurant: 'مطعم عز الشام',
        title: 'عرض البرجر مع الفرايز',
        price: '190 ج.م',
        imageAsset: AppAssets.homeOfferProduct,
      ),
      _HomeOffer(
        restaurant: 'مطعم عز الشام',
        title: 'عرض البرجر مع الفرايز',
        price: '190 ج.م',
        imageAsset: AppAssets.homeOfferProduct,
      ),
    ],
    restaurants: [
      _HomeRestaurant(
        name: 'مطعم عز الشام',
        description: 'شاورما، بيتزا، وجبات شرقي',
        deliveryTime: '45-30 دقيقة',
        rating: '4.5',
        isOpen: false,
        id: 'az-al-sham',
        imageAsset: AppAssets.homeRestaurantCover,
      ),
      _HomeRestaurant(
        name: 'مطعم عز الشام',
        description: 'شاورما، بيتزا، وجبات شرقي',
        deliveryTime: '45-30 دقيقة',
        rating: '4.5',
        isOpen: true,
        id: 'az-al-sham',
        imageAsset: AppAssets.homeRestaurantCover,
      ),
      _HomeRestaurant(
        name: 'مطعم عز الشام',
        description: 'شاورما، بيتزا، وجبات شرقي',
        deliveryTime: '45-30 دقيقة',
        rating: '4.5',
        isOpen: false,
        id: 'az-al-sham',
        imageAsset: AppAssets.homeRestaurantCover,
      ),
    ],
  );

  static const _english = _HomeCopy(
    deliveryTo: 'Deliver to',
    address: 'Madinaty, Al Zuhour District',
    searchHint: 'Search for what you love',
    bannerEyebrow: 'Taste unlocked',
    bannerTitle: 'Special\nBurger',
    orderNow: 'Order now',
    missedOffersTitle: 'Offers you cannot miss',
    mostOrderedTitle: 'Most ordered',
    available: 'Open',
    closed: 'Closed',
    categories: [
      _HomeCategory(
        label: 'Restaurants',
        imageAsset: AppAssets.homeCategoryRestaurants,
      ),
      _HomeCategory(
        label: 'Grocery',
        imageAsset: AppAssets.homeCategoryGrocery,
      ),
      _HomeCategory(label: 'Stores', imageAsset: AppAssets.homeCategoryStore),
      _HomeCategory(label: 'Pickup', imageAsset: AppAssets.homeCategoryPickup),
    ],
    offers: [
      _HomeOffer(
        restaurant: 'Az Al Sham',
        title: 'Burger with fries offer',
        price: 'EGP 190',
        imageAsset: AppAssets.homeOfferProduct,
      ),
      _HomeOffer(
        restaurant: 'Az Al Sham',
        title: 'Burger with fries offer',
        price: 'EGP 190',
        imageAsset: AppAssets.homeOfferProduct,
      ),
      _HomeOffer(
        restaurant: 'Az Al Sham',
        title: 'Burger with fries offer',
        price: 'EGP 190',
        imageAsset: AppAssets.homeOfferProduct,
      ),
      _HomeOffer(
        restaurant: 'Az Al Sham',
        title: 'Burger with fries offer',
        price: 'EGP 190',
        imageAsset: AppAssets.homeOfferProduct,
      ),
    ],
    restaurants: [
      _HomeRestaurant(
        name: 'Az Al Sham',
        description: 'Shawarma, pizza, oriental meals',
        deliveryTime: '30-45 min',
        rating: '4.5',
        isOpen: false,
        id: 'az-al-sham',
        imageAsset: AppAssets.homeRestaurantCover,
      ),
      _HomeRestaurant(
        name: 'Az Al Sham',
        description: 'Shawarma, pizza, oriental meals',
        deliveryTime: '30-45 min',
        rating: '4.5',
        isOpen: true,
        id: 'az-al-sham',
        imageAsset: AppAssets.homeRestaurantCover,
      ),
      _HomeRestaurant(
        name: 'Az Al Sham',
        description: 'Shawarma, pizza, oriental meals',
        deliveryTime: '30-45 min',
        rating: '4.5',
        isOpen: false,
        id: 'az-al-sham',
        imageAsset: AppAssets.homeRestaurantCover,
      ),
    ],
  );
}

class _HomeCategory {
  const _HomeCategory({required this.label, required this.imageAsset});

  final String label;
  final String imageAsset;
}

class _HomeOffer {
  const _HomeOffer({
    required this.restaurant,
    required this.title,
    required this.price,
    required this.imageAsset,
  });

  final String restaurant;
  final String title;
  final String price;
  final String imageAsset;
}

class _HomeRestaurant {
  const _HomeRestaurant({
    required this.name,
    required this.description,
    required this.deliveryTime,
    required this.rating,
    required this.isOpen,
    required this.id,
    required this.imageAsset,
  });

  final String name;
  final String description;
  final String deliveryTime;
  final String rating;
  final bool isOpen;
  final String id;
  final String imageAsset;
}
