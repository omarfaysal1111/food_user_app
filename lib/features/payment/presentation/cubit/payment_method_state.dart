import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/payment/domain/entities/payment_card.dart';

part 'payment_method_state.freezed.dart';

@freezed
class PaymentMethodState with _$PaymentMethodState {
  const factory PaymentMethodState.initial() = _Initial;
  const factory PaymentMethodState.loading() = _Loading;
  const factory PaymentMethodState.loaded(List<PaymentCard> cards) = _Loaded;
  const factory PaymentMethodState.error(String message) = _Error;
}
