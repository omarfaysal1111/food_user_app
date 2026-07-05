import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:food_user_app/features/service_listing/presentation/bloc/service_listing_state.dart';
import 'package:food_user_app/features/service_listing/presentation/models/service_listing_config.dart';

class ServiceListingCubit extends Cubit<ServiceListingState> {
  ServiceListingCubit({required ServiceListingConfig config})
    : super(ServiceListingState(config: config));

  void toggleCategory(ServiceCategoryData category) {
    emit(
      state.copyWith(
        selectedCategory: category,
        clearSelectedCategory: state.selectedCategory?.label == category.label,
      ),
    );
  }

  void toggleTopFilter(ServiceFilterId filter) {
    final selectedFilters = Set<ServiceFilterId>.from(state.selectedTopFilters);

    selectedFilters.contains(filter)
        ? selectedFilters.remove(filter)
        : selectedFilters.add(filter);

    emit(state.copyWith(selectedTopFilters: selectedFilters));
  }

  void searchChanged(String value) {
    emit(state.copyWith(searchQuery: value.trim()));
  }
}
