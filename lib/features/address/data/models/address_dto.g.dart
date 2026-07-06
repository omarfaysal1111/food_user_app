// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AddressDto _$AddressDtoFromJson(Map<String, dynamic> json) => _AddressDto(
  id: json['id'] as String,
  label: json['label'] as String?,
  fullAddress: json['fullAddress'] as String?,
  lat: (json['lat'] as num?)?.toDouble(),
  lng: (json['lng'] as num?)?.toDouble(),
  city: json['city'] as String?,
  neighborhood: json['neighborhood'] as String?,
  streetNumber: json['streetNumber'] as String?,
  buildingNumber: json['buildingNumber'] as String?,
  floor: json['floor'] as String?,
  apartment: json['apartment'] as String?,
  addressType: json['addressType'] as String?,
  isDefault: json['default'] as bool?,
);

Map<String, dynamic> _$AddressDtoToJson(_AddressDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'label': instance.label,
      'fullAddress': instance.fullAddress,
      'lat': instance.lat,
      'lng': instance.lng,
      'city': instance.city,
      'neighborhood': instance.neighborhood,
      'streetNumber': instance.streetNumber,
      'buildingNumber': instance.buildingNumber,
      'floor': instance.floor,
      'apartment': instance.apartment,
      'addressType': instance.addressType,
      'default': instance.isDefault,
    };
