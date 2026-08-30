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
      deliveryTimeMin: (json['prep_time_from'] as num?)?.toInt(),
      deliveryTimeMax: (json['prep_time_to'] as num?)?.toInt(),
      deliveryFee: (json['delivery_fee'] as num?)?.toDouble(),
      isFavorited: json['is_favorited'] as bool?,
    );

Map<String, dynamic> _$RestaurantDtoToJson(_RestaurantDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'cuisineType': instance.cuisineType,
      'coverImageUrl': instance.coverImageUrl,
      'rating': instance.rating,
      'prep_time_from': instance.deliveryTimeMin,
      'prep_time_to': instance.deliveryTimeMax,
      'delivery_fee': instance.deliveryFee,
      'is_favorited': instance.isFavorited,
    };
