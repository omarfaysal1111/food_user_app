import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:food_user_app/features/restaurant/domain/entities/restaurant.dart';

part 'favorite_state.freezed.dart';

@freezed
class FavoriteState with _$FavoriteState {
  const factory FavoriteState.initial() = _Initial;
  const factory FavoriteState.loading() = _Loading;
  const factory FavoriteState.loaded({
    required Set<String> favoriteIds,
    required List<Restaurant> favoriteRestaurants,
  }) = _Loaded;
  const factory FavoriteState.error({
    required Set<String> favoriteIds,
    required List<Restaurant> favoriteRestaurants,
    required String message,
  }) = _Error;
}
