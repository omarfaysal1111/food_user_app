import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/payment/domain/entities/checkout_result.dart';

part 'checkout_state.freezed.dart';

@freezed
class CheckoutState with _$CheckoutState {
  const factory CheckoutState.initial() = _Initial;
  const factory CheckoutState.loading() = _Loading;
  const factory CheckoutState.success(CheckoutResult result) = _Success;
  const factory CheckoutState.error(String message) = _Error;
}
