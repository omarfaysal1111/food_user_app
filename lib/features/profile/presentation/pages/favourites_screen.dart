import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/app_status_dot_label.dart';
import 'package:food_user_app/features/restaurant/presentation/models/restaurant_detail_args.dart';
import 'package:food_user_app/l10n/app_localizations.dart';
import 'package:food_user_app/core/widgets/app_directional_icons.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({super.key});

  static const _successColor = AppColors.success;
  static const _warningColor = AppColors.statusWarning;
  static const _closedColor = AppColors.error;

  static const _screenPadding = 16.0;
  static const _topInset = 20.0;
  static const _headerIconSize = 28.0;
  static const _headerGap = 4.0;
  static const _headerHeight = 28.0;
  static const _contentTopGap = 20.0;
  static const _cardHeight = 56.0;
  static const _cardRadius = 10.0;
  static const _cardGap = 12.0;
  static const _favoriteButtonSize = 22.0;
  static const _favoriteIconSize = 14.0;
  static const _metaIconSize = 14.0;
  static const _cardArrowSize = 20.0;
  static const _imageRadius = 12.0;

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  final _favoriteStatuses = <_FavoriteStatusKind>[
    _FavoriteStatusKind.available,
    _FavoriteStatusKind.busy,
    _FavoriteStatusKind.closed,
  ];

  List<_FavoriteRestaurant> _items(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return [
      for (final status in _favoriteStatuses)
        _FavoriteRestaurant.fromStatus(l10n: l10n, statusKind: status),
    ];
  }

  void _removeFavorite(int index) {
    setState(() => _favoriteStatuses.removeAt(index));
  }

  @override
  Widget build(BuildContext context) {
    final items = _items(context);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground(context),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            start: FavouritesScreen._screenPadding,
            top: FavouritesScreen._topInset,
            end: FavouritesScreen._screenPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _FavoritesHeader(),
              const SizedBox(height: FavouritesScreen._contentTopGap),
              Expanded(
                child: items.isEmpty
                    ? const _EmptyFavoritesState()
                    : ListView.separated(
                        padding: EdgeInsets.zero,
                        physics: const ClampingScrollPhysics(),
                        itemCount: items.length,
                        separatorBuilder: (_, _) =>
                            const SizedBox(height: FavouritesScreen._cardGap),
                        itemBuilder: (context, index) {
                          return _FavoriteRestaurantCard(
                            item: items[index],
                            onRemove: () => _removeFavorite(index),
                          );
                        },
                      ),
              ),
              // TODO: Replace static favorites with the real favorites API.
            ],
          ),
        ),
      ),
    );
  }
}

enum _FavoriteStatusKind { available, busy, closed }

class _FavoriteRestaurant {
  const _FavoriteRestaurant({
    required this.detailId,
    required this.name,
    required this.description,
    required this.status,
    required this.statusColor,
    required this.deliveryTime,
    required this.rating,
    required this.imageAsset,
  });

  factory _FavoriteRestaurant.fromStatus({
    required AppLocalizations l10n,
    required _FavoriteStatusKind statusKind,
  }) {
    return switch (statusKind) {
      _FavoriteStatusKind.available => _FavoriteRestaurant(
        detailId: 'az-al-sham',
        name: l10n.favoriteRestaurantAzAlSham,
        description: l10n.serviceRestaurantDescription,
        status: l10n.favoriteStatusAvailable,
        statusColor: FavouritesScreen._successColor,
        deliveryTime: l10n.favoriteDeliveryTimeRange,
        rating: '4.5',
        imageAsset: AppAssets.favoriteRestaurantAzAlShamAvailable,
      ),
      _FavoriteStatusKind.busy => _FavoriteRestaurant(
        detailId: 'az-al-sham',
        name: l10n.favoriteRestaurantAzAlSham,
        description: l10n.serviceRestaurantDescription,
        status: l10n.favoriteStatusBusy,
        statusColor: FavouritesScreen._warningColor,
        deliveryTime: l10n.favoriteDeliveryTimeRange,
        rating: '4.5',
        imageAsset: AppAssets.favoriteRestaurantAzAlShamBusy,
      ),
      _FavoriteStatusKind.closed => _FavoriteRestaurant(
        detailId: 'az-al-sham',
        name: l10n.favoriteRestaurantAzAlSham,
        description: l10n.serviceRestaurantDescription,
        status: l10n.favoriteStatusClosed,
        statusColor: FavouritesScreen._closedColor,
        deliveryTime: l10n.favoriteDeliveryTimeRange,
        rating: '4.5',
        imageAsset: AppAssets.favoriteRestaurantAzAlShamClosed,
      ),
    };
  }

