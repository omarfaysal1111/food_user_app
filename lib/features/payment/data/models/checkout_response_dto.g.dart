// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckoutResponseDto _$CheckoutResponseDtoFromJson(Map<String, dynamic> json) =>
    _CheckoutResponseDto(
      transactionId: json['transactionId'] as String?,
      paymentIntentId: json['paymentIntentId'] as String?,
      clientSecret: json['clientSecret'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$CheckoutResponseDtoToJson(
  _CheckoutResponseDto instance,
) => <String, dynamic>{
  'transactionId': instance.transactionId,
  'paymentIntentId': instance.paymentIntentId,
  'clientSecret': instance.clientSecret,
  'amount': instance.amount,
  'currency': instance.currency,
};
