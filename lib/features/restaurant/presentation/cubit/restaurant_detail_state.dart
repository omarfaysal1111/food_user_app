import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/restaurant/domain/entities/branch.dart';
import 'package:food_user_app/features/restaurant/domain/entities/offer.dart';
import 'package:food_user_app/features/restaurant/domain/entities/restaurant.dart';
import 'package:food_user_app/features/restaurant/domain/entities/menu_category.dart';

part 'restaurant_detail_state.freezed.dart';

@freezed
abstract class RestaurantDetailState with _$RestaurantDetailState {
  const factory RestaurantDetailState.initial() = _Initial;
  const factory RestaurantDetailState.loading() = _Loading;
  const factory RestaurantDetailState.loaded({
    required Restaurant restaurant,
    @Default([]) List<MenuCategory> menuCategories,
    @Default([]) List<Branch> branches,
    @Default([]) List<Offer> offers,
  }) = _Loaded;
  const factory RestaurantDetailState.error(String message) = _Error;
}
