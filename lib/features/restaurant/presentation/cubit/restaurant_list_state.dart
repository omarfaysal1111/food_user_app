import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/restaurant/domain/entities/restaurant.dart';

part 'restaurant_list_state.freezed.dart';

@freezed
abstract class RestaurantListState with _$RestaurantListState {
  const factory RestaurantListState.initial() = _Initial;
  const factory RestaurantListState.loading() = _Loading;
  const factory RestaurantListState.loaded({
    @Default([]) List<Restaurant> restaurants,
    @Default(false) bool hasMore,
    @Default(0) int currentPage,
  }) = _Loaded;
  const factory RestaurantListState.error(String message) = _Error;
}
