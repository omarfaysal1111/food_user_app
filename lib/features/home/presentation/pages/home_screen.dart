import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/app_spacing.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/app_media.dart';
import 'package:food_user_app/core/widgets/app_search_field.dart';
import 'package:food_user_app/features/profile/presentation/controllers/saved_addresses_scope.dart';
import 'package:food_user_app/l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_user_app/features/home/presentation/widgets/banner_slider.dart';
import 'package:food_user_app/features/home/presentation/cubit/home_cubits.dart';
import 'package:food_user_app/features/home/presentation/widgets/category_grid.dart';
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
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppSpacing.md,
                  ),
                  child: BlocProvider<SectionsCubit>(
                    create: (context) => sl<SectionsCubit>(),
                    child: const CategoryGrid(),
                  ),
                ),
                const SizedBox(height: 20),
                const BannerSlider(),
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

// Returns true when the string contains Arabic/Arabic-Extended characters.
bool _containsArabic(String text) =>
    RegExp(r'[\u0600-\u06FF\u0750-\u077F\u08A0-\u08FF]').hasMatch(text);

class _LocationRow extends StatelessWidget {
  const _LocationRow({required this.copy});

  final _HomeCopy copy;

  @override
  Widget build(BuildContext context) {
    final isAddressArabic = _containsArabic(copy.address);
    final addressTextDirection =
        isAddressArabic ? TextDirection.rtl : TextDirection.ltr;

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
                  textDirection: addressTextDirection,
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
                  return Center(
                    child: Text(AppLocalizations.of(context)!.noOffersAvailable),
                  );
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
                  return Center(
                    child: Text(AppLocalizations.of(context)!.noRestaurantsFound),
                  );
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

  static _HomeCopy of(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final l10n = AppLocalizations.of(context)!;
    final selectedAddressObj = SavedAddressesScope.of(context).selectedAddress;
    final selectedAddress = (selectedAddressObj?.fullAddress != null && selectedAddressObj!.fullAddress!.trim().isNotEmpty)
        ? selectedAddressObj.fullAddress!.trim()
        : selectedAddressObj?.shortLocation(locale);

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
    );
  }
}
