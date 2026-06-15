import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/app_radius.dart';
import 'package:food_user_app/core/theme/app_spacing.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/app_media.dart';
import 'package:food_user_app/features/cart/domain/entities/cart_item.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..addListener(_onSearchChanged);
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _focusNode.requestFocus();
      }
    });
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_onSearchChanged)
      ..dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onSearchChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final copy = _SearchCopy.of(context);
    final query = _controller.text.trim();
    final results = query.isEmpty
        ? const <_SearchResult>[]
        : copy.results(query);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground(context),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          slivers: [
            SliverPadding(
              padding: const EdgeInsetsDirectional.fromSTEB(
                AppSpacing.md,
                20,
                AppSpacing.md,
                28,
              ),
              sliver: SliverList.list(
                children: [
                  _SearchHeader(title: copy.title),
                  const SizedBox(height: AppSpacing.lg),
                  _SearchInput(
                    controller: _controller,
                    focusNode: _focusNode,
                    hint: copy.searchHint,
                    onClear: _controller.clear,
                  ),
                  const SizedBox(height: AppSpacing.md),
                  _TypeFilterRow(filters: copy.typeFilters),
                  if (query.isEmpty) ...[
                    const SizedBox(height: 20),
                    _DefaultSearchContent(copy: copy),
                  ] else ...[
                    const SizedBox(height: 20),
                    _SearchResultsSection(
                      title: copy.resultsTitle,
                      emptyTitle: copy.emptyTitle,
                      results: results,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SearchHeader extends StatelessWidget {
  const _SearchHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () => context.pop(),
          style: IconButton.styleFrom(
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            minimumSize: const Size(28, 28),
            padding: EdgeInsets.zero,
          ),
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
        ),
        const SizedBox(width: AppSpacing.xs),
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.heading4(
            context,
          ).copyWith(fontSize: 16, height: 1.4),
        ),
      ],
    );
  }
}

class _SearchInput extends StatelessWidget {
  const _SearchInput({
    required this.controller,
    required this.focusNode,
    required this.hint,
    required this.onClear,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hint;
  final VoidCallback onClear;

  @override
  Widget build(BuildContext context) {
    final hasText = controller.text.isNotEmpty;

    return Container(
      height: 42,
      decoration: BoxDecoration(
        color: AppColors.surfaceCard(context),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: AppColors.border(context), width: 0.5),
      ),
      child: Row(
        children: [
          const SizedBox(width: 12),
          Icon(Icons.search_rounded, color: AppColors.hint(context), size: 20),
          const SizedBox(width: AppSpacing.sm),
          Expanded(
            child: TextField(
              controller: controller,
              focusNode: focusNode,
              textInputAction: TextInputAction.search,
              style: AppTextStyles.inputText(context).copyWith(fontSize: 12),
              decoration: InputDecoration(
                border: InputBorder.none,
                isDense: true,
                hintText: hint,
                hintStyle: AppTextStyles.inputHint(
                  context,
                ).copyWith(fontSize: 12),
              ),
            ),
          ),
          if (hasText)
            IconButton(
              onPressed: onClear,
              style: IconButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                minimumSize: const Size(36, 36),
                padding: EdgeInsets.zero,
              ),
              icon: Icon(
                Icons.close_rounded,
                size: 18,
                color: AppColors.paragraph(context),
              ),
            )
          else
            const SizedBox(width: 12),
        ],
      ),
    );
  }
}

class _TypeFilterRow extends StatelessWidget {
  const _TypeFilterRow({required this.filters});

  final List<_SearchFilter> filters;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 36,
      child: ListView.separated(
        reverse: Directionality.of(context) == TextDirection.rtl,
        scrollDirection: Axis.horizontal,
        itemCount: filters.length,
        separatorBuilder: (_, _) => const SizedBox(width: AppSpacing.sm),
        itemBuilder: (context, index) =>
            _FilterChipButton(filter: filters[index]),
      ),
    );
  }
}

class _FilterChipButton extends StatelessWidget {
  const _FilterChipButton({required this.filter});

  final _SearchFilter filter;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 36,
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard(context),
        borderRadius: const BorderRadius.all(AppRadius.sm),
        border: filter.selected
            ? Border.all(color: AppColors.primary, width: 0.5)
            : null,
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 2),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            filter.icon,
            size: filter.selected ? 13 : 18,
            color: filter.color,
          ),
          const SizedBox(width: 4),
          Text(
            filter.label,
            style: AppTextStyles.body(context).copyWith(
              fontSize: 12,
              height: 1.3,
              color: filter.selected
                  ? AppColors.onSurface(context)
                  : AppColors.hint(context),
            ),
          ),
        ],
      ),
    );
  }
}

