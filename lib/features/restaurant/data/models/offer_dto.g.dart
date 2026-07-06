// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OfferDto _$OfferDtoFromJson(Map<String, dynamic> json) => _OfferDto(
  id: json['id'] as String,
  restaurantId: json['restaurantId'] as String?,
  title: json['title'] as String?,
  discountPercent: (json['discountPercent'] as num?)?.toInt(),
  minOrderAmount: (json['minOrderAmount'] as num?)?.toDouble(),
  description: json['description'] as String?,
  expiresAt: json['expiresAt'] as String?,
  active: json['active'] as bool?,
);

Map<String, dynamic> _$OfferDtoToJson(_OfferDto instance) => <String, dynamic>{
  'id': instance.id,
  'restaurantId': instance.restaurantId,
  'title': instance.title,
  'discountPercent': instance.discountPercent,
  'minOrderAmount': instance.minOrderAmount,
  'description': instance.description,
  'expiresAt': instance.expiresAt,
  'active': instance.active,
};
