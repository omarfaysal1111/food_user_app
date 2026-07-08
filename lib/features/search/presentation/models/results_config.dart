class ResultsConfig {
  /// The parent store or restaurant ID context (e.g. searching inside a specific restaurant).
  final String? parentId;

  /// If provided, the screen opens in 'Category Mode' highlighting this category.
  final String? categoryId;

  /// Human-readable display name for the category (used as the header title).
  final String? categoryName;

  /// If provided, the screen opens in 'Search Mode' filtering for this query.
  final String? searchQuery;

  const ResultsConfig({
    this.parentId,
    this.categoryId,
    this.categoryName,
    this.searchQuery,
  });

  bool get isCategoryMode => categoryId != null && categoryId!.isNotEmpty;
  bool get isSearchMode => searchQuery != null && searchQuery!.isNotEmpty;
}
