import 'package:flutter/material.dart';
import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/features/service_listing/presentation/models/service_listing_type.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class ServiceListingConfig {
  const ServiceListingConfig({
    required this.type,
    required this.title,
    required this.searchHint,
    required this.categories,
    required this.groups,
    this.filters = const [],
  });

  final ServiceListingType type;
  final String title;
  final String searchHint;
  final List<ServiceCategoryData> categories;
  final List<ServiceFilterData> filters;
  final List<ServiceListingGroupData> groups;

  static ServiceListingConfig of(
    AppLocalizations l10n,
    ServiceListingType type,
  ) {
    return switch (type) {
      ServiceListingType.restaurants => _restaurants(l10n),
      ServiceListingType.grocery => _grocery(l10n),
      ServiceListingType.stores => _stores(l10n),
      ServiceListingType.pickup => _pickup(l10n),
    };
  }

  static ServiceListingConfig _restaurants(AppLocalizations l10n) {
    final kira = ServicePlaceData.restaurant(
      name: l10n.serviceRestaurantKira,
      subtitle: l10n.serviceRestaurantDescription,
      time: _text(l10n, ar: '30-45 دقيقة', en: '30-45 min'),
      imageAsset: AppAssets.homeRestaurantCover,
      rating: '4.6',
    );
    final azAlSham = ServicePlaceData.restaurant(
      name: l10n.serviceRestaurantAzAlSham,
      subtitle: l10n.serviceRestaurantDescription,
      time: _text(l10n, ar: '25-40 دقيقة', en: '25-40 min'),
      imageAsset: AppAssets.favoriteRestaurantAzAlSham,
      rating: '4.8',
    );
    final restaurantMocks = [kira, azAlSham];

    return ServiceListingConfig(
      type: ServiceListingType.restaurants,
      title: l10n.serviceListingRestaurantsTitle,
      searchHint: l10n.serviceSearchHint,
      categories: [
        ServiceCategoryData.all(label: l10n.serviceAllPlaces),
        ServiceCategoryData(
          label: l10n.serviceCategoryDesserts,
          imageAsset: AppAssets.serviceRestaurantDesserts,
        ),
        ServiceCategoryData(
          label: l10n.serviceCategoryGrills,
          imageAsset: AppAssets.serviceRestaurantGrills,
        ),
        ServiceCategoryData(
          label: l10n.serviceCategoryPizza,
          imageAsset: AppAssets.serviceRestaurantPizza,
        ),
        ServiceCategoryData(
          label: l10n.serviceCategoryFastFood,
          imageAsset: AppAssets.serviceRestaurantFastFood,
        ),
        ServiceCategoryData(
          label: l10n.serviceCategoryBurger,
          imageAsset: AppAssets.serviceRestaurantBurger,
        ),
        ServiceCategoryData(
          label: l10n.serviceCategoryShawarma,
          imageAsset: AppAssets.serviceRestaurantShawarma,
        ),
      ],
      groups: [
        ServiceListingGroupData(
          title: l10n.serviceCategoryDesserts,
          layout: ServiceListingLayout.list,
          items: _repeat(restaurantMocks, 5),
        ),
        ServiceListingGroupData(
          title: l10n.serviceCategoryGrills,
          layout: ServiceListingLayout.list,
          items: _repeat(restaurantMocks.reversed.toList(), 5),
        ),
        ServiceListingGroupData(
          title: l10n.serviceCategoryPizza,
          layout: ServiceListingLayout.list,
          items: _repeat([azAlSham, kira], 4),
        ),
        ServiceListingGroupData(
          title: l10n.serviceCategoryFastFood,
          layout: ServiceListingLayout.list,
          items: _repeat([kira, azAlSham], 4),
        ),
        ServiceListingGroupData(
          title: l10n.serviceCategoryBurger,
          layout: ServiceListingLayout.list,
          items: _repeat([azAlSham, kira], 4),
        ),
        ServiceListingGroupData(
          title: l10n.serviceCategoryShawarma,
          layout: ServiceListingLayout.list,
          items: _repeat([kira, azAlSham], 4),
        ),
      ],
    );
  }

  static ServiceListingConfig _grocery(AppLocalizations l10n) {
    final captain = ServicePlaceData.store(
      name: l10n.serviceStoreCaptain,
      time: _text(l10n, ar: '30-45 دقيقة', en: '30-45 min'),
      imageAsset: AppAssets.serviceGroceryCaptain,
      rating: '4.5',
    );
    final fathallah = ServicePlaceData.store(
      name: l10n.serviceStoreFathallah,
      time: _text(l10n, ar: '30-45 دقيقة', en: '30-45 min'),
      imageAsset: AppAssets.serviceGroceryFathallah,
      rating: '4.6',
    );
    final groceryMocks = [captain, fathallah];

    return ServiceListingConfig(
      type: ServiceListingType.grocery,
      title: l10n.serviceListingGroceryTitle,
      searchHint: l10n.serviceSearchHint,
      categories: [
        ServiceCategoryData.all(label: l10n.serviceAllPlaces),
        ServiceCategoryData(
          label: l10n.serviceCategorySupermarket,
          imageAsset: AppAssets.serviceGrocerySupermarket,
        ),
        ServiceCategoryData(
          label: l10n.serviceCategorySnacks,
          imageAsset: AppAssets.serviceGrocerySnacks,
        ),
        ServiceCategoryData(
          label: l10n.serviceCategoryDairy,
          imageAsset: AppAssets.serviceGroceryDairy,
        ),
        ServiceCategoryData(
          label: l10n.serviceCategoryFruitsVegetables,
          imageAsset: AppAssets.serviceGroceryFruitsVegetables,
        ),
        ServiceCategoryData(
          label: l10n.serviceCategoryRoasters,
          imageAsset: AppAssets.serviceGroceryRoasters,
        ),
      ],
      groups: [
        ServiceListingGroupData(
          title: l10n.serviceCategorySupermarket,
          layout: ServiceListingLayout.compactGrid,
          items: _repeat(groceryMocks, 5),
        ),
        ServiceListingGroupData(
          title: l10n.serviceCategorySnacks,
          layout: ServiceListingLayout.compactGrid,
          items: _repeat([captain, fathallah], 4),
        ),
        ServiceListingGroupData(
          title: l10n.serviceCategoryDairy,
          layout: ServiceListingLayout.compactGrid,
          items: _repeat([fathallah, captain], 4),
        ),
        ServiceListingGroupData(
          title: l10n.serviceCategoryFruitsVegetables,
          layout: ServiceListingLayout.compactGrid,
          items: _repeat([captain, fathallah], 4),
        ),
        ServiceListingGroupData(
          title: l10n.serviceCategoryRoasters,
          layout: ServiceListingLayout.compactGrid,
          items: _repeat([fathallah, captain], 4),
        ),
      ],
    );
  }

  static ServiceListingConfig _stores(AppLocalizations l10n) {
    final beauty = ServicePlaceData.store(
      name: l10n.serviceCategoryPerfumeBeauty,
      time: _text(l10n, ar: '35-50 دقيقة', en: '35-50 min'),
      imageAsset: AppAssets.serviceStoresBeauty,
      rating: '4.5',
    );
    final flowers = ServicePlaceData.store(
      name: l10n.serviceCategoryFlowers,
      time: _text(l10n, ar: '25-40 دقيقة', en: '25-40 min'),
      imageAsset: AppAssets.serviceStoresFlowers,
      rating: '4.7',
    );
    return ServiceListingConfig(
      type: ServiceListingType.stores,
      title: l10n.serviceListingStoresTitle,
      searchHint: l10n.serviceSearchHint,
      categories: [
        ServiceCategoryData.all(label: l10n.serviceAllPlaces),
        ServiceCategoryData(
          label: l10n.serviceCategoryPerfumeBeauty,
          imageAsset: AppAssets.serviceStoresBeauty,
        ),
        ServiceCategoryData(
          label: l10n.serviceCategoryFlowers,
          imageAsset: AppAssets.serviceStoresFlowers,
        ),
      ],
      groups: [
        ServiceListingGroupData(
          title: l10n.serviceCategoryPerfumeBeauty,
          layout: ServiceListingLayout.list,
          items: _repeat([beauty, flowers], 10),
        ),
        ServiceListingGroupData(
          title: l10n.serviceCategoryFlowers,
          layout: ServiceListingLayout.list,
          items: _repeat([flowers, beauty], 10),
        ),
      ],
    );
  }

  static ServiceListingConfig _pickup(AppLocalizations l10n) {
    return ServiceListingConfig(
      type: ServiceListingType.pickup,
      title: l10n.serviceListingPickupTitle,
      searchHint: l10n.serviceSearchHint,
      categories: const [],
      filters: [
        ServiceFilterData(
          id: ServiceFilterId.offers,
          label: l10n.serviceFilterOffers,
          selected: false,
        ),
        ServiceFilterData(
          id: ServiceFilterId.topRated,
          label: l10n.serviceFilterTopRated,
          selected: true,
        ),
      ],
      groups: [
        ServiceListingGroupData(
          title: l10n.serviceAllPlaces,
          layout: ServiceListingLayout.list,
          items: [
            ServicePlaceData.pickup(
              name: l10n.serviceStoreRimasLand,
              time: _text(l10n, ar: '30-45 دقيقة', en: '30-45 min'),
              imageAsset: AppAssets.servicePickupRimas,
              rating: '4.5',
              hasOffer: true,
              topRated: true,
            ),
            ServicePlaceData.pickup(
              name: l10n.serviceStoreTaheraFry,
              time: _text(l10n, ar: '30-45 دقيقة', en: '30-45 min'),
              imageAsset: AppAssets.servicePickupTahera,
              rating: '4.5',
              hasOffer: true,
              topRated: true,
            ),
            ServicePlaceData.pickup(
              name: l10n.serviceStoreFamilyMarket,
              time: _text(l10n, ar: '30-45 دقيقة', en: '30-45 min'),
              imageAsset: AppAssets.servicePickupFamily,
              rating: '4.5',
              hasOffer: true,
              topRated: true,
            ),
            ServicePlaceData.pickup(
              name: l10n.serviceCaptainMarket,
              time: _text(l10n, ar: '30-45 دقيقة', en: '30-45 min'),
              imageAsset: AppAssets.servicePickupCaptain,
              rating: '4.5',
              hasOffer: true,
              topRated: true,
            ),
          ],
        ),
      ],
    );
  }

  static String _text(
    AppLocalizations l10n, {
    required String ar,
    required String en,
  }) {
    return l10n.localeName.startsWith('ar') ? ar : en;
  }

  static List<ServicePlaceData> _repeat(
    List<ServicePlaceData> items,
    int count,
  ) {
    return List.generate(count, (index) => items[index % items.length]);
  }
}

