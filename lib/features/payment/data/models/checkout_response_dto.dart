import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/payment/domain/entities/checkout_result.dart';

part 'checkout_response_dto.freezed.dart';
part 'checkout_response_dto.g.dart';

@freezed
abstract class CheckoutResponseDto with _$CheckoutResponseDto {
  const factory CheckoutResponseDto({
    String? transactionId,
    String? paymentIntentId,
    String? clientSecret,
    double? amount,
    String? currency,
  }) = _CheckoutResponseDto;

  factory CheckoutResponseDto.fromJson(Map<String, dynamic> json) =>
      _$CheckoutResponseDtoFromJson(json);
}

extension CheckoutResponseDtoMapper on CheckoutResponseDto {
  CheckoutResult toEntity() {
    return CheckoutResult(
      transactionId: transactionId,
      paymentIntentId: paymentIntentId,
      clientSecret: clientSecret,
      amount: amount,
      currency: currency,
    );
  }
}
