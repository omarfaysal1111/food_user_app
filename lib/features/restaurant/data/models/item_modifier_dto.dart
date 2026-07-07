import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/restaurant/domain/entities/modifier.dart';

part 'item_modifier_dto.freezed.dart';
part 'item_modifier_dto.g.dart';

@freezed
abstract class ItemModifierDto with _$ItemModifierDto {
  const factory ItemModifierDto({
    required String id,
    String? name,
    @Default([]) List<Map<String, dynamic>> options,
  }) = _ItemModifierDto;

  factory ItemModifierDto.fromJson(Map<String, dynamic> json) =>
      _$ItemModifierDtoFromJson(json);
}

extension ItemModifierDtoMapper on ItemModifierDto {
  Modifier toEntity() {
    return Modifier(id: id, name: name ?? '', options: options);
  }
}
