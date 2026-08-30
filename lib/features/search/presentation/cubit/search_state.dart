import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/search/domain/entities/search_result.dart';
import 'package:food_user_app/features/search/domain/entities/search_log.dart';
import 'package:food_user_app/features/search/domain/entities/search_keyword.dart';
import 'package:food_user_app/features/home/domain/entities/tag.dart';

import 'package:food_user_app/features/restaurant/domain/entities/restaurant.dart';

part 'search_state.freezed.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loading() = _Loading;
  const factory SearchState.loaded(SearchResult result) = _Loaded;
  const factory SearchState.initialDataLoaded({
    required List<SearchLog> history,
    required List<SearchKeyword> keywords,
    required List<Tag> tags,
    required List<Restaurant> majorStores,
  }) = _InitialDataLoaded;
  const factory SearchState.error(String message) = _Error;
}
