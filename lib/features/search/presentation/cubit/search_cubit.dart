import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_user_app/features/search/domain/repositories/search_repository.dart';
import 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository searchRepository;

  SearchCubit({required this.searchRepository})
      : super(const SearchState.initial());

  Future<void> search(String query) async {
    if (query.isEmpty) {
      await getSearchHistory();
      return;
    }
    emit(const SearchState.loading());
    final result = await searchRepository.search(query);
    result.fold(
      (failure) => emit(SearchState.error(failure.message)),
      (searchResult) => emit(SearchState.loaded(searchResult)),
    );
  }

  Future<void> getSearchHistory() async {
    emit(const SearchState.loading());
    final result = await searchRepository.getSearchHistory();
    result.fold(
      (failure) => emit(SearchState.error(failure.message)),
      (history) => emit(SearchState.historyLoaded(history)),
    );
  }
}
