import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/app_radius.dart';
import 'package:food_user_app/core/theme/app_spacing.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/app_media.dart';
import 'package:food_user_app/core/widgets/app_search_field.dart';
import 'package:food_user_app/core/widgets/app_status_dot_label.dart';
import 'package:food_user_app/features/cart/domain/entities/cart_item.dart';
import 'package:food_user_app/features/restaurant/presentation/models/restaurant_detail_args.dart';
import 'package:food_user_app/features/service_listing/presentation/models/service_listing_config.dart';
import 'package:food_user_app/l10n/app_localizations.dart';
import 'package:food_user_app/core/widgets/empty_state_widget.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  ServiceCategoryData? _selectedCategory;
  final Set<ServiceFilterId> _selectedFilters = {};

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

  void _onTokenTap(String token) {
    _controller.text = token;
    _controller.selection = TextSelection.fromPosition(
      TextPosition(offset: token.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final query = _controller.text.trim();
    final copy = _SearchCopy.of(context);

    final categories = ServiceListingConfig.allServiceCategories(l10n);

    final scope = _selectedCategory?.label;
    List<ServicePlaceData> displayedStores;
    List<ServicePlaceData> displayedLargeStores;

    if (scope == null) {
      displayedStores = copy.groups
          .expand((g) => g.items)
          .where((s) => _matchesQuery(s, query))
          .where((s) => _matchesTopFilter(s))
          .toList(growable: false);
      displayedLargeStores = copy.groups
          .expand((g) => g.largeItems)
          .where((s) => _matchesQuery(s, query))
          .toList(growable: false);
    } else {
      final matched = copy.groups
          .where((g) => g.title == scope)
          .toList(growable: false);
      displayedStores = matched
          .expand((g) => g.items)
          .where((s) => _matchesQuery(s, query))
          .where((s) => _matchesTopFilter(s))
          .toList(growable: false);
      displayedLargeStores = matched
          .expand((g) => g.largeItems)
          .where((s) => _matchesQuery(s, query))
          .toList(growable: false);
    }

    final filteredProducts = query.isEmpty
        ? const <_SearchResult>[]
        : copy
              .results(query)
              .where(
                (r) =>
                    scope == null || r.keywords.any((k) => k.contains(scope)),
              )
              .toList();

    final showFilters = scope != null || query.isNotEmpty;
    final noResults =
        displayedStores.isEmpty && filteredProducts.isEmpty && showFilters;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground(context),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        behavior: HitTestBehavior.opaque,
        child: SafeArea(
          bottom: false,
          child: Column(
            children: [
              // ── Fixed Top Controls Section ───────────────────────────────────
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(
                  AppSpacing.md,
                  20,
                  AppSpacing.md,
                  16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _SearchHeader(title: l10n.searchTitle),
                    const SizedBox(height: 24),
                    AppSearchField(
                      controller: _controller,
                      focusNode: _focusNode,
                      hint: l10n.serviceSearchHint,
                      iconAsset: AppAssets.serviceSearchIcon,
                    ),
                    const SizedBox(height: 16),
                    _CategoryStrip(
                      categories: categories,
                      selectedCategory: _selectedCategory,
                      onSelected: (cat) {
                        setState(() {
                          _selectedCategory =
                              _selectedCategory?.label == cat.label
                              ? null
                              : cat;
                        });
                      },
                    ),
                    if (showFilters) ...[
                      const SizedBox(height: 16),
                      _FilterStrip(
                        filters: ServiceListingConfig.topFilters(l10n),
                        selectedFilters: _selectedFilters,
                        onToggle: (filter) {
                          setState(() {
                            _selectedFilters.contains(filter)
                                ? _selectedFilters.remove(filter)
                                : _selectedFilters.add(filter);
                          });
                        },
                      ),
                    ],
                  ],
                ),
              ),

              // ── Scrollable Results Section ───────────────────────────────────
              Expanded(
                child: CustomScrollView(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  slivers: [
                    SliverPadding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                        AppSpacing.md,
                        0,
                        AppSpacing.md,
                        40,
                      ),
                      sliver: SliverList.list(
                        children: [
                          if (displayedLargeStores.isNotEmpty) ...[
                            _SectionTitle(title: l10n.serviceLargeStores),
                            const SizedBox(height: 12),
                            _LargeStoreRow(items: displayedLargeStores),
                            const SizedBox(height: 22),
                          ],
                          if (!showFilters) ...[
                            _SectionTitle(title: l10n.searchMostSearchedTitle),
                            const SizedBox(height: 12),
                            _MostSearchedTokens(
                              tokens: copy.mostSearchedTokens,
                              onTap: _onTokenTap,
                            ),
                          ] else ...[
                            if (noResults) ...[
                              const SizedBox(height: 48),
                              const EmptyStateWidget(
                                imageWidth: 100,
                                imageHeight: 100,
                              ),
                            ] else ...[
                              if (displayedStores.isNotEmpty) ...[
                                _SectionTitle(title: l10n.serviceAllPlaces),
                                const SizedBox(height: 12),
                                _PlaceList(items: displayedStores),
                                const SizedBox(height: 22),
                              ],
                              if (filteredProducts.isNotEmpty) ...[
                                _SectionTitle(title: l10n.searchResultsTitle),
                                const SizedBox(height: 12),
                                ...filteredProducts.map(
                                  (r) => Padding(
                                    padding: const EdgeInsetsDirectional.only(
                                      bottom: 12,
                                    ),
                                    child: _ResultCard(result: r),
                                  ),
                                ),
                              ],
                            ],
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _matchesQuery(ServicePlaceData place, String query) {
    if (query.isEmpty) return true;
    final searchable =
        '${place.name} ${place.subtitle ?? ''} ${place.time} ${place.rating}'
            .toLowerCase();
    return searchable.contains(query.toLowerCase());
  }

  bool _matchesTopFilter(ServicePlaceData place) {
    if (_selectedFilters.isEmpty) return true;
    return _selectedFilters.every(
      (f) => switch (f) {
        ServiceFilterId.offers => place.hasOffer,
        ServiceFilterId.fastDelivery => place.fastDelivery,
        ServiceFilterId.topRated => place.topRated,
      },
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
          icon: AppSvgImage.asset(
            AppAssets.serviceBackIcon,
            width: 14,
            height: 14,
            color: AppColors.onSurface(context),
          ),
        ),
        const SizedBox(width: 4),
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

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});

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

class _CategoryStrip extends StatelessWidget {
  const _CategoryStrip({
    required this.categories,
    required this.selectedCategory,
    required this.onSelected,
  });

  final List<ServiceCategoryData> categories;
  final ServiceCategoryData? selectedCategory;
  final ValueChanged<ServiceCategoryData> onSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 66,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: categories.length,
        separatorBuilder: (_, _) => const SizedBox(width: 18),
        itemBuilder: (context, index) {
          final cat = categories[index];
          return _CategoryChip(
            category: cat,
            selected: cat.label == selectedCategory?.label,
            onTap: () => onSelected(cat),
          );
        },
      ),
    );
  }
}

class _CategoryChip extends StatelessWidget {
  const _CategoryChip({
    required this.category,
    required this.selected,
    required this.onTap,
  });

  final ServiceCategoryData category;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 44,
            height: 44,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColors.surfaceCard(context),
              borderRadius: const BorderRadius.all(AppRadius.full),
              border: selected
                  ? Border.all(color: AppColors.primary, width: 1)
                  : null,
              boxShadow: [
                BoxShadow(
                  color: AppColors.onSurface(context).withValues(alpha: 0.08),
                  blurRadius: 4,
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.all(7),
              child: category.imageAsset != null
                  ? AppRasterImage.asset(
                      category.imageAsset!,
                      width: 30,
                      height: 30,
                      fit: BoxFit.contain,
                    )
                  : Icon(
                      category.fallbackIcon,
                      color: AppColors.paragraph(context),
                      size: 22,
                    ),
            ),
          ),
          const SizedBox(height: 4),
          Text(
            category.label,
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

class _FilterStrip extends StatelessWidget {
  const _FilterStrip({
    required this.filters,
    required this.selectedFilters,
    required this.onToggle,
  });

  final List<ServiceFilterData> filters;
  final Set<ServiceFilterId> selectedFilters;
  final ValueChanged<ServiceFilterId> onToggle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var i = 0; i < filters.length; i++) ...[
            _FilterChip(
              filter: filters[i],
              selected: selectedFilters.contains(filters[i].id),
              onTap: () => onToggle(filters[i].id),
            ),
            if (i != filters.length - 1) const SizedBox(width: 8),
          ],
        ],
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.filter,
    required this.selected,
    required this.onTap,
  });

  final ServiceFilterData filter;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(AppRadius.sm),
      child: Container(
        height: 32,
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : AppColors.surfaceCard(context),
          borderRadius: const BorderRadius.all(AppRadius.sm),
          boxShadow: [
            BoxShadow(
              color: AppColors.onSurface(context).withValues(alpha: 0.08),
              blurRadius: 2,
            ),
          ],
        ),
        child: Text(
          filter.label,
          style: AppTextStyles.caption(context).copyWith(
            color: selected ? AppColors.text : AppColors.paragraph(context),
            fontSize: 10,
            height: 1.25,
          ),
        ),
      ),
    );
  }
}

