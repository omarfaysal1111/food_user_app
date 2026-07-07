import 'package:freezed_annotation/freezed_annotation.dart';

part 'checkout_request_dto.freezed.dart';
part 'checkout_request_dto.g.dart';

@freezed
abstract class CheckoutRequestDto with _$CheckoutRequestDto {
  const factory CheckoutRequestDto({
    required String orderId,
    String? paymentMethodType,
  }) = _CheckoutRequestDto;

  factory CheckoutRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CheckoutRequestDtoFromJson(json);
}
