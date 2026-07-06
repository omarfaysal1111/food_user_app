// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'restaurant_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_RestaurantDto _$RestaurantDtoFromJson(Map<String, dynamic> json) =>
    _RestaurantDto(
      id: json['id'] as String,
      name: json['name'] as String?,
      cuisineType: json['cuisineType'] as String?,
      coverImageUrl: json['coverImageUrl'] as String?,
      rating: (json['rating'] as num?)?.toDouble(),
      deliveryTimeMin: (json['deliveryTimeMin'] as num?)?.toInt(),
      deliveryTimeMax: (json['deliveryTimeMax'] as num?)?.toInt(),
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble(),
      isFavorited: json['isFavorited'] as bool?,
    );

Map<String, dynamic> _$RestaurantDtoToJson(_RestaurantDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cuisineType': instance.cuisineType,
      'coverImageUrl': instance.coverImageUrl,
      'rating': instance.rating,
      'deliveryTimeMin': instance.deliveryTimeMin,
      'deliveryTimeMax': instance.deliveryTimeMax,
      'deliveryFee': instance.deliveryFee,
      'isFavorited': instance.isFavorited,
    };
