// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'save_card_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SaveCardRequestDto _$SaveCardRequestDtoFromJson(Map<String, dynamic> json) =>
    _SaveCardRequestDto(
      gatewayToken: json['gatewayToken'] as String?,
      gateway: json['gateway'] as String?,
      brand: json['brand'] as String?,
      last4: json['last4'] as String?,
      expMonth: (json['expMonth'] as num?)?.toInt(),
      expYear: (json['expYear'] as num?)?.toInt(),
      makeDefault: json['makeDefault'] as bool?,
    );

Map<String, dynamic> _$SaveCardRequestDtoToJson(_SaveCardRequestDto instance) =>
    <String, dynamic>{
      'gatewayToken': instance.gatewayToken,
      'gateway': instance.gateway,
      'brand': instance.brand,
      'last4': instance.last4,
      'expMonth': instance.expMonth,
      'expYear': instance.expYear,
      'makeDefault': instance.makeDefault,
    };