class _LargeStoreRow extends StatelessWidget {
  const _LargeStoreRow({required this.items});

  final List<ServicePlaceData> items;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 112,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.zero,
        itemCount: items.length,
        separatorBuilder: (_, _) => const SizedBox(width: 12),
        itemBuilder: (context, index) => _CompactStoreCard(item: items[index]),
      ),
    );
  }
}

class _CompactStoreCard extends StatelessWidget {
  const _CompactStoreCard({required this.item});

  final ServicePlaceData item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 92,
      height: 98,
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard(context),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: AppColors.onSurface(context).withValues(alpha: 0.08),
            blurRadius: 2,
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipOval(
            child: AppRasterImage.asset(
              item.imageAsset,
              width: 40,
              height: 40,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            item.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: AppTextStyles.body(
              context,
            ).copyWith(fontSize: 12, height: 1.3),
          ),
          const SizedBox(height: 4),
          _TimeLabel(
            time: item.time,
            iconSize: 14,
            fontSize: 10,
            textColor: AppColors.onSurface(context),
          ),
        ],
      ),
    );
  }
}

class _PlaceList extends StatelessWidget {
  const _PlaceList({required this.items});

  final List<ServicePlaceData> items;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < items.length; i++) ...[
          _PlaceListTile(item: items[i]),
          if (i != items.length - 1)
            Divider(
              height: 24,
              thickness: 0.5,
              color: AppColors.border(context),
            ),
        ],
      ],
    );
  }
}

