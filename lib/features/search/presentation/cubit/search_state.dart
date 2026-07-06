import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/search/domain/entities/search_result.dart';

part 'search_state.freezed.dart';

@freezed
abstract class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loading() = _Loading;
  const factory SearchState.loaded(SearchResult result) = _Loaded;
  const factory SearchState.historyLoaded(List<String> history) =
      _HistoryLoaded;
  const factory SearchState.error(String message) = _Error;
}
