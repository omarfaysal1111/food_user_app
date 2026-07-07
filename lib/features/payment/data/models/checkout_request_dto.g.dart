// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CheckoutRequestDto _$CheckoutRequestDtoFromJson(Map<String, dynamic> json) =>
    _CheckoutRequestDto(
      orderId: json['orderId'] as String,
      paymentMethodType: json['paymentMethodType'] as String?,
    );

Map<String, dynamic> _$CheckoutRequestDtoToJson(_CheckoutRequestDto instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'paymentMethodType': instance.paymentMethodType,
    };