class _PlaceListTile extends StatelessWidget {
  const _PlaceListTile({required this.item});

  final ServicePlaceData item;

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return InkWell(
      onTap: () => context.push(
        RouteNames.restaurantDetailFor(_detailId(item.name)),
        extra: _toRestaurantDetailArgs(item),
      ),
      borderRadius: const BorderRadius.all(AppRadius.sm),
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(vertical: 4),
        child: Row(
          children: [
            _PlaceImage(item: item),
            const SizedBox(width: 8),
            Expanded(child: _PlaceDetails(item: item)),
            const SizedBox(width: 8),
            SizedBox(
              width: 20,
              height: 20,
              child: Center(
                child: Transform.scale(
                  scaleX: isRtl ? -1 : 1,
                  child: AppSvgImage.asset(
                    AppAssets.serviceBackIcon,
                    width: 7,
                    height: 12,
                    color: AppColors.onSurface(context),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlaceImage extends StatelessWidget {
  const _PlaceImage({required this.item});

  final ServicePlaceData item;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 56,
      height: 56,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(AppRadius.md),
              child: AppRasterImage.asset(
                item.imageAsset,
                width: 56,
                height: 56,
                fit: BoxFit.cover,
              ),
            ),
          ),
          if (item.showFavourite)
            PositionedDirectional(
              top: 6,
              start: 6,
              child: Container(
                width: 22,
                height: 22,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.surfaceCard(context),
                  borderRadius: const BorderRadius.all(AppRadius.full),
                ),
                child: AppSvgImage.asset(
                  AppAssets.serviceFavouriteIcon,
                  width: 14,
                  height: 14,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _PlaceDetails extends StatelessWidget {
  const _PlaceDetails({required this.item});

  final ServicePlaceData item;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Flexible(
              child: Text(
                item.name,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.start,
                style: AppTextStyles.body(
                  context,
                ).copyWith(fontSize: 12, height: 1.3),
              ),
            ),
            const SizedBox(width: 8),
            AppStatusDotLabel(
              label: l10n.serviceAvailable,
              color: AppColors.success,
            ),
          ],
        ),
        if (item.subtitle != null) ...[
          const SizedBox(height: 4),
          Text(
            item.subtitle!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: AppTextStyles.caption(context).copyWith(fontSize: 10),
          ),
        ],
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            _RatingLabel(rating: item.rating),
            const SizedBox(width: 12),
            _TimeLabel(time: item.time),
          ],
        ),
      ],
    );
  }
}

class _RatingLabel extends StatelessWidget {
  const _RatingLabel({required this.rating});

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppSvgImage.asset(AppAssets.serviceStarIcon, width: 14, height: 14),
        const SizedBox(width: 2),
        Text(
          rating,
          style: AppTextStyles.body(
            context,
          ).copyWith(fontSize: 10, height: 1.25),
        ),
      ],
    );
  }
}

