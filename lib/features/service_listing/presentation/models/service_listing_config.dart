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
    required this.sections,
    this.filters = const [],
  });

  final ServiceListingType type;
  final String title;
  final String searchHint;
  final List<ServiceCategoryData> categories;
  final List<ServiceFilterData> filters;
  final List<ServiceSectionData> sections;

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
      time: l10n.serviceDeliveryTimeRange,
      imageAsset: AppAssets.homeRestaurantCover,
    );
    final azAlSham = ServicePlaceData.restaurant(
      name: l10n.serviceRestaurantAzAlSham,
      subtitle: l10n.serviceRestaurantDescription,
      time: l10n.serviceDeliveryTimeRange,
      imageAsset: AppAssets.favoriteRestaurantAzAlSham,
    );

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
      sections: [
        ServiceSectionData(
          title: l10n.serviceAllPlaces,
          layout: ServiceSectionLayout.list,
          items: [kira, azAlSham],
        ),
        ServiceSectionData(
          title: l10n.serviceCategoryDesserts,
          layout: ServiceSectionLayout.list,
          items: [azAlSham],
        ),
        ServiceSectionData(
          title: l10n.serviceCategoryGrills,
          layout: ServiceSectionLayout.list,
          items: [kira],
        ),
        ServiceSectionData(
          title: l10n.serviceCategoryPizza,
          layout: ServiceSectionLayout.list,
          items: [azAlSham],
        ),
        ServiceSectionData(
          title: l10n.serviceCategoryFastFood,
          layout: ServiceSectionLayout.list,
          items: [kira],
        ),
        ServiceSectionData(
          title: l10n.serviceCategoryBurger,
          layout: ServiceSectionLayout.list,
          items: [azAlSham],
        ),
        ServiceSectionData(
          title: l10n.serviceCategoryShawarma,
          layout: ServiceSectionLayout.list,
          items: [kira],
        ),
      ],
    );
  }

  static ServiceListingConfig _grocery(AppLocalizations l10n) {
    final captain = ServicePlaceData.store(
      name: l10n.serviceStoreCaptain,
      time: l10n.serviceDeliveryTimeRange,
      imageAsset: AppAssets.serviceGroceryCaptain,
    );
    final fathallah = ServicePlaceData.store(
      name: l10n.serviceStoreFathallah,
      time: l10n.serviceDeliveryTimeRange,
      imageAsset: AppAssets.serviceGroceryFathallah,
    );

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
      sections: [
        ServiceSectionData(
          title: l10n.serviceAllPlaces,
          layout: ServiceSectionLayout.compactGrid,
          items: [captain, fathallah],
        ),
        ServiceSectionData(
          title: l10n.serviceCategorySupermarket,
          layout: ServiceSectionLayout.compactGrid,
          items: [captain, fathallah],
        ),
        ServiceSectionData(
          title: l10n.serviceCategorySnacks,
          layout: ServiceSectionLayout.compactGrid,
          items: [captain],
        ),
        ServiceSectionData(
          title: l10n.serviceCategoryDairy,
          layout: ServiceSectionLayout.compactGrid,
          items: [fathallah],
        ),
        ServiceSectionData(
          title: l10n.serviceCategoryFruitsVegetables,
          layout: ServiceSectionLayout.compactGrid,
          items: [captain],
        ),
        ServiceSectionData(
          title: l10n.serviceCategoryRoasters,
          layout: ServiceSectionLayout.compactGrid,
          items: [fathallah],
        ),
      ],
    );
  }

  static ServiceListingConfig _stores(AppLocalizations l10n) {
    final beauty = ServicePlaceData.store(
      name: l10n.serviceCategoryPerfumeBeauty,
      time: l10n.serviceDeliveryTimeRange,
      imageAsset: AppAssets.serviceStoresBeauty,
    );
    final flowers = ServicePlaceData.store(
      name: l10n.serviceCategoryFlowers,
      time: l10n.serviceDeliveryTimeRange,
      imageAsset: AppAssets.serviceStoresFlowers,
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
      sections: [
        ServiceSectionData(
          title: l10n.serviceAllPlaces,
          layout: ServiceSectionLayout.list,
          items: [beauty, flowers],
        ),
        ServiceSectionData(
          title: l10n.serviceCategoryPerfumeBeauty,
          layout: ServiceSectionLayout.list,
          items: [beauty],
        ),
        ServiceSectionData(
          title: l10n.serviceCategoryFlowers,
          layout: ServiceSectionLayout.list,
          items: [flowers],
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
      sections: [
        ServiceSectionData(
          title: l10n.serviceAllPlaces,
          layout: ServiceSectionLayout.list,
          items: [
            ServicePlaceData.pickup(
              name: l10n.serviceStoreRimasLand,
              time: l10n.serviceDeliveryTimeRange,
              imageAsset: AppAssets.servicePickupRimas,
              hasOffer: true,
              topRated: true,
            ),
            ServicePlaceData.pickup(
              name: l10n.serviceStoreTaheraFry,
              time: l10n.serviceDeliveryTimeRange,
              imageAsset: AppAssets.servicePickupTahera,
              hasOffer: false,
              topRated: true,
            ),
            ServicePlaceData.pickup(
              name: l10n.serviceStoreFamilyMarket,
              time: l10n.serviceDeliveryTimeRange,
              imageAsset: AppAssets.servicePickupFamily,
              hasOffer: true,
              topRated: false,
            ),
            ServicePlaceData.pickup(
              name: l10n.serviceCaptainMarket,
              time: l10n.serviceDeliveryTimeRange,
              imageAsset: AppAssets.servicePickupCaptain,
              hasOffer: false,
              topRated: false,
            ),
          ],
        ),
      ],
    );
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

class ServiceSectionData {
  const ServiceSectionData({
    required this.title,
    required this.layout,
    required this.items,
  });

  final String title;
  final ServiceSectionLayout layout;
  final List<ServicePlaceData> items;
}

enum ServiceSectionLayout { list, compactGrid }

enum ServicePlaceKind { restaurant, store, pickup }

class ServicePlaceData {
  const ServicePlaceData._({
    required this.kind,
    required this.name,
    required this.time,
    required this.imageAsset,
    this.hasOffer = false,
    this.topRated = true,
    this.subtitle,
  });

  factory ServicePlaceData.restaurant({
    required String name,
    required String subtitle,
    required String time,
    required String imageAsset,
  }) {
    return ServicePlaceData._(
      kind: ServicePlaceKind.restaurant,
      name: name,
      subtitle: subtitle,
      time: time,
      imageAsset: imageAsset,
    );
  }

  factory ServicePlaceData.store({
    required String name,
    required String time,
    required String imageAsset,
  }) {
    return ServicePlaceData._(
      kind: ServicePlaceKind.store,
      name: name,
      time: time,
      imageAsset: imageAsset,
    );
  }

  factory ServicePlaceData.pickup({
    required String name,
    required String time,
    required String imageAsset,
    bool hasOffer = false,
    bool topRated = true,
  }) {
    return ServicePlaceData._(
      kind: ServicePlaceKind.pickup,
      name: name,
      time: time,
      imageAsset: imageAsset,
      hasOffer: hasOffer,
      topRated: topRated,
    );
  }

  final ServicePlaceKind kind;
  final String name;
  final String time;
  final String imageAsset;
  final bool hasOffer;
  final bool topRated;
  final String? subtitle;
}
