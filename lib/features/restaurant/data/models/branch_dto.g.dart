// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'branch_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BranchDto _$BranchDtoFromJson(Map<String, dynamic> json) => _BranchDto(
  id: json['id'] as String,
  restaurantId: json['restaurantId'] as String?,
  address: json['address'] as String?,
  lat: (json['lat'] as num?)?.toDouble(),
  lng: (json['lng'] as num?)?.toDouble(),
  operatingHours: json['operatingHours'] as Map<String, dynamic>?,
  active: json['active'] as bool?,
);

Map<String, dynamic> _$BranchDtoToJson(_BranchDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'restaurantId': instance.restaurantId,
      'address': instance.address,
      'lat': instance.lat,
      'lng': instance.lng,
      'operatingHours': instance.operatingHours,
      'active': instance.active,
    };
