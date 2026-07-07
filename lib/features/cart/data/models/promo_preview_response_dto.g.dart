// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'promo_preview_response_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PromoPreviewResponseDto _$PromoPreviewResponseDtoFromJson(
  Map<String, dynamic> json,
) => _PromoPreviewResponseDto(
  discountAmount: (json['discountAmount'] as num).toDouble(),
  total: (json['total'] as num).toDouble(),
);

Map<String, dynamic> _$PromoPreviewResponseDtoToJson(
  _PromoPreviewResponseDto instance,
) => <String, dynamic>{
  'discountAmount': instance.discountAmount,
  'total': instance.total,
};