class _TimeLabel extends StatelessWidget {
  const _TimeLabel({
    required this.time,
    this.iconSize = 14,
    this.fontSize = 10,
    this.textColor,
  });

  final String time;
  final double iconSize;
  final double fontSize;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    final color = textColor ?? AppColors.onSurface(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppRasterImage.asset(
          AppAssets.serviceTimeIconPng,
          width: iconSize,
          height: iconSize,
          color: color,
        ),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            time,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.caption(
              context,
            ).copyWith(color: color, fontSize: fontSize, height: 1.25),
          ),
        ),
      ],
    );
  }
}

class _MostSearchedTokens extends StatelessWidget {
  const _MostSearchedTokens({required this.tokens, required this.onTap});

  final List<String> tokens;
  final ValueChanged<String> onTap;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: AppSpacing.sm,
      runSpacing: AppSpacing.sm,
      children: tokens.map((token) {
        return _SearchToken(label: token, onTap: () => onTap(token));
      }).toList(),
    );
  }
}

class _SearchToken extends StatelessWidget {
  const _SearchToken({required this.label, required this.onTap});

  final String label;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(AppRadius.sm),
      child: Container(
        padding: const EdgeInsetsDirectional.fromSTEB(8, 6, 10, 6),
        decoration: BoxDecoration(
          color: AppColors.surfaceCard(context),
          borderRadius: const BorderRadius.all(AppRadius.sm),
          boxShadow: [
            BoxShadow(
              color: AppColors.onSurface(context).withValues(alpha: 0.08),
              blurRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.refresh_rounded,
              size: 14,
              color: AppColors.paragraph(context),
            ),
            const SizedBox(width: 4),
            Text(
              label,
              style: AppTextStyles.caption(context).copyWith(
                color: AppColors.onSurface(context),
                fontSize: 12,
                height: 1.3,
              ),
            ),
          ],
        ),
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
                        AppSvgImage.asset(
                          AppAssets.serviceStarIcon,
                          width: 14,
                          height: 14,
                        ),
                        const SizedBox(width: 2),
                        Text(
                          result.rating,
                          style: AppTextStyles.caption(
                            context,
                          ).copyWith(fontSize: 10),
                        ),
                        const SizedBox(width: 10),
                        AppSvgImage.asset(
                          AppAssets.favoriteTimeIcon,
                          width: 14,
                          height: 14,
                          color: AppColors.paragraph(context),
                        ),
                        const SizedBox(width: 3),
                        Text(
                          result.deliveryTime,
                          style: AppTextStyles.caption(
                            context,
                          ).copyWith(fontSize: 10),
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
    context.push(RouteNames.restaurantDetailFor(result.id));
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

String _detailId(String name) {
  final normalized = name
      .trim()
      .toLowerCase()
      .replaceAll(RegExp(r'\s+'), '-')
      .replaceAll(RegExp(r'[^a-z0-9\u0600-\u06FF-]'), '');
  return normalized.isEmpty ? 'service-place' : normalized;
}

RestaurantDetailArgs _toRestaurantDetailArgs(ServicePlaceData item) {
  return RestaurantDetailArgs(
    id: _detailId(item.name),
    name: item.name,
    description: item.subtitle ?? item.name,
    deliveryTime: item.time,
    rating: double.tryParse(item.rating) ?? 4.5,
    logoAsset: item.imageAsset,
    coverAsset: item.imageAsset,
  );
}

class _SearchGroup {
  const _SearchGroup({
    required this.title,
    this.items = const [],
    this.largeItems = const [],
  });

  final String title;
  final List<ServicePlaceData> items;
  final List<ServicePlaceData> largeItems;
}

class _SearchCopy {
  const _SearchCopy({
    required this.groups,
    required this.mostSearchedTokens,
    required this.allResults,
  });

  final List<_SearchGroup> groups;
  final List<String> mostSearchedTokens;
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
    final l10n = AppLocalizations.of(context)!;
    final kira = ServicePlaceData.restaurant(
      name: l10n.serviceRestaurantKira,
      subtitle: l10n.serviceRestaurantDescription,
      time: l10n.serviceDeliveryTimeRange,
      imageAsset: AppAssets.homeRestaurantCover,
      rating: '4.6',
      hasOffer: true,
    );
    final azAlSham = ServicePlaceData.restaurant(
      name: l10n.serviceRestaurantAzAlSham,
      subtitle: l10n.serviceRestaurantDescription,
      time: l10n.serviceDeliveryTime25To40,
      imageAsset: AppAssets.favoriteRestaurantAzAlSham,
      rating: '4.8',
      fastDelivery: true,
    );
    final captain = ServicePlaceData.store(
      name: l10n.serviceStoreCaptain,
      time: l10n.serviceDeliveryTimeRange,
      imageAsset: AppAssets.searchCaptain,
      rating: '4.5',
      hasOffer: true,
    );
    final fathallah = ServicePlaceData.store(
      name: l10n.serviceStoreFathallah,
      time: l10n.serviceDeliveryTimeRange,
      imageAsset: AppAssets.searchFathallah,
      rating: '4.6',
      fastDelivery: true,
    );
    final beauty = ServicePlaceData.store(
      name: l10n.serviceCategoryPerfumeBeauty,
      time: l10n.serviceDeliveryTime35To50,
      imageAsset: AppAssets.serviceStoresBeauty,
      rating: '4.5',
      hasOffer: true,
    );
    final flowers = ServicePlaceData.store(
      name: l10n.serviceCategoryFlowers,
      time: l10n.serviceDeliveryTime25To40,
      imageAsset: AppAssets.serviceStoresFlowers,
      rating: '4.7',
      fastDelivery: true,
    );
    final rimasLand = ServicePlaceData.pickup(
      name: l10n.serviceStoreRimasLand,
      time: l10n.serviceDeliveryTimeRange,
      imageAsset: AppAssets.servicePickupRimas,
      rating: '4.5',
      hasOffer: true,
      topRated: true,
    );
    final taheraFry = ServicePlaceData.pickup(
      name: l10n.serviceStoreTaheraFry,
      time: l10n.serviceDeliveryTimeRange,
      imageAsset: AppAssets.servicePickupTahera,
      rating: '4.5',
      hasOffer: true,
      topRated: true,
      fastDelivery: true,
    );
    final familyMarket = ServicePlaceData.pickup(
      name: l10n.serviceStoreFamilyMarket,
      time: l10n.serviceDeliveryTimeRange,
      imageAsset: AppAssets.servicePickupFamily,
      rating: '4.5',
      topRated: true,
    );
    final captainMarket = ServicePlaceData.pickup(
      name: l10n.serviceCaptainMarket,
      time: l10n.serviceDeliveryTimeRange,
      imageAsset: AppAssets.servicePickupCaptain,
      rating: '4.5',
      fastDelivery: true,
    );

    return _SearchCopy(
      groups: [
        _SearchGroup(
          title: l10n.serviceCategoryDesserts,
          largeItems: [fathallah, kira],
          items: [kira, azAlSham, rimasLand, kira, azAlSham],
        ),
        _SearchGroup(
          title: l10n.serviceCategoryGrills,
          items: [azAlSham, kira, taheraFry, azAlSham, kira],
        ),
        _SearchGroup(
          title: l10n.serviceCategoryPizza,
          items: [kira, azAlSham, familyMarket, kira, azAlSham, taheraFry],
        ),
        _SearchGroup(
          title: l10n.serviceCategoryFastFood,
          items: [
            taheraFry,
            kira,
            azAlSham,
            captainMarket,
            taheraFry,
            kira,
            taheraFry,
            kira,
            azAlSham,
            captainMarket,
            taheraFry,
            kira,
            taheraFry,
            kira,
            azAlSham,
            captainMarket,
            taheraFry,
            kira,
            taheraFry,
            kira,
          ],
        ),
        _SearchGroup(
          title: l10n.serviceCategoryBurger,
          items: [azAlSham, kira, kira, azAlSham, familyMarket],
        ),
        _SearchGroup(
          title: l10n.serviceCategoryShawarma,
          items: [kira, azAlSham, taheraFry, kira, azAlSham],
        ),
        _SearchGroup(
          title: l10n.serviceCategorySupermarket,
          largeItems: [
            captain,
            fathallah,
            captain,
            fathallah,
            captain,
            fathallah,
            captain,
            fathallah,
          ],
          items: [
            captain,
            fathallah,
            familyMarket,
            captainMarket,
            captain,
            captain,
            fathallah,
            familyMarket,
            captainMarket,
            captain,
            captain,
            fathallah,
            familyMarket,
            captainMarket,
            captain,
            captain,
            fathallah,
            familyMarket,
            captainMarket,
            captain,
          ],
        ),
        _SearchGroup(
          title: l10n.serviceCategorySnacks,
          items: [captain, fathallah, rimasLand, taheraFry, captain],
        ),
        _SearchGroup(
          title: l10n.serviceCategoryDairy,
          largeItems: [fathallah],
          items: [fathallah, captain, familyMarket, fathallah, captain],
        ),
        _SearchGroup(
          title: l10n.serviceCategoryFruitsVegetables,
          largeItems: [captain, fathallah],
          items: [captain, fathallah, captain, fathallah, familyMarket],
        ),
        _SearchGroup(
          title: l10n.serviceCategoryRoasters,
          items: [fathallah, captain, fathallah, captain, captainMarket],
        ),
        _SearchGroup(
          title: l10n.serviceCategoryPerfumeBeauty,
          items: [beauty, flowers, beauty, flowers, beauty],
        ),
        _SearchGroup(
          title: l10n.serviceCategoryFlowers,
          items: [flowers, beauty, rimasLand, flowers, beauty],
        ),
      ],
      mostSearchedTokens: [
        l10n.searchMostSearchedDesserts,
        l10n.searchMostSearchedFalafel,
        l10n.searchMostSearchedPizza,
        l10n.searchMostSearchedNuts,
        l10n.searchMostSearchedPepsi,
        l10n.searchMostSearchedJuice,
        l10n.searchMostSearchedCheese,
      ],
      allResults: [
        _SearchResult(
          id: 'az-al-sham',
          title: l10n.serviceRestaurantAzAlSham,
          subtitle: l10n.serviceRestaurantDescription,
          rating: l10n.orderCourierRating,
          deliveryTime: l10n.serviceDeliveryTimeRange,
          price: l10n.cartPrice(190),
          priceValue: 190,
          imageAsset: AppAssets.favoriteRestaurantAzAlSham,
          isRestaurant: true,
          keywords: [
            l10n.searchMostSearchedAzAlSham,
            l10n.serviceCategoryShawarma,
            l10n.serviceCategoryPizza,
            l10n.homeCategoryRestaurants,
          ],
        ),
        _SearchResult(
          id: 'burger-fries',
          title: l10n.searchResultBurgerFriesTitle,
          subtitle: l10n.serviceRestaurantAzAlSham,
          rating: l10n.orderCourierRating,
          deliveryTime: l10n.serviceDeliveryTimeRange,
          price: l10n.cartPrice(190),
          priceValue: 190,
          imageAsset: AppAssets.productBurgerCombo,
          isRestaurant: false,
          keywords: [
            l10n.serviceCategoryBurger,
            l10n.searchResultBurgerFriesTitle,
            l10n.serviceFilterOffers,
          ],
        ),
        _SearchResult(
          id: 'falafel-breakfast',
          title: l10n.searchResultFalafelTitle,
          subtitle: l10n.searchResultFalafelSubtitle,
          rating: '4.3',
          deliveryTime: l10n.favoriteDeliveryTime,
          price: l10n.searchResultFalafelPrice,
          priceValue: 45,
          imageAsset: AppAssets.cartProductImage,
          isRestaurant: false,
          keywords: [
            l10n.searchResultFalafelKeywordBeans,
            l10n.searchRecentFalafel,
            l10n.searchCravingBreakfast,
          ],
        ),
      ],
    );
  }
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