  final String detailId;
  final String name;
  final String description;
  final String status;
  final Color statusColor;
  final String deliveryTime;
  final String rating;
  final String imageAsset;
}

class _FavoritesHeader extends StatelessWidget {
  const _FavoritesHeader();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final backIcon = AppDirectionalIcons.backChevron(context);

    return SizedBox(
      height: FavouritesScreen._headerHeight,
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () => context.pop(),
              child: SizedBox(
                width: FavouritesScreen._headerIconSize,
                height: FavouritesScreen._headerIconSize,
                child: Icon(
                  backIcon,
                  size: FavouritesScreen._headerIconSize,
                  color: AppColors.onSurface(context),
                ),
              ),
            ),
            const SizedBox(width: FavouritesScreen._headerGap),
            Text(
              l10n.favoritesTitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.start,
              style: AppTextStyles.appBarTitle(context).copyWith(
                color: AppColors.onSurface(context),
                fontSize: 16,
                fontWeight: FontWeight.w600,
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FavoriteRestaurantCard extends StatelessWidget {
  const _FavoriteRestaurantCard({required this.item, required this.onRemove});

  final _FavoriteRestaurant item;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _openDetails(context),
      child: Container(
        height: FavouritesScreen._cardHeight,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(FavouritesScreen._cardRadius),
        ),
        child: Row(
          textDirection: TextDirection.ltr,
          children: isRtl
              ? [
                  const SizedBox(width: 12),
                  const _CardArrow(),
                  Expanded(child: _FavoriteRestaurantContent(item: item)),
                  _RestaurantImage(item: item, onRemove: onRemove),
                ]
              : [
                  _RestaurantImage(item: item, onRemove: onRemove),
                  Expanded(child: _FavoriteRestaurantContent(item: item)),
                  const _CardArrow(),
                  const SizedBox(width: 12),
                ],
        ),
      ),
    );
  }

  void _openDetails(BuildContext context) {
    context.push(
      RouteNames.restaurantDetailFor(item.detailId),
      extra: RestaurantDetailArgs(
        id: item.detailId,
        name: item.name,
        description: item.description,
        deliveryTime: item.deliveryTime,
        rating: double.tryParse(item.rating) ?? 4.5,
        logoAsset: item.imageAsset,
        coverAsset: item.imageAsset,
        initialFavorite: true,
      ),
    );
  }
}

class _RestaurantImage extends StatelessWidget {
  const _RestaurantImage({required this.item, required this.onRemove});

  final _FavoriteRestaurant item;
  final VoidCallback onRemove;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: FavouritesScreen._cardHeight,
      height: FavouritesScreen._cardHeight,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                FavouritesScreen._imageRadius,
              ),
              child: Image.asset(item.imageAsset, fit: BoxFit.cover),
            ),
          ),
          Positioned(
            top: 6,
            left: 6,
            child: _RemoveFavoriteButton(onTap: onRemove),
          ),
        ],
      ),
    );
  }
}

class _FavoriteRestaurantContent extends StatelessWidget {
  const _FavoriteRestaurantContent({required this.item});

  final _FavoriteRestaurant item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
      child: Align(
        alignment: AlignmentDirectional.centerStart,
        child: _FavoriteRestaurantDetails(item: item),
      ),
    );
  }
}

