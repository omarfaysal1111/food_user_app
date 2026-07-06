// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_address_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateAddressRequest _$CreateAddressRequestFromJson(
  Map<String, dynamic> json,
) => _CreateAddressRequest(
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

Map<String, dynamic> _$CreateAddressRequestToJson(
  _CreateAddressRequest instance,
) => <String, dynamic>{
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
