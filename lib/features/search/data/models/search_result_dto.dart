import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/restaurant/data/models/restaurant_dto.dart';
import 'package:food_user_app/features/restaurant/data/models/menu_item_dto.dart';
import 'package:food_user_app/features/search/domain/entities/search_result.dart';

part 'search_result_dto.freezed.dart';
part 'search_result_dto.g.dart';

@freezed
abstract class SearchResultDto with _$SearchResultDto {
  const factory SearchResultDto({
    List<RestaurantDto>? restaurants,
    List<MenuItemDto>? items,
  }) = _SearchResultDto;

  factory SearchResultDto.fromJson(Map<String, dynamic> json) =>
      _$SearchResultDtoFromJson(json);
}

extension SearchResultDtoMapper on SearchResultDto {
  SearchResult toEntity() {
    return SearchResult(
      restaurants:
          restaurants?.map((dto) => dto.toEntity()).toList() ?? const [],
      items: items?.map((dto) => dto.toEntity()).toList() ?? const [],
    );
  }
}
