import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/app_radius.dart';
import 'package:food_user_app/core/theme/app_spacing.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/app_media.dart';
import 'package:food_user_app/features/restaurant/presentation/pages/restaurant_detail_screen.dart';
import 'package:food_user_app/features/service_listing/presentation/models/service_listing_config.dart';
import 'package:food_user_app/features/service_listing/presentation/models/service_listing_type.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class ServiceListingScreen extends StatefulWidget {
  const ServiceListingScreen({required this.type, super.key});

  final ServiceListingType type;

  @override
  State<ServiceListingScreen> createState() => _ServiceListingScreenState();
}

class _ServiceListingScreenState extends State<ServiceListingScreen> {
  final _scrollController = ScrollController();
  final _searchController = TextEditingController();

  var _selectedCategoryIndex = 0;
  ServiceListingType? _initializedType;
  Set<ServiceFilterId> _activeFilters = const {};
  var _searchQuery = '';

  @override
  void dispose() {
    _searchController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final config = ServiceListingConfig.of(l10n, widget.type);
    _initializeSelection(config);
    final pickupGroups = _visiblePickupGroups(config);
    final usesCategoryFilters = _usesCategoryFilters(config);
    final displayedItems = usesCategoryFilters
        ? _filteredItems(_displayedItemsForSelectedCategory(config.groups))
        : null;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground(context),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: const EdgeInsetsDirectional.fromSTEB(16, 20, 16, 24),
              sliver: SliverList.list(
                children: [
                  _ListingHeader(title: config.title),
                  const SizedBox(height: 24),
                  _ListingSearchBox(
                    controller: _searchController,
                    hint: config.searchHint,
                    onChanged: _onSearchChanged,
                  ),
                  if (config.categories.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    _ServiceCategoryStrip(
                      categories: config.categories,
                      selectedIndex: _selectedCategoryIndex,
                      onSelected: _selectCategory,
                    ),
                  ],
                  if (config.filters.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    _ServiceFilterStrip(
                      filters: config.filters,
                      activeFilters: _activeFilters,
                      onToggle: _toggleFilter,
                    ),
                  ],
                  if (displayedItems != null) ...[
                    const SizedBox(height: 16),
                    _SelectedCategoryTitle(
                      title: _selectedCategoryTitle(config),
                    ),
                    const SizedBox(height: 12),
                    _ServicePlaceCollection(
                      layout: _layoutForSelectedCategory(config.groups),
                      items: displayedItems,
                    ),
                  ] else
                    for (
                      var index = 0;
                      index < pickupGroups.length;
                      index++
                    ) ...[
                      const SizedBox(height: 16),
                      _PickupGroup(group: pickupGroups[index]),
                    ],
                  if (displayedItems != null && displayedItems.isEmpty) ...[
                    const SizedBox(height: 88),
                    _EmptyListingState(l10n: l10n),
                  ],
                  if (displayedItems == null && pickupGroups.isEmpty) ...[
                    const SizedBox(height: 88),
                    _EmptyListingState(l10n: l10n),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _initializeSelection(ServiceListingConfig config) {
    if (_initializedType == config.type) return;
    _initializedType = config.type;
    _selectedCategoryIndex = 0;
    _activeFilters = {
      for (final filter in config.filters)
        if (filter.selected) filter.id,
    };
  }

  void _toggleFilter(ServiceFilterId id) {
    setState(() {
      final next = Set<ServiceFilterId>.from(_activeFilters);
      next.contains(id) ? next.remove(id) : next.add(id);
      _activeFilters = next;
    });
  }

  void _selectCategory(int index) {
    setState(() => _selectedCategoryIndex = index);
  }

  void _onSearchChanged(String value) {
    setState(() => _searchQuery = value.trim());
  }

  List<ServiceListingGroupData> _visiblePickupGroups(
    ServiceListingConfig config,
  ) {
    if (config.type != ServiceListingType.pickup || _activeFilters.isEmpty) {
      return config.groups;
    }

    return [
      for (final group in config.groups)
        ServiceListingGroupData(
          title: group.title,
          layout: group.layout,
          items: group.items.where((item) {
            final offerMatches =
                !_activeFilters.contains(ServiceFilterId.offers) ||
                item.hasOffer;
            final ratedMatches =
                !_activeFilters.contains(ServiceFilterId.topRated) ||
                item.topRated;
            return offerMatches && ratedMatches;
          }).toList(),
        ),
    ].where((section) => section.items.isNotEmpty).toList();
  }

  bool _usesCategoryFilters(ServiceListingConfig config) {
    return config.type != ServiceListingType.pickup &&
        config.categories.isNotEmpty;
  }

  ServiceListingLayout _layoutForSelectedCategory(
    List<ServiceListingGroupData> groups,
  ) {
    final selectedGroup = _selectedCategoryGroup(groups);
    return selectedGroup?.layout ??
        (groups.isNotEmpty ? groups.first.layout : ServiceListingLayout.list);
  }

  List<ServicePlaceData> _displayedItemsForSelectedCategory(
    List<ServiceListingGroupData> groups,
  ) {
    if (groups.isEmpty) return const [];
    if (_selectedCategoryIndex != 0) {
      return _selectedCategoryGroup(groups)?.items ?? const [];
    }

    return groups.expand((group) => group.items).toList();
  }

  List<ServicePlaceData> _filteredItems(List<ServicePlaceData> items) {
    final query = _searchQuery.toLowerCase();
    if (query.isEmpty) return items;

    return items.where((item) {
      final searchableText = [
        item.name,
        item.subtitle,
        item.time,
        item.rating,
      ].whereType<String>().join(' ').toLowerCase();
      return searchableText.contains(query);
    }).toList();
  }

  ServiceListingGroupData? _selectedCategoryGroup(
    List<ServiceListingGroupData> groups,
  ) {
    final groupIndex = _selectedCategoryIndex - 1;
    if (groupIndex < 0 || groupIndex >= groups.length) {
      return null;
    }
    return groups[groupIndex];
  }

  String _selectedCategoryTitle(ServiceListingConfig config) {
    if (_selectedCategoryIndex >= 0 &&
        _selectedCategoryIndex < config.categories.length) {
      return config.categories[_selectedCategoryIndex].label;
    }
    return config.title;
  }
}

class _ListingHeader extends StatelessWidget {
  const _ListingHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => context.pop(),
            visualDensity: VisualDensity.compact,
            style: IconButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              minimumSize: const Size(28, 28),
              padding: EdgeInsets.zero,
            ),
            icon: Transform.scale(
              scaleX: isRtl ? 1 : -1,
              child: AppSvgImage.asset(
                AppAssets.serviceBackIcon,
                width: 8,
                height: 14,
                color: AppColors.onSurface(context),
              ),
            ),
          ),
          const SizedBox(width: 4),
          Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: AppTextStyles.heading4(
              context,
            ).copyWith(fontSize: 16, height: 1.4),
          ),
        ],
      ),
    );
  }
}

