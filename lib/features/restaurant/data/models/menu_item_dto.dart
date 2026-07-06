import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/restaurant/domain/entities/menu_item.dart';

part 'menu_item_dto.freezed.dart';
part 'menu_item_dto.g.dart';

@freezed
abstract class MenuItemDto with _$MenuItemDto {
  const factory MenuItemDto({
    required String id,
    String? categoryId,
    String? name,
    String? description,
    double? price,
    double? originalPrice,
    String? imageUrl,
    bool? available,
  }) = _MenuItemDto;

  factory MenuItemDto.fromJson(Map<String, dynamic> json) =>
      _$MenuItemDtoFromJson(json);
}

extension MenuItemDtoMapper on MenuItemDto {
  MenuItem toEntity() {
    return MenuItem(
      id: id,
      name: name ?? '',
      description: description ?? '',
      price: price ?? 0.0,
      originalPrice: originalPrice ?? 0.0,
      imageUrl: imageUrl ?? '',
      available: available ?? false,
    );
  }
}
