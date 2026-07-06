// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_result_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchResultDto _$SearchResultDtoFromJson(Map<String, dynamic> json) =>
    _SearchResultDto(
      restaurants: (json['restaurants'] as List<dynamic>?)
          ?.map((e) => RestaurantDto.fromJson(e as Map<String, dynamic>))
          .toList(),
      items: (json['items'] as List<dynamic>?)
          ?.map((e) => MenuItemDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchResultDtoToJson(_SearchResultDto instance) =>
    <String, dynamic>{
      'restaurants': instance.restaurants,
      'items': instance.items,
    };
