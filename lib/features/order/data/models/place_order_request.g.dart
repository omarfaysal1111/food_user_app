// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'place_order_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlaceOrderRequest _$PlaceOrderRequestFromJson(Map<String, dynamic> json) =>
    _PlaceOrderRequest(
      branchId: json['branchId'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => OrderItemRequest.fromJson(e as Map<String, dynamic>))
          .toList(),
      addressId: json['addressId'] as String?,
      deliveryAddress: json['deliveryAddress'] as String?,
      deliveryLat: (json['deliveryLat'] as num?)?.toDouble(),
      deliveryLng: (json['deliveryLng'] as num?)?.toDouble(),
      paymentMethod: json['paymentMethod'] as String?,
      promoCode: json['promoCode'] as String?,
      specialInstructions: json['specialInstructions'] as String?,
    );

Map<String, dynamic> _$PlaceOrderRequestToJson(_PlaceOrderRequest instance) =>
    <String, dynamic>{
      'branchId': instance.branchId,
      'items': instance.items,
      'addressId': instance.addressId,
      'deliveryAddress': instance.deliveryAddress,
      'deliveryLat': instance.deliveryLat,
      'deliveryLng': instance.deliveryLng,
      'paymentMethod': instance.paymentMethod,
      'promoCode': instance.promoCode,
      'specialInstructions': instance.specialInstructions,
    };

_OrderItemRequest _$OrderItemRequestFromJson(Map<String, dynamic> json) =>
    _OrderItemRequest(
      menuItemId: json['menuItemId'] as String,
      quantity: (json['quantity'] as num).toInt(),
      selectedModifiers: json['selectedModifiers'] as List<dynamic>?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$OrderItemRequestToJson(_OrderItemRequest instance) =>
    <String, dynamic>{
      'menuItemId': instance.menuItemId,
      'quantity': instance.quantity,
      'selectedModifiers': instance.selectedModifiers,
      'notes': instance.notes,
    };
