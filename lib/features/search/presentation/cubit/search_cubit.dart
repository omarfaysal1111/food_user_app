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
    if (isClosed) return;
    result.fold(
      (failure) => emit(SearchState.error(failure.message)),
      (searchResult) => emit(SearchState.loaded(searchResult)),
    );
  }

  Future<void> getSearchHistory() async {
    emit(const SearchState.loading());
    final result = await searchRepository.getSearchHistory();
    if (isClosed) return;
    result.fold(
      (failure) => emit(SearchState.error(failure.message)),
      (history) => emit(SearchState.historyLoaded(history)),
    );
  }
  Future<void> addSearchLog(String term) async {
    // Optimistic or just call API
    await searchRepository.addSearchLog(term);
    // Refresh history
    getSearchHistory();
  }

  Future<void> deleteSearchLog(int id) async {
    final currentState = state;
    
    state.maybeWhen(
      historyLoaded: (history) async {
        final updatedHistory = history.where((log) => log.id != id).toList();
        emit(SearchState.historyLoaded(updatedHistory));
        
        final result = await searchRepository.deleteSearchLog(id);
        if (result.isLeft()) {
          emit(currentState);
        }
      },
      orElse: () {},
    );
  }

  Future<void> clearSearchLogs() async {
    emit(const SearchState.historyLoaded([]));
    await searchRepository.clearSearchLogs();
  }
}
