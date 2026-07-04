import 'package:equatable/equatable.dart';

import 'package:food_user_app/features/service_listing/presentation/models/service_listing_config.dart';
import 'package:food_user_app/features/service_listing/presentation/models/service_listing_type.dart';

class ServiceListingState extends Equatable {
  const ServiceListingState({
    required this.config,
    this.selectedCategory,
    this.selectedTopFilters = const {},
    this.searchQuery = '',
  });

  final ServiceListingConfig config;
  final ServiceCategoryData? selectedCategory;
  final Set<ServiceFilterId> selectedTopFilters;
  final String searchQuery;

  ServiceListingType get selectedSection => config.type;

  List<ServiceCategoryData> get categories => config.categories;

  List<ServicePlaceData> get stores => _categoryScopedGroups
      .expand((group) => group.items)
      .where(_matchesTopFilter)
      .toList(growable: false);

  List<ServicePlaceData> get filteredStores =>
      stores.where(_matchesSearch).toList(growable: false);

  List<ServicePlaceData> get largeStores {
    if (selectedSection != ServiceListingType.grocery) {
      return const [];
    }

    return _categoryScopedGroups
        .expand((group) => group.largeItems)
        .where(_matchesTopFilter)
        .where(_matchesSearch)
        .toList(growable: false);
  }

  ServiceListingState copyWith({
    ServiceCategoryData? selectedCategory,
    bool clearSelectedCategory = false,
    Set<ServiceFilterId>? selectedTopFilters,
    String? searchQuery,
  }) {
    return ServiceListingState(
      config: config,
      selectedCategory: clearSelectedCategory
          ? null
          : selectedCategory ?? this.selectedCategory,
      selectedTopFilters: selectedTopFilters ?? this.selectedTopFilters,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }

  List<ServiceListingGroupData> get _categoryScopedGroups {
    final category = selectedCategory;
    if (category == null) {
      return config.groups
          .where((group) => group.includeInAll)
          .toList(growable: false);
    }

    return config.groups
        .where((group) => group.title == category.label)
        .toList(growable: false);
  }

  bool _matchesTopFilter(ServicePlaceData place) {
    if (selectedTopFilters.isEmpty) return true;

    return selectedTopFilters.every((filter) {
      return switch (filter) {
        ServiceFilterId.offers => place.hasOffer,
        ServiceFilterId.fastDelivery => place.fastDelivery,
        ServiceFilterId.topRated => place.topRated,
      };
    });
  }

  bool _matchesSearch(ServicePlaceData place) {
    final query = searchQuery.trim().toLowerCase();
    if (query.isEmpty) return true;

    final searchableText = [
      place.name,
      place.subtitle,
      place.time,
      place.rating,
    ].whereType<String>().join(' ').toLowerCase();
    return searchableText.contains(query);
  }

  @override
  List<Object?> get props => [
    config,
    selectedCategory,
    selectedTopFilters,
    searchQuery,
  ];
}
