import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/app_radius.dart';
import 'package:food_user_app/core/theme/app_spacing.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/app_media.dart';
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

  var _selectedCategoryIndex = 0;
  ServiceListingType? _initializedType;
  Set<ServiceFilterId> _activeFilters = const {};
  List<GlobalKey> _sectionKeys = const [];

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_syncSelectedCategoryWithScroll);
  }

  @override
  void dispose() {
    _scrollController
      ..removeListener(_syncSelectedCategoryWithScroll)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final config = ServiceListingConfig.of(l10n, widget.type);
    _initializeSelection(config);
    final sections = _visibleSections(config);

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
                  _ListingSearchBox(hint: config.searchHint),
                  if (config.categories.isNotEmpty) ...[
                    const SizedBox(height: 16),
                    _ServiceCategoryStrip(
                      categories: config.categories,
                      selectedIndex: _selectedCategoryIndex,
                      onSelected: _scrollToSection,
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
                  for (var index = 0; index < sections.length; index++) ...[
                    const SizedBox(height: 16),
                    _ServiceSection(
                      key: index < _sectionKeys.length
                          ? _sectionKeys[index]
                          : null,
                      section: sections[index],
                    ),
                  ],
                  if (sections.isEmpty) ...[
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
    _sectionKeys = List.generate(config.sections.length, (_) => GlobalKey());
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

  Future<void> _scrollToSection(int index) async {
    if (index >= _sectionKeys.length) return;
    setState(() => _selectedCategoryIndex = index);

    final sectionContext = _sectionKeys[index].currentContext;
    if (sectionContext == null) return;

    final renderObject = sectionContext.findRenderObject();
    if (renderObject is! RenderBox) return;

    final topInset = MediaQuery.paddingOf(context).top + 12;
    final sectionTop = renderObject.localToGlobal(Offset.zero).dy;
    final targetOffset = (_scrollController.offset + sectionTop - topInset)
        .clamp(0.0, _scrollController.position.maxScrollExtent);

    await _scrollController.animateTo(
      targetOffset,
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeOutCubic,
    );
  }

  void _syncSelectedCategoryWithScroll() {
    if (!_scrollController.hasClients || _sectionKeys.isEmpty) return;

    final threshold = MediaQuery.paddingOf(context).top + 96;
    var visibleIndex = _selectedCategoryIndex;
    var closestDistance = double.infinity;

    for (var i = 0; i < _sectionKeys.length; i++) {
      final sectionContext = _sectionKeys[i].currentContext;
      if (sectionContext == null) continue;

      final renderObject = sectionContext.findRenderObject();
      if (renderObject is! RenderBox) continue;

      final top = renderObject.localToGlobal(Offset.zero).dy;
      final distance = (top - threshold).abs();
      if (top <= threshold && distance < closestDistance) {
        closestDistance = distance;
        visibleIndex = i;
      }
    }

    if (visibleIndex != _selectedCategoryIndex &&
        visibleIndex < _sectionKeys.length) {
      setState(() => _selectedCategoryIndex = visibleIndex);
    }
  }

  List<ServiceSectionData> _visibleSections(ServiceListingConfig config) {
    if (config.type != ServiceListingType.pickup || _activeFilters.isEmpty) {
      return config.sections;
    }

    return [
      for (final section in config.sections)
        ServiceSectionData(
          title: section.title,
          layout: section.layout,
          items: section.items.where((item) {
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
  const _ListingSearchBox({required this.hint});

  final String hint;

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
            child: Text(
              hint,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: AppTextStyles.inputHint(context).copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                height: 1.3,
              ),
            ),
          ),
        ],
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
    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(AppRadius.full),
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
                      fit: BoxFit.cover,
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

class _ServiceSection extends StatelessWidget {
  const _ServiceSection({required this.section, super.key});

  final ServiceSectionData section;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _ServiceSectionTitle(title: section.title),
        const SizedBox(height: 12),
        switch (section.layout) {
          ServiceSectionLayout.compactGrid => _CompactStoreGrid(
            items: section.items,
          ),
          ServiceSectionLayout.list => _PlaceList(items: section.items),
        },
      ],
    );
  }
}

class _ServiceSectionTitle extends StatelessWidget {
  const _ServiceSectionTitle({required this.title});

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
      onTap: item.kind == ServicePlaceKind.restaurant
          ? () => context.push(
              RouteNames.restaurantDetail.replaceFirst(':id', 'az-al-sham'),
            )
          : null,
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
    final showFavourite = item.kind != ServicePlaceKind.restaurant;

    return SizedBox(
      width: 56,
      height: 56,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: const BorderRadius.all(AppRadius.md),
              child: AppRasterImage.asset(item.imageAsset, fit: BoxFit.cover),
            ),
          ),
          if (showFavourite)
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
            const _RatingLabel(rating: '4.5'),
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
