// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderDto _$OrderDtoFromJson(Map<String, dynamic> json) => _OrderDto(
  id: json['id'] as String,
  customerId: json['customerId'] as String,
  branchId: json['branchId'] as String,
  status: json['status'] as String,
  subtotal: (json['subtotal'] as num).toDouble(),
  deliveryFee: (json['deliveryFee'] as num).toDouble(),
  total: (json['total'] as num).toDouble(),
  discount: (json['discount'] as num).toDouble(),
  items: (json['items'] as List<dynamic>)
      .map((e) => OrderItemDto.fromJson(e as Map<String, dynamic>))
      .toList(),
  createdAt: DateTime.parse(json['createdAt'] as String),
  restaurantName: json['restaurantName'] as String?,
  deliveryAddress: json['deliveryAddress'] as String?,
  deliveryLat: (json['deliveryLat'] as num?)?.toDouble(),
  deliveryLng: (json['deliveryLng'] as num?)?.toDouble(),
  paymentMethod: json['paymentMethod'] as String?,
  estimatedMinutes: (json['estimatedMinutes'] as num?)?.toInt(),
  driverName: json['driverName'] as String?,
  driverPhone: json['driverPhone'] as String?,
  driverLat: (json['driverLat'] as num?)?.toDouble(),
  driverLng: (json['driverLng'] as num?)?.toDouble(),
);

Map<String, dynamic> _$OrderDtoToJson(_OrderDto instance) => <String, dynamic>{
  'id': instance.id,
  'customerId': instance.customerId,
  'branchId': instance.branchId,
  'status': instance.status,
  'subtotal': instance.subtotal,
  'deliveryFee': instance.deliveryFee,
  'total': instance.total,
  'discount': instance.discount,
  'items': instance.items,
  'createdAt': instance.createdAt.toIso8601String(),
  'restaurantName': instance.restaurantName,
  'deliveryAddress': instance.deliveryAddress,
  'deliveryLat': instance.deliveryLat,
  'deliveryLng': instance.deliveryLng,
  'paymentMethod': instance.paymentMethod,
  'estimatedMinutes': instance.estimatedMinutes,
  'driverName': instance.driverName,
  'driverPhone': instance.driverPhone,
  'driverLat': instance.driverLat,
  'driverLng': instance.driverLng,
};

_OrderItemDto _$OrderItemDtoFromJson(Map<String, dynamic> json) =>
    _OrderItemDto(
      menuItemId: json['menuItemId'] as String,
      itemName: json['itemName'] as String,
      quantity: (json['quantity'] as num).toInt(),
      unitPrice: (json['unitPrice'] as num).toDouble(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      selectedModifiers: json['selectedModifiers'] as List<dynamic>?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$OrderItemDtoToJson(_OrderItemDto instance) =>
    <String, dynamic>{
      'menuItemId': instance.menuItemId,
      'itemName': instance.itemName,
      'quantity': instance.quantity,
      'unitPrice': instance.unitPrice,
      'totalPrice': instance.totalPrice,
      'selectedModifiers': instance.selectedModifiers,
      'notes': instance.notes,
    };