class _DefaultSearchContent extends StatelessWidget {
  const _DefaultSearchContent({required this.copy});

  final _SearchCopy copy;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(title: copy.cravingTitle),
        const SizedBox(height: 12),
        _CravingList(items: copy.cravings),
        const SizedBox(height: 22),
        _SectionHeader(title: copy.recentTitle),
        const SizedBox(height: 12),
        _TokenWrap(tokens: copy.recentSearches, icon: Icons.refresh_rounded),
        const SizedBox(height: 22),
        _SectionHeader(title: copy.topStoresTitle),
        const SizedBox(height: 12),
        _TopStoresRow(stores: copy.topStores),
        const SizedBox(height: 22),
        _SectionHeader(title: copy.mostSearchedTitle),
        const SizedBox(height: 12),
        _TokenWrap(tokens: copy.mostSearched, icon: Icons.trending_up_rounded),
      ],
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: AppTextStyles.heading4(
          context,
        ).copyWith(fontSize: 15, height: 1.4),
      ),
    );
  }
}

class _CravingList extends StatelessWidget {
  const _CravingList({required this.items});

  final List<_CravingItem> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62,
      child: ListView.separated(
        reverse: Directionality.of(context) == TextDirection.rtl,
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) => _CravingChip(item: items[index]),
      ),
    );
  }
}

class _CravingChip extends StatelessWidget {
  const _CravingChip({required this.item});

  final _CravingItem item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 52,
      child: Column(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: AppColors.warning.withValues(alpha: 0.2),
              borderRadius: const BorderRadius.all(AppRadius.full),
            ),
            child: Icon(item.icon, color: item.color, size: 24),
          ),
          const SizedBox(height: 4),
          Text(
            item.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTextStyles.caption(context).copyWith(
              color: AppColors.onSurface(context),
              fontSize: 12,
              height: 1.3,
            ),
          ),
        ],
      ),
    );
  }
}

class _TokenWrap extends StatelessWidget {
  const _TokenWrap({required this.tokens, required this.icon});

  final List<String> tokens;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: tokens.map((token) {
        return _SearchToken(label: token, icon: icon);
      }).toList(),
    );
  }
}

class _SearchToken extends StatelessWidget {
  const _SearchToken({required this.label, required this.icon});

  final String label;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: 12,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard(context),
        borderRadius: const BorderRadius.all(AppRadius.sm),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 2),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 12, color: AppColors.paragraph(context)),
          const SizedBox(width: 4),
          Text(
            label,
            style: AppTextStyles.caption(context).copyWith(
              color: AppColors.onSurface(context),
              fontSize: 10,
              height: 1.25,
            ),
          ),
        ],
      ),
    );
  }
}

class _TopStoresRow extends StatelessWidget {
  const _TopStoresRow({required this.stores});

  final List<_TopStore> stores;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        for (var index = 0; index < stores.length; index++) ...[
          _TopStoreCard(store: stores[index]),
          if (index != stores.length - 1) const SizedBox(width: 12),
        ],
      ],
    );
  }
}

class _TopStoreCard extends StatelessWidget {
  const _TopStoreCard({required this.store});

