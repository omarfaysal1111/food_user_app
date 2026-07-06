// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'banner_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BannerDto _$BannerDtoFromJson(Map<String, dynamic> json) => _BannerDto(
  id: json['id'] as String,
  imageUrl: json['imageUrl'] as String?,
  title: json['title'] as String?,
  subtitle: json['subtitle'] as String?,
  ctaText: json['ctaText'] as String?,
  discountText: json['discountText'] as String?,
  deepLink: json['deepLink'] as String?,
  sortOrder: (json['sortOrder'] as num?)?.toInt(),
  active: json['active'] as bool?,
);

Map<String, dynamic> _$BannerDtoToJson(_BannerDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'ctaText': instance.ctaText,
      'discountText': instance.discountText,
      'deepLink': instance.deepLink,
      'sortOrder': instance.sortOrder,
      'active': instance.active,
    };