class _ListingSearchBox extends StatelessWidget {
  const _ListingSearchBox({
    required this.controller,
    required this.hint,
    required this.onChanged,
  });

  final TextEditingController controller;
  final String hint;
  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsetsDirectional.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard(context),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: AppColors.border(context), width: 0.5),
      ),
      child: Row(
        children: [
          AppSvgImage.asset(
            AppAssets.serviceSearchIcon,
            width: 16,
            height: 16,
            color: AppColors.paragraph(context),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: TextField(
              controller: controller,
              onChanged: onChanged,
              textAlign: TextAlign.start,
              textInputAction: TextInputAction.search,
              style: AppTextStyles.body(
                context,
              ).copyWith(fontSize: 12, height: 1.3),
              decoration: InputDecoration(
                isDense: true,
                border: InputBorder.none,
                contentPadding: EdgeInsets.zero,
                hintText: hint,
                hintStyle: AppTextStyles.inputHint(context).copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SelectedCategoryTitle extends StatelessWidget {
  const _SelectedCategoryTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: AppTextStyles.heading4(
          context,
        ).copyWith(fontSize: 15, height: 1.4),
      ),
    );
  }
}

class _ServiceCategoryStrip extends StatelessWidget {
  const _ServiceCategoryStrip({
    required this.categories,
    required this.selectedIndex,
    required this.onSelected,
  });

  final List<ServiceCategoryData> categories;
  final int selectedIndex;
  final ValueChanged<int> onSelected;

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
          return _ServiceCategoryChip(
            category: categories[index],
            selected: selectedIndex == index,
            onTap: () => onSelected(index),
          );
        },
      ),
    );
  }
}

class _ServiceCategoryChip extends StatelessWidget {
  const _ServiceCategoryChip({
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

class _ServiceFilterStrip extends StatelessWidget {
  const _ServiceFilterStrip({
    required this.filters,
    required this.activeFilters,
    required this.onToggle,
  });

  final List<ServiceFilterData> filters;
  final Set<ServiceFilterId> activeFilters;
  final ValueChanged<ServiceFilterId> onToggle;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var index = 0; index < filters.length; index++) ...[
            _ServiceFilterChip(
              filter: filters[index],
              selected: activeFilters.contains(filters[index].id),
              onTap: () => onToggle(filters[index].id),
            ),
            if (index != filters.length - 1) const SizedBox(width: 8),
          ],
        ],
      ),
    );
  }
}