  final _TopStore store;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 92,
      padding: const EdgeInsetsDirectional.all(AppSpacing.sm),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard(context),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(color: Colors.black.withValues(alpha: 0.08), blurRadius: 2),
        ],
      ),
      child: Column(
        children: [
          ClipOval(
            child: AppRasterImage.asset(
              store.imageAsset,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            store.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTextStyles.body(
              context,
            ).copyWith(fontSize: 12, height: 1.3),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.schedule_rounded,
                size: 14,
                color: AppColors.paragraph(context),
              ),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  store.deliveryTime,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: AppTextStyles.caption(
                    context,
                  ).copyWith(fontSize: 10, height: 1.25),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _SearchResultsSection extends StatelessWidget {
  const _SearchResultsSection({
    required this.title,
    required this.emptyTitle,
    required this.results,
  });

  final String title;
  final String emptyTitle;
  final List<_SearchResult> results;

  @override
  Widget build(BuildContext context) {
    if (results.isEmpty) {
      return _EmptyResults(title: emptyTitle);
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _SectionHeader(title: title),
        const SizedBox(height: 12),
        ...results.map(
          (result) => Padding(
            padding: const EdgeInsetsDirectional.only(bottom: 12),
            child: _ResultCard(result: result),
          ),
        ),
      ],
    );
  }
}

class _EmptyResults extends StatelessWidget {
  const _EmptyResults({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsetsDirectional.symmetric(
        horizontal: AppSpacing.md,
        vertical: AppSpacing.xl,
      ),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard(context),
        borderRadius: const BorderRadius.all(AppRadius.md),
        border: Border.all(color: AppColors.border(context), width: 0.5),
      ),
      child: Column(
        children: [
          Icon(
            Icons.search_off_rounded,
            color: AppColors.hint(context),
            size: 34,
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.body(context).copyWith(fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class _ResultCard extends StatelessWidget {
  const _ResultCard({required this.result});

  final _SearchResult result;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.surfaceCard(context),
      borderRadius: const BorderRadius.all(AppRadius.md),
      child: InkWell(
        borderRadius: const BorderRadius.all(AppRadius.md),
        onTap: () => _openSearchResult(context, result),
        child: Container(
          padding: const EdgeInsetsDirectional.all(AppSpacing.sm),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(AppRadius.md),
            border: Border.all(color: AppColors.border(context), width: 0.5),
          ),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.all(AppRadius.sm),
                child: AppRasterImage.asset(
                  result.imageAsset,
                  width: 72,
                  height: 72,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      result.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.body(
                        context,
                      ).copyWith(fontSize: 13, height: 1.3),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      result.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.caption(
                        context,
                      ).copyWith(fontSize: 10, height: 1.25),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(
                          Icons.star_rounded,
                          color: Color(0xFFFFB800),
                          size: 14,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          result.rating,
                          style: AppTextStyles.caption(context).copyWith(
                            fontSize: 10,
                            color: AppColors.onSurface(context),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Icon(
                          Icons.schedule_rounded,
                          size: 14,
                          color: AppColors.paragraph(context),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          result.deliveryTime,
                          style: AppTextStyles.caption(context).copyWith(
                            fontSize: 10,
                            color: AppColors.onSurface(context),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: AppSpacing.sm),
              Text(
                result.price,
                style: AppTextStyles.body(
                  context,
                ).copyWith(fontSize: 13, height: 1.25),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _openSearchResult(BuildContext context, _SearchResult result) {
  if (result.isRestaurant) {
    context.push(RouteNames.restaurantDetail.replaceFirst(':id', result.id));
    return;
  }

  context.push(
    RouteNames.productDetails,
    extra: CartItem(
      id: result.id,
      name: result.title,
      description: result.subtitle,
      price: result.priceValue,
      imageAsset: result.imageAsset,
    ),
  );
}

class _SearchCopy {
  const _SearchCopy({
    required this.title,
    required this.searchHint,
    required this.cravingTitle,
    required this.recentTitle,
    required this.topStoresTitle,
    required this.mostSearchedTitle,
    required this.resultsTitle,
    required this.emptyTitle,
    required this.typeFilters,
    required this.cravings,
    required this.recentSearches,
    required this.topStores,
    required this.mostSearched,
    required this.allResults,
  });

  final String title;
  final String searchHint;
  final String cravingTitle;
  final String recentTitle;
  final String topStoresTitle;
  final String mostSearchedTitle;
  final String resultsTitle;
  final String emptyTitle;
  final List<_SearchFilter> typeFilters;
  final List<_CravingItem> cravings;
  final List<String> recentSearches;
  final List<_TopStore> topStores;
  final List<String> mostSearched;
  final List<_SearchResult> allResults;

  List<_SearchResult> results(String query) {
    final normalizedQuery = query.toLowerCase();
    return allResults.where((result) {
      return result.title.toLowerCase().contains(normalizedQuery) ||
          result.subtitle.toLowerCase().contains(normalizedQuery) ||
          result.keywords.any(
            (keyword) => keyword.toLowerCase().contains(normalizedQuery),
          );
    }).toList();
  }

  static _SearchCopy of(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return isArabic ? _arabic : _english;
  }

  static const _arabic = _SearchCopy(
    title: 'البحث',
    searchHint: 'إبحث عن ما تحب',
    cravingTitle: 'نفسك في ايه',
    recentTitle: 'بحثك الاخير',
    topStoresTitle: 'المتاجر الكبرى',
    mostSearchedTitle: 'الاكثر بحثاً',
    resultsTitle: 'نتائج البحث',
    emptyTitle: 'لا توجد نتائج مطابقة',
    typeFilters: [
      _SearchFilter(
        label: 'الكل',
        icon: Icons.grid_view_rounded,
        color: AppColors.primary,
        selected: true,
      ),
      _SearchFilter(
        label: 'المطاعم',
        icon: Icons.ramen_dining_rounded,
        color: Color(0xFFC4823B),
      ),
      _SearchFilter(
        label: 'البقالة',
        icon: Icons.ramen_dining_rounded,
        color: Color(0xFFC4823B),
      ),
      _SearchFilter(
        label: 'المتاجر',
        icon: Icons.ramen_dining_rounded,
        color: Color(0xFFC4823B),
      ),
    ],
    cravings: [
      _CravingItem(
        label: 'فطار',
        icon: Icons.breakfast_dining,
        color: AppColors.primary,
      ),
      _CravingItem(
        label: 'منتجات البان',
        icon: Icons.local_pizza,
        color: Color(0xFFF2A91B),
      ),
      _CravingItem(
        label: 'مشروبات',
        icon: Icons.local_drink,
        color: Color(0xFFE15B94),
      ),
      _CravingItem(
        label: 'تسالي',
        icon: Icons.icecream,
        color: Color(0xFFC4823B),
      ),
      _CravingItem(
        label: 'وجبات سريعة',
        icon: Icons.lunch_dining,
        color: Color(0xFF54A75C),
      ),
      _CravingItem(
        label: 'مخبوزات',
        icon: Icons.bakery_dining,
        color: Color(0xFFD58B3A),
      ),
      _CravingItem(label: 'حلويات', icon: Icons.cake, color: Color(0xFFE15B4F)),
    ],
    recentSearches: ['عصير', 'بيبسي', 'مكسرات', 'فول فلافل'],
    topStores: [
      _TopStore(
        name: 'الكابتن',
        deliveryTime: '45-30 دقيقة',
        imageAsset: AppAssets.favoriteRestaurantAzAlSham,
      ),
      _TopStore(
        name: 'فتح الله',
        deliveryTime: '45-30 دقيقة',
        imageAsset: AppAssets.orderRestaurantAvatar,
      ),
    ],
    mostSearched: ['عز الشام', 'جودت', 'Tea Bun', 'الباشوات'],
    allResults: [
      _SearchResult(
        id: 'az-al-sham',
        title: 'مطعم عز الشام',
        subtitle: 'شاورما، بيتزا، وجبات شرقي',
        rating: '4.5',
        deliveryTime: '45-30 دقيقة',
        price: '190 ج.م',
        priceValue: 190,
        imageAsset: AppAssets.favoriteRestaurantAzAlSham,
        isRestaurant: true,
        keywords: ['عز الشام', 'شاورما', 'بيتزا', 'مطعم'],
      ),
      _SearchResult(
        id: 'burger-fries',
        title: 'عرض البرجر مع الفرايز',
        subtitle: 'مطعم عز الشام',
        rating: '4.5',
        deliveryTime: '45-30 دقيقة',
        price: '190 ج.م',
        priceValue: 190,
        imageAsset: AppAssets.productBurgerCombo,
        isRestaurant: false,
        keywords: ['برجر', 'فرايز', 'عرض'],
      ),
      _SearchResult(
        id: 'falafel-breakfast',
        title: 'فول وفلافل',
        subtitle: 'فطار، سندوتشات، مشروبات',
        rating: '4.3',
        deliveryTime: '30-25 دقيقة',
        price: '45 ج.م',
        priceValue: 45,
        imageAsset: AppAssets.cartProductImage,
        isRestaurant: false,
        keywords: ['فول', 'فلافل', 'فطار'],
      ),
    ],
  );

  static const _english = _SearchCopy(
    title: 'Search',
    searchHint: 'Search for what you love',
    cravingTitle: 'What are you craving?',
    recentTitle: 'Recent searches',
    topStoresTitle: 'Top stores',
    mostSearchedTitle: 'Most searched',
    resultsTitle: 'Search results',
    emptyTitle: 'No matching results',
    typeFilters: [
      _SearchFilter(
        label: 'All',
        icon: Icons.grid_view_rounded,
        color: AppColors.primary,
        selected: true,
      ),
      _SearchFilter(
        label: 'Restaurants',
        icon: Icons.ramen_dining_rounded,
        color: Color(0xFFC4823B),
      ),
      _SearchFilter(
        label: 'Grocery',
        icon: Icons.ramen_dining_rounded,
        color: Color(0xFFC4823B),
      ),
      _SearchFilter(
        label: 'Stores',
        icon: Icons.ramen_dining_rounded,
        color: Color(0xFFC4823B),
      ),
    ],
    cravings: [
      _CravingItem(
        label: 'Breakfast',
        icon: Icons.breakfast_dining,
        color: AppColors.primary,
      ),
      _CravingItem(
        label: 'Dairy',
        icon: Icons.local_pizza,
        color: Color(0xFFF2A91B),
      ),
      _CravingItem(
        label: 'Drinks',
        icon: Icons.local_drink,
        color: Color(0xFFE15B94),
      ),
      _CravingItem(
        label: 'Snacks',
        icon: Icons.icecream,
        color: Color(0xFFC4823B),
      ),
      _CravingItem(
        label: 'Fast food',
        icon: Icons.lunch_dining,
        color: Color(0xFF54A75C),
      ),
      _CravingItem(
        label: 'Bakery',
        icon: Icons.bakery_dining,
        color: Color(0xFFD58B3A),
      ),
      _CravingItem(
        label: 'Desserts',
        icon: Icons.cake,
        color: Color(0xFFE15B4F),
      ),
    ],
    recentSearches: ['Juice', 'Pepsi', 'Nuts', 'Falafel'],
    topStores: [
      _TopStore(
        name: 'El Captain',
        deliveryTime: '30-45 min',
        imageAsset: AppAssets.favoriteRestaurantAzAlSham,
      ),
      _TopStore(
        name: 'Fathallah',
        deliveryTime: '30-45 min',
        imageAsset: AppAssets.orderRestaurantAvatar,
      ),
    ],
    mostSearched: ['Az Al Sham', 'Gawdat', 'Tea Bun', 'El Bashawat'],
    allResults: [
      _SearchResult(
        id: 'az-al-sham',
        title: 'Az Al Sham Restaurant',
        subtitle: 'Shawarma, pizza, oriental meals',
        rating: '4.5',
        deliveryTime: '30-45 min',
        price: 'EGP 190',
        priceValue: 190,
        imageAsset: AppAssets.favoriteRestaurantAzAlSham,
        isRestaurant: true,
        keywords: ['az al sham', 'shawarma', 'pizza', 'restaurant'],
      ),
      _SearchResult(
        id: 'burger-fries',
        title: 'Burger with fries offer',
        subtitle: 'Az Al Sham Restaurant',
        rating: '4.5',
        deliveryTime: '30-45 min',
        price: 'EGP 190',
        priceValue: 190,
        imageAsset: AppAssets.productBurgerCombo,
        isRestaurant: false,
        keywords: ['burger', 'fries', 'offer'],
      ),
      _SearchResult(
        id: 'falafel-breakfast',
        title: 'Falafel breakfast',
        subtitle: 'Breakfast, sandwiches, drinks',
        rating: '4.3',
        deliveryTime: '25-30 min',
        price: 'EGP 45',
        priceValue: 45,
        imageAsset: AppAssets.cartProductImage,
        isRestaurant: false,
        keywords: ['falafel', 'breakfast', 'beans'],
      ),
    ],
  );
}

class _SearchFilter {
  const _SearchFilter({
    required this.label,
    required this.icon,
    required this.color,
    this.selected = false,
  });

  final String label;
  final IconData icon;
  final Color color;
  final bool selected;
}

class _CravingItem {
  const _CravingItem({
    required this.label,
    required this.icon,
    required this.color,
  });

  final String label;
  final IconData icon;
  final Color color;
}

class _TopStore {
  const _TopStore({
    required this.name,
    required this.deliveryTime,
    required this.imageAsset,
  });

  final String name;
  final String deliveryTime;
  final String imageAsset;
}

class _SearchResult {
  const _SearchResult({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.rating,
    required this.deliveryTime,
    required this.price,
    required this.priceValue,
    required this.imageAsset,
    required this.isRestaurant,
    required this.keywords,
  });

  final String id;
  final String title;
  final String subtitle;
  final String rating;
  final String deliveryTime;
  final String price;
  final int priceValue;
  final String imageAsset;
  final bool isRestaurant;
  final List<String> keywords;
}