class _CardArrow extends StatelessWidget {
  const _CardArrow();

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return SizedBox(
      width: FavouritesScreen._cardArrowSize,
      height: FavouritesScreen._cardArrowSize,
      child: Center(
        child: Transform.scale(
          scaleX: isRtl ? -1 : 1,
          child: SvgPicture.asset(
            AppAssets.favoriteBackIcon,
            width: 7,
            height: 12,
            colorFilter: ColorFilter.mode(
              AppColors.onSurface(context),
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}

class _FavoriteRestaurantDetails extends StatelessWidget {
  const _FavoriteRestaurantDetails({required this.item});

  final _FavoriteRestaurant item;

  Widget _buildNameStatusLine(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: Text(
            item.name.trim(),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.start,
            style: AppTextStyles.body(context).copyWith(
              color: AppColors.onSurface(context),
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.3,
            ),
          ),
        ),
        const SizedBox(width: 4),
        Flexible(child: _StatusChip(item: item)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final rating = _RatingBadge(rating: item.rating);
    final time = _DeliveryTimeLabel(deliveryTime: item.deliveryTime);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildNameStatusLine(context),
        const SizedBox(height: 4),
        Row(
          textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
          mainAxisSize: MainAxisSize.min,
          children: [rating, const SizedBox(width: 12), time],
        ),
      ],
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({required this.item});

  final _FavoriteRestaurant item;

  @override
  Widget build(BuildContext context) {
    return AppStatusDotLabel(label: item.status, color: item.statusColor);
  }
}

class _DeliveryTimeLabel extends StatelessWidget {
  const _DeliveryTimeLabel({required this.deliveryTime});

  final String deliveryTime;

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final icon = SvgPicture.asset(
      AppAssets.favoriteTimeIcon,
      width: FavouritesScreen._metaIconSize,
      height: FavouritesScreen._metaIconSize,
      colorFilter: ColorFilter.mode(
        AppColors.onSurface(context),
        BlendMode.srcIn,
      ),
    );
    final label = Text(
      deliveryTime,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.start,
      style: AppTextStyles.caption(context).copyWith(
        color: AppColors.onSurface(context),
        fontSize: 10,
        fontWeight: FontWeight.w400,
        height: 1.25,
      ),
    );

    return Row(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      mainAxisSize: MainAxisSize.min,
      children: [icon, const SizedBox(width: 4), label],
    );
  }
}

class _RatingBadge extends StatelessWidget {
  const _RatingBadge({required this.rating});

  final String rating;

  @override
  Widget build(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final icon = SvgPicture.asset(
      AppAssets.favoriteStarIcon,
      width: FavouritesScreen._metaIconSize,
      height: FavouritesScreen._metaIconSize,
    );
    final label = Text(
      rating,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: AppTextStyles.caption(context).copyWith(
        color: AppColors.onSurface(context),
        fontSize: 10,
        fontWeight: FontWeight.w500,
        height: 1.25,
      ),
    );

    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackground(context),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
        mainAxisSize: MainAxisSize.min,
        children: [icon, const SizedBox(width: 2), label],
      ),
    );
  }
}

class _RemoveFavoriteButton extends StatelessWidget {
  const _RemoveFavoriteButton({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Semantics(
        label: l10n.removeFromFavorites,
        button: true,
        child: Container(
          width: FavouritesScreen._favoriteButtonSize,
          height: FavouritesScreen._favoriteButtonSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.surfaceCard(context),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            AppAssets.favoriteHeartIcon,
            width: FavouritesScreen._favoriteIconSize,
            height: FavouritesScreen._favoriteIconSize,
            colorFilter: const ColorFilter.mode(
              AppColors.primary,
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}

class _EmptyFavoritesState extends StatelessWidget {
  const _EmptyFavoritesState();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return Center(
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.favorite_border_rounded,
              color: AppColors.paragraph(context),
              size: 40,
            ),
            const SizedBox(height: 12),
            Text(
              l10n.favoritesEmptyTitle,
              textAlign: TextAlign.center,
              style: AppTextStyles.heading4(context).copyWith(
                color: AppColors.onSurface(context),
                fontSize: 15,
                height: 1.4,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.favoritesEmptyMessage,
              textAlign: TextAlign.center,
              style: AppTextStyles.caption(
                context,
              ).copyWith(color: AppColors.paragraph(context), height: 1.4),
            ),
          ],
        ),
      ),
    );
  }
}
