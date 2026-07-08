import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/restaurant/domain/entities/menu_category.dart';
import 'package:food_user_app/features/restaurant/domain/entities/menu_item.dart';
import 'package:food_user_app/features/restaurant/domain/entities/restaurant.dart';

part 'store_detail_state.freezed.dart';

@freezed
abstract class StoreDetailState with _$StoreDetailState {
  const factory StoreDetailState.initial() = _Initial;
  const factory StoreDetailState.loading() = _Loading;
  const factory StoreDetailState.error(String message) = _Error;
  const factory StoreDetailState.loaded({
    required Restaurant store,
    required List<MenuCategory> categories,
    required List<MenuItem> featuredProducts,
  }) = _Loaded;
}
