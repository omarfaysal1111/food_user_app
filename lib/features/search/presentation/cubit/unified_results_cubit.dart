import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_user_app/features/restaurant/domain/entities/menu_category.dart';
import 'package:food_user_app/features/restaurant/domain/entities/menu_item.dart';
import 'package:food_user_app/features/restaurant/domain/repositories/menu_repository.dart';
import 'package:food_user_app/features/search/presentation/models/results_config.dart';

import 'unified_results_state.dart';

class UnifiedResultsCubit extends Cubit<UnifiedResultsState> {
  // ignore: unused_field
  final MenuRepository _menuRepository;

  /// All categories loaded from the backend (or mock). Immutable after load.
  List<MenuCategory> _cachedCategories = [];

  /// Whether the screen was opened in pure Search Mode. Never changes after load.
  bool _originalIsSearchMode = false;

  /// Currently selected subcategory tab index (0 = "الكل" / All).
  int _selectedTabIndex = 0;

  /// The active search query text. Empty string means no active search.
  String _activeQuery = '';

  UnifiedResultsCubit({required MenuRepository menuRepository})
      : _menuRepository = menuRepository,
        super(const UnifiedResultsState.initial());

  // ─── Load ────────────────────────────────────────────────────────────────────

  Future<void> loadResults(ResultsConfig config) async {
    emit(const UnifiedResultsState.loading());

    try {
      final parentId = config.parentId;
      if (parentId == null || parentId.isEmpty) {
        emit(const UnifiedResultsState.error(
            'Missing parent store/restaurant ID'));
        return;
      }

      final result = await _menuRepository.getRestaurantMenu(parentId);
      
      result.fold(
        (failure) => emit(UnifiedResultsState.error(failure.message)),
        (categories) {
          _cachedCategories = categories;
      _originalIsSearchMode = config.isSearchMode;
      _selectedTabIndex = 0;
      _activeQuery = config.searchQuery?.trim() ?? '';

      if (config.isSearchMode) {
        final results = _scopedFilter(_activeQuery);
        emit(UnifiedResultsState.loaded(
          categories: _cachedCategories,
          searchResults: results,
          isSearchMode: true,
          selectedTabIndex: _selectedTabIndex,
          activeQuery: _activeQuery,
        ));
      } else {
        emit(UnifiedResultsState.loaded(
          categories: _cachedCategories,
          searchResults: const [],
          isSearchMode: false,
          selectedTabIndex: _selectedTabIndex,
          activeQuery: _activeQuery,
        ));
      }
    });
    } catch (e) {
      emit(UnifiedResultsState.error(e.toString()));
    }
  }

  // ─── Search ───────────────────────────────────────────────────────────────────

  /// Called on every keystroke. Filters ONLY the currently selected tab's items.
  /// Tab visibility is preserved by keeping [isSearchMode] = [_originalIsSearchMode].
  void search(String query) {
    _activeQuery = query.trim();
    final results = _scopedFilter(_activeQuery);

    emit(UnifiedResultsState.loaded(
      categories: _cachedCategories,
      searchResults: results,
      isSearchMode: _originalIsSearchMode,
      selectedTabIndex: _selectedTabIndex,
      activeQuery: _activeQuery,
    ));
  }

  // ─── Tab change ───────────────────────────────────────────────────────────────

  /// Called when the user taps a subcategory tab.
  /// If a search query is active, re-applies it scoped to the new tab.
  void changeCategory(int index) {
    _selectedTabIndex = index;

    // Always re-evaluate with the active query scoped to the new tab.
    final results = _activeQuery.isNotEmpty
        ? _scopedFilter(_activeQuery)
        : <MenuItem>[];

    emit(UnifiedResultsState.loaded(
      categories: _cachedCategories,
      searchResults: results,
      isSearchMode: _originalIsSearchMode,
      selectedTabIndex: _selectedTabIndex,
      activeQuery: _activeQuery,
    ));
  }

  // ─── Helpers ──────────────────────────────────────────────────────────────────

  /// Returns the item pool for the current tab index.
  ///
  /// - Index 0 ("الكل") → all items across every category.
  /// - Index N → items of `_cachedCategories[N - 1]` only.
  List<MenuItem> _tabItems() {
    if (_selectedTabIndex == 0) {
      return _cachedCategories.expand((c) => c.items).toList();
    }
    final catIndex = _selectedTabIndex - 1;
    if (catIndex < _cachedCategories.length) {
      return _cachedCategories[catIndex].items;
    }
    return [];
  }

  /// Filters [_tabItems()] by [query]. Empty query returns the full tab pool.
  List<MenuItem> _scopedFilter(String query) {
    final pool = _tabItems();
    final q = query.toLowerCase().trim();
    if (q.isEmpty) return pool;
    return pool
        .where(
          (item) =>
              item.name.toLowerCase().contains(q) ||
              item.description.toLowerCase().contains(q),
        )
        .toList();
  }
}
