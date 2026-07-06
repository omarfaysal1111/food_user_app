// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menu_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MenuItemDto _$MenuItemDtoFromJson(Map<String, dynamic> json) => _MenuItemDto(
  id: json['id'] as String,
  categoryId: json['categoryId'] as String?,
  name: json['name'] as String?,
  description: json['description'] as String?,
  price: (json['price'] as num?)?.toDouble(),
  originalPrice: (json['originalPrice'] as num?)?.toDouble(),
  imageUrl: json['imageUrl'] as String?,
  available: json['available'] as bool?,
);

Map<String, dynamic> _$MenuItemDtoToJson(_MenuItemDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'categoryId': instance.categoryId,
      'name': instance.name,
      'description': instance.description,
      'price': instance.price,
      'originalPrice': instance.originalPrice,
      'imageUrl': instance.imageUrl,
      'available': instance.available,
    };