class _ServiceFilterChip extends StatelessWidget {
  const _ServiceFilterChip({
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

class _PickupGroup extends StatelessWidget {
  const _PickupGroup({required this.group});

  final ServiceListingGroupData group;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _PickupGroupTitle(title: group.title),
        const SizedBox(height: 12),
        _ServicePlaceCollection(layout: group.layout, items: group.items),
      ],
    );
  }
}

class _ServicePlaceCollection extends StatelessWidget {
  const _ServicePlaceCollection({required this.layout, required this.items});

  final ServiceListingLayout layout;
  final List<ServicePlaceData> items;

  @override
  Widget build(BuildContext context) {
    return switch (layout) {
      ServiceListingLayout.compactGrid => _CompactStoreGrid(items: items),
      ServiceListingLayout.list => _PlaceList(items: items),
    };
  }
}

class _PickupGroupTitle extends StatelessWidget {
  const _PickupGroupTitle({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        title,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        textAlign: TextAlign.start,
        style: AppTextStyles.heading4(
          context,
        ).copyWith(fontSize: 15, height: 1.4),
      ),
    );
  }
}

class _CompactStoreGrid extends StatelessWidget {
  const _CompactStoreGrid({required this.items});

  final List<ServicePlaceData> items;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Wrap(
        spacing: 12,
        runSpacing: 12,
        children: [for (final item in items) _CompactStoreCard(item: item)],
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
      padding: const EdgeInsets.all(8),
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
        children: [
          ClipOval(
            child: AppRasterImage.asset(
              item.imageAsset,
              width: 40,
              height: 40,
              fit: BoxFit.contain,
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
          _TimeLabel(time: item.time),
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
        for (var index = 0; index < items.length; index++) ...[
          _PlaceListTile(item: items[index]),
          if (index != items.length - 1)
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
        RouteNames.restaurantDetail.replaceFirst(':id', item.detailId),
        extra: item.toRestaurantDetailArgs(),
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
            Flexible(child: _PlaceNameText(item.name)),
            const SizedBox(width: 8),
            _AvailabilityPill(label: l10n.serviceAvailable),
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

class _PlaceNameText extends StatelessWidget {
  const _PlaceNameText(this.name);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      name,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.start,
      style: AppTextStyles.body(context).copyWith(fontSize: 12, height: 1.3),
    );
  }
}

class _AvailabilityPill extends StatelessWidget {
  const _AvailabilityPill({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 4,
          height: 4,
          decoration: const BoxDecoration(
            color: AppColors.success,
            borderRadius: BorderRadius.all(AppRadius.full),
          ),
        ),
        const SizedBox(width: 2),
        Text(
          label,
          style: AppTextStyles.caption(
            context,
          ).copyWith(color: AppColors.success, fontSize: 10, height: 1.25),
        ),
      ],
    );
  }
}

class _TimeLabel extends StatelessWidget {
  const _TimeLabel({required this.time});

  final String time;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppSvgImage.asset(AppAssets.serviceTimeIcon, width: 14, height: 14),
        const SizedBox(width: 4),
        Text(
          time,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: AppTextStyles.caption(context).copyWith(
            color: AppColors.onSurface(context),
            fontSize: 10,
            height: 1.25,
          ),
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

class _EmptyListingState extends StatelessWidget {
  const _EmptyListingState({required this.l10n});

  final AppLocalizations l10n;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          l10n.serviceEmptyTitle,
          textAlign: TextAlign.center,
          style: AppTextStyles.heading4(context).copyWith(fontSize: 15),
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          l10n.serviceEmptyMessage,
          textAlign: TextAlign.center,
          style: AppTextStyles.caption(context).copyWith(fontSize: 12),
        ),
      ],
    );
  }
}

extension _ServicePlaceDetailArgs on ServicePlaceData {
  RestaurantDetailArgs toRestaurantDetailArgs() {
    return RestaurantDetailArgs(
      id: detailId,
      name: name,
      description: subtitle ?? name,
      deliveryTime: time,
      rating: double.tryParse(rating) ?? 4.5,
      logoAsset: imageAsset,
      coverAsset: imageAsset,
    );
  }

  String get detailId {
    final normalized = name
        .trim()
        .toLowerCase()
        .replaceAll(RegExp(r'\s+'), '-')
        .replaceAll(RegExp(r'[^a-z0-9\u0600-\u06FF-]'), '');
    return normalized.isEmpty ? 'service-place' : normalized;
  }
}
