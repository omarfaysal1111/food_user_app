// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CartDto _$CartDtoFromJson(Map<String, dynamic> json) => _CartDto(
  id: json['id'] as String,
  restaurantId: json['restaurantId'] as String?,
  restaurantName: json['restaurantName'] as String?,
  items: (json['items'] as List<dynamic>)
      .map((e) => CartItemDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  subtotal: (json['subtotal'] as num).toDouble(),
  deliveryFee: (json['deliveryFee'] as num).toDouble(),
  discount: (json['discount'] as num).toDouble(),
  total: (json['total'] as num).toDouble(),
);

Map<String, dynamic> _$CartDtoToJson(_CartDto instance) => <String, dynamic>{
  'id': instance.id,
  'restaurantId': instance.restaurantId,
  'restaurantName': instance.restaurantName,
  'items': instance.items,
  'subtotal': instance.subtotal,
  'deliveryFee': instance.deliveryFee,
  'discount': instance.discount,
  'total': instance.total,
};
