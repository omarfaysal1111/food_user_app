import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/payment/domain/entities/payment_card.dart';

part 'payment_card_dto.freezed.dart';
part 'payment_card_dto.g.dart';

@freezed
abstract class PaymentCardDto with _$PaymentCardDto {
  const factory PaymentCardDto({
    required String id,
    String? gateway,
    String? brand,
    String? last4,
    int? expMonth,
    int? expYear,
    @JsonKey(name: 'default') bool? isDefault,
  }) = _PaymentCardDto;

  factory PaymentCardDto.fromJson(Map<String, dynamic> json) =>
      _$PaymentCardDtoFromJson(json);
}

extension PaymentCardDtoMapper on PaymentCardDto {
  PaymentCard toEntity() {
    return PaymentCard(
      id: id,
      gateway: gateway,
      brand: brand,
      last4: last4,
      expMonth: expMonth,
      expYear: expYear,
      isDefault: isDefault ?? false,
    );
  }
}
