import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_user_app/features/restaurant/domain/repositories/restaurant_repository.dart';
import 'restaurant_filter_state.dart';

class RestaurantFilterCubit extends Cubit<RestaurantFilterState> {
  final RestaurantRepository restaurantRepository;

  RestaurantFilterCubit({required this.restaurantRepository})
    : super(const RestaurantFilterState.initial());

  Future<void> fetchTopRated() async {
    emit(const RestaurantFilterState.loading());
    final result = await restaurantRepository.getTopRated();
    result.fold(
      (failure) => emit(RestaurantFilterState.error(failure.message)),
      (pageResponse) => emit(
        RestaurantFilterState.loaded(
          restaurants: pageResponse.content,
          filterType: 'top-rated',
        ),
      ),
    );
  }

  Future<void> fetchMostOrdered() async {
    emit(const RestaurantFilterState.loading());
    final result = await restaurantRepository.getMostOrdered();
    result.fold(
      (failure) => emit(RestaurantFilterState.error(failure.message)),
      (pageResponse) => emit(
        RestaurantFilterState.loaded(
          restaurants: pageResponse.content,
          filterType: 'most-ordered',
        ),
      ),
    );
  }

  Future<void> fetchWithOffers() async {
    emit(const RestaurantFilterState.loading());
    final result = await restaurantRepository.getWithOffers();
    result.fold(
      (failure) => emit(RestaurantFilterState.error(failure.message)),
      (pageResponse) => emit(
        RestaurantFilterState.loaded(
          restaurants: pageResponse.content,
          filterType: 'with-offers',
        ),
      ),
    );
  }
}
