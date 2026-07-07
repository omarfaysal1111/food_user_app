import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/restaurant/domain/entities/restaurant.dart';

part 'restaurant_filter_state.freezed.dart';

@freezed
class RestaurantFilterState with _$RestaurantFilterState {
  const factory RestaurantFilterState.initial() = _Initial;
  const factory RestaurantFilterState.loading() = _Loading;
  const factory RestaurantFilterState.loaded({
    required List<Restaurant> restaurants,
    required String filterType,
  }) = _Loaded;
  const factory RestaurantFilterState.error(String message) = _Error;
}
