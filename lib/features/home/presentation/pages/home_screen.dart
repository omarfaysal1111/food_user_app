import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/app_radius.dart';
import 'package:food_user_app/core/theme/app_spacing.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/app_media.dart';
import 'package:food_user_app/core/widgets/app_search_field.dart';
import 'package:food_user_app/features/profile/presentation/controllers/saved_addresses_scope.dart';
import 'package:food_user_app/features/service_listing/presentation/models/service_listing_type.dart';
import 'package:food_user_app/l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_user_app/features/home/presentation/cubit/banner_cubit.dart';
import 'package:food_user_app/features/home/presentation/cubit/banner_state.dart';
import 'package:food_user_app/features/home/domain/entities/banner.dart';
import 'package:food_user_app/features/restaurant/presentation/widgets/restaurant_card.dart';
import 'package:food_user_app/features/restaurant/presentation/cubit/restaurant_filter_cubit.dart';
import 'package:food_user_app/features/restaurant/presentation/cubit/restaurant_filter_state.dart';
import 'package:food_user_app/core/di/injection_container.dart';
import 'package:food_user_app/features/restaurant/domain/entities/restaurant.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addressesController = SavedAddressesScope.of(context);
    if (!addressesController.hasLoaded && !addressesController.isLoading) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        addressesController.loadAddressesIfNeeded();
      });
    }
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
                // TODO: Integrate with /categories endpoint
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
                const _OfferList(),
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
          PositionedDirectional(
            top: 16 + topPadding,
            start: AppSpacing.md,
            end: AppSpacing.md,
            child: Align(
              alignment: AlignmentDirectional.centerStart,
              child: _LocationRow(copy: copy),
            ),
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
              color: AppColors.scaffoldBackground(context),
              colorBlendMode: BlendMode.srcIn,
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
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => context.push(RouteNames.addressBook),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            copy.deliveryTo,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: AppTextStyles.caption(context).copyWith(
              color: AppColors.text.withValues(alpha: 0.72),
              fontSize: 10,
              height: 1.25,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.location_on_rounded,
                size: 16,
                color: AppColors.text,
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  copy.address,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.start,
                  style: AppTextStyles.body(
                    context,
                  ).copyWith(color: AppColors.text, fontSize: 12, height: 1.3),
                ),
              ),
              const SizedBox(width: 4),
              const Icon(
                Icons.keyboard_arrow_down_rounded,
                size: 16,
                color: AppColors.text,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SearchEntry extends StatefulWidget {
  const _SearchEntry({required this.copy});

  final _HomeCopy copy;

  @override
  State<_SearchEntry> createState() => _SearchEntryState();
}

class _SearchEntryState extends State<_SearchEntry> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surfaceCard(context),
      borderRadius: const BorderRadius.all(Radius.circular(10)),
      child: InkWell(
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        onTap: () => context.push(RouteNames.search),
        child: AbsorbPointer(
          child: AppSearchField(
            controller: _controller,
            hint: widget.copy.searchHint,
            height: 40,
            hintColor: AppColors.inputHintStrong,
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
    return InkWell(
      onTap: () =>
          context.push(RouteNames.serviceListingFor(category.type.pathSegment)),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Column(
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
                  color: AppColors.black.withValues(alpha: 0.06),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const PositionedDirectional(
                  top: 0,
                  start: 0,
                  end: 0,
                  child: AppRasterImage.asset(
                    AppAssets.homeCategoryStrokeTop,
                    height: 2,
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
                AppRasterImage.asset(
                  category.imageAsset,
                  width: 56,
                  height: 56,
                ),
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
      ),
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
    return BlocBuilder<BannerCubit, BannerState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (banners) {
            if (banners.isEmpty) return const SizedBox.shrink();

            return Column(
              children: [
                SizedBox(
                  height: 155,
                  child: PageView.builder(
                    controller: _controller,
                    onPageChanged: (page) =>
                        setState(() => _currentPage = page),
                    itemCount: banners.length,
                    itemBuilder: (context, index) {
                      final banner = banners[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: AppSpacing.md,
                        ),
                        child: _PromoBanner(banner: banner),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 12),
                _BannerIndicator(
                  activePage: _currentPage,
                  count: banners.length,
                ),
              ],
            );
          },
          orElse: () {
            return const SizedBox(
              height: 155,
              child: Center(child: CircularProgressIndicator()),
            );
          },
        );
      },
    );
  }
}

class _PromoBanner extends StatelessWidget {
  const _PromoBanner({required this.banner});

  final BannerItem banner;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(16)),
      child: Stack(
        fit: StackFit.expand,
        children: [
          AppNetworkImage(
            banner.imageUrl,
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
  const _BannerIndicator({required this.activePage, required this.count});

  final int activePage;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (var i = 0; i < count; i++) ...[
          _IndicatorDot(
            color: i == activePage
                ? AppColors.primary
                : AppColors.inactiveIndicator,
            width: i == activePage ? 32 : 8,
          ),
          if (i != count - 1) const SizedBox(width: AppSpacing.sm),
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
  const _OfferList();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RestaurantFilterCubit>(
      create: (context) => sl<RestaurantFilterCubit>()..fetchWithOffers(),
      child: SizedBox(
        height: 202,
        child: BlocBuilder<RestaurantFilterCubit, RestaurantFilterState>(
          builder: (context, state) {
            return state.maybeWhen(
              loaded: (restaurants, type) {
                if (restaurants.isEmpty) {
                  return const Center(child: Text('No offers available'));
                }
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                  scrollDirection: Axis.horizontal,
                  itemCount: restaurants.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 12),
                  itemBuilder: (context, index) => _OfferCard(restaurant: restaurants[index]),
                );
              },
              orElse: () => const Center(child: CircularProgressIndicator()),
            );
          },
        ),
      ),
    );
  }
}

class _OfferCard extends StatelessWidget {
  const _OfferCard({required this.restaurant});

  final Restaurant restaurant;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(
        RouteNames.restaurantDetailFor(restaurant.id),
      ),
      child: SizedBox(
        width: 140,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              child: AppNetworkImage(
                restaurant.coverImageUrl,
                height: 110,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            Row(
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
                    restaurant.cuisineType,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.start,
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
              restaurant.name,
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
            Row(
              children: [
                const Icon(Icons.star, size: 14, color: Colors.orange),
                const SizedBox(width: 4),
                Text(
                  restaurant.rating.toStringAsFixed(1),
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
          ],
        ),
      ),
    );
  }
}

class _RestaurantList extends StatelessWidget {
  const _RestaurantList({required this.copy});

  final _HomeCopy copy;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RestaurantFilterCubit>(
      create: (context) => sl<RestaurantFilterCubit>()..fetchMostOrdered(),
      child: SizedBox(
        height: 209,
        child: BlocBuilder<RestaurantFilterCubit, RestaurantFilterState>(
          builder: (context, state) {
            return state.when(
              initial: () => const Center(child: CircularProgressIndicator()),
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (message) => Center(
                child: Text(
                  message,
                  style: const TextStyle(color: AppColors.error),
                ),
              ),
              loaded: (restaurants, filterType) {
                if (restaurants.isEmpty) {
                  return const Center(child: Text('No restaurants found'));
                }
                return ListView.separated(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                  ),
                  scrollDirection: Axis.horizontal,
                  itemCount: restaurants.length,
                  separatorBuilder: (_, _) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    return RestaurantCard(restaurant: restaurants[index]);
                  },
                );
              },
            );
          },
        ),
      ),
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
    final locale = Localizations.localeOf(context);
    final l10n = AppLocalizations.of(context)!;
    final selectedAddress = SavedAddressesScope.of(
      context,
    ).selectedAddress?.shortLocation(locale);

    return _HomeCopy(
      deliveryTo: l10n.homeDeliveryTo,
      address: selectedAddress ?? l10n.selectDeliveryAddress,
      searchHint: l10n.serviceSearchHint,
      bannerEyebrow: l10n.homeBannerEyebrow,
      bannerTitle: l10n.homeBannerTitle,
      orderNow: l10n.homeOrderNow,
      missedOffersTitle: l10n.homeMissedOffersTitle,
      mostOrderedTitle: l10n.homeMostOrderedTitle,
      available: l10n.serviceAvailable,
      closed: l10n.serviceClosed,
      categories: [
        _HomeCategory(
          label: l10n.homeCategoryRestaurants,
          imageAsset: AppAssets.homeCategoryRestaurants,
          type: ServiceListingType.restaurants,
        ),
        _HomeCategory(
          label: l10n.homeCategoryGrocery,
          imageAsset: AppAssets.homeCategoryGrocery,
          type: ServiceListingType.grocery,
        ),
        _HomeCategory(
          label: l10n.homeCategoryStores,
          imageAsset: AppAssets.homeCategoryStore,
          type: ServiceListingType.stores,
        ),
        _HomeCategory(
          label: l10n.homeCategoryPickup,
          imageAsset: AppAssets.homeCategoryPickup,
          type: ServiceListingType.pickup,
        ),
      ],
      offers: [
        for (var i = 0; i < 4; i++)
          _HomeOffer(
            restaurant: l10n.orderRestaurantAzAlSham,
            title: l10n.cartProductBurgerCombo,
            price: l10n.cartPrice(190),
            imageAsset: AppAssets.homeOfferProduct,
          ),
      ],
      restaurants: [
        _HomeRestaurant(
          name: l10n.orderRestaurantAzAlSham,
          description: l10n.serviceRestaurantDescription,
          deliveryTime: l10n.serviceDeliveryTimeRange,
          rating: l10n.orderCourierRating,
          isOpen: false,
          id: 'az-al-sham',
          imageAsset: AppAssets.homeMostOrderedRestaurant1,
        ),
        _HomeRestaurant(
          name: l10n.orderRestaurantAzAlSham,
          description: l10n.serviceRestaurantDescription,
          deliveryTime: l10n.serviceDeliveryTimeRange,
          rating: l10n.orderCourierRating,
          isOpen: true,
          id: 'az-al-sham',
          imageAsset: AppAssets.homeMostOrderedRestaurant2,
        ),
        _HomeRestaurant(
          name: l10n.orderRestaurantAzAlSham,
          description: l10n.serviceRestaurantDescription,
          deliveryTime: l10n.serviceDeliveryTimeRange,
          rating: l10n.orderCourierRating,
          isOpen: false,
          id: 'az-al-sham',
          imageAsset: AppAssets.homeMostOrderedRestaurant1,
        ),
      ],
    );
  }
}

class _HomeCategory {
  const _HomeCategory({
    required this.label,
    required this.imageAsset,
    required this.type,
  });

  final String label;
  final String imageAsset;
  final ServiceListingType type;
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
