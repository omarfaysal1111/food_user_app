import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/restaurant/domain/entities/menu_category.dart';
import 'package:food_user_app/features/restaurant/domain/entities/menu_item.dart';

part 'unified_results_state.freezed.dart';

@freezed
abstract class UnifiedResultsState with _$UnifiedResultsState {
  const factory UnifiedResultsState.initial() = _Initial;
  const factory UnifiedResultsState.loading() = _Loading;
  const factory UnifiedResultsState.error(String message) = _Error;
  const factory UnifiedResultsState.loaded({
    required List<MenuCategory> categories,
    required List<MenuItem> searchResults,
    required bool isSearchMode,
    @Default(0) int selectedTabIndex,
    @Default('') String activeQuery,
  }) = _Loaded;
}
