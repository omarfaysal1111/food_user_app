import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/cart/domain/entities/cart.dart';
import 'package:food_user_app/features/cart/domain/entities/promo.dart';

part 'cart_state.freezed.dart';

@freezed
class CartState with _$CartState {
  const factory CartState.initial() = _Initial;
  const factory CartState.loading() = _Loading;
  const factory CartState.loaded({
    required Cart cart,
    Promo? appliedPromo,
  }) = _Loaded;
  const factory CartState.error({
    required Cart cart,
    Promo? appliedPromo,
    required String message,
  }) = _Error;
}