class ServiceCategoryData {
  const ServiceCategoryData({
    required this.label,
    this.imageAsset,
    this.fallbackIcon = Icons.storefront_outlined,
  });

  const ServiceCategoryData.all({required this.label})
    : imageAsset = null,
      fallbackIcon = Icons.apps_rounded;

  final String label;
  final String? imageAsset;
  final IconData fallbackIcon;
}

class ServiceFilterData {
  const ServiceFilterData({
    required this.id,
    required this.label,
    this.selected = false,
  });

  final ServiceFilterId id;
  final String label;
  final bool selected;
}

enum ServiceFilterId { offers, topRated }

class ServiceListingGroupData {
  const ServiceListingGroupData({
    required this.title,
    required this.layout,
    required this.items,
  });

  final String title;
  final ServiceListingLayout layout;
  final List<ServicePlaceData> items;
}

enum ServiceListingLayout { list, compactGrid }

enum ServicePlaceKind { restaurant, store, pickup }

class ServicePlaceData {
  const ServicePlaceData._({
    required this.kind,
    required this.name,
    required this.time,
    required this.imageAsset,
    required this.rating,
    this.hasOffer = false,
    this.topRated = true,
    this.showFavourite = false,
    this.subtitle,
  });

  factory ServicePlaceData.restaurant({
    required String name,
    required String subtitle,
    required String time,
    required String imageAsset,
    required String rating,
  }) {
    return ServicePlaceData._(
      kind: ServicePlaceKind.restaurant,
      name: name,
      subtitle: subtitle,
      time: time,
      imageAsset: imageAsset,
      rating: rating,
    );
  }

  factory ServicePlaceData.store({
    required String name,
    required String time,
    required String imageAsset,
    required String rating,
    bool showFavourite = false,
  }) {
    return ServicePlaceData._(
      kind: ServicePlaceKind.store,
      name: name,
      time: time,
      imageAsset: imageAsset,
      rating: rating,
      showFavourite: showFavourite,
    );
  }

  factory ServicePlaceData.pickup({
    required String name,
    required String time,
    required String imageAsset,
    required String rating,
    bool hasOffer = false,
    bool topRated = true,
  }) {
    return ServicePlaceData._(
      kind: ServicePlaceKind.pickup,
      name: name,
      time: time,
      imageAsset: imageAsset,
      rating: rating,
      hasOffer: hasOffer,
      topRated: topRated,
    );
  }

  final ServicePlaceKind kind;
  final String name;
  final String time;
  final String imageAsset;
  final String rating;
  final bool hasOffer;
  final bool topRated;
  final bool showFavourite;
  final String? subtitle;
}
