// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_tracking_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_OrderTrackingDto _$OrderTrackingDtoFromJson(Map<String, dynamic> json) =>
    _OrderTrackingDto(
      orderId: json['orderId'] as String,
      status: json['status'] as String,
      estimatedMinutes: (json['estimatedMinutes'] as num?)?.toInt(),
      driverName: json['driverName'] as String?,
      driverPhone: json['driverPhone'] as String?,
      driverLat: (json['driverLat'] as num?)?.toDouble(),
      driverLng: (json['driverLng'] as num?)?.toDouble(),
      driverRating: (json['driverRating'] as num?)?.toDouble(),
      timeline: (json['timeline'] as List<dynamic>?)
          ?.map((e) => TimelineEntryDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$OrderTrackingDtoToJson(_OrderTrackingDto instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'status': instance.status,
      'estimatedMinutes': instance.estimatedMinutes,
      'driverName': instance.driverName,
      'driverPhone': instance.driverPhone,
      'driverLat': instance.driverLat,
      'driverLng': instance.driverLng,
      'driverRating': instance.driverRating,
      'timeline': instance.timeline,
    };

_TimelineEntryDto _$TimelineEntryDtoFromJson(Map<String, dynamic> json) =>
    _TimelineEntryDto(
      status: json['status'] as String,
      description: json['description'] as String?,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$TimelineEntryDtoToJson(_TimelineEntryDto instance) =>
    <String, dynamic>{
      'status': instance.status,
      'description': instance.description,
      'timestamp': instance.timestamp.toIso8601String(),
    };
