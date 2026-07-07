// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentCardDto _$PaymentCardDtoFromJson(Map<String, dynamic> json) =>
    _PaymentCardDto(
      id: json['id'] as String,
      gateway: json['gateway'] as String?,
      brand: json['brand'] as String?,
      last4: json['last4'] as String?,
      expMonth: (json['expMonth'] as num?)?.toInt(),
      expYear: (json['expYear'] as num?)?.toInt(),
      isDefault: json['default'] as bool?,
    );

Map<String, dynamic> _$PaymentCardDtoToJson(_PaymentCardDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'gateway': instance.gateway,
      'brand': instance.brand,
      'last4': instance.last4,
      'expMonth': instance.expMonth,
      'expYear': instance.expYear,
      'default': instance.isDefault,
    };
