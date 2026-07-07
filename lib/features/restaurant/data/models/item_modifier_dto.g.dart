// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_modifier_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ItemModifierDto _$ItemModifierDtoFromJson(Map<String, dynamic> json) =>
    _ItemModifierDto(
      id: json['id'] as String,
      name: json['name'] as String?,
      options:
          (json['options'] as List<dynamic>?)
              ?.map((e) => e as Map<String, dynamic>)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$ItemModifierDtoToJson(_ItemModifierDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'options': instance.options,
    };
