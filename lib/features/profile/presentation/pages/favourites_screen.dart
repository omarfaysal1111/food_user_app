import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({super.key});

  static const _successColor = Color(0xFF0C9D61);
  static const _warningColor = Color(0xFFEFBE1C);
  static const _closedColor = Color(0xFFEC2D30);

  static const _screenPadding = 16.0;
  static const _topInset = 20.0;
  static const _headerIconSize = 28.0;
  static const _headerGap = 4.0;
  static const _headerHeight = 28.0;
  static const _contentTopGap = 20.0;
  static const _cardHeight = 62.0;
  static const _cardRadius = 10.0;
  static const _cardGap = 12.0;
  static const _favoriteButtonSize = 22.0;
  static const _favoriteIconSize = 14.0;
  static const _metaIconSize = 14.0;

  List<_FavoriteRestaurant> _items(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return [
      _FavoriteRestaurant(
        name: l10n.favoriteRestaurantAzAlSham,
        status: l10n.favoriteStatusAvailable,
        statusColor: _successColor,
        deliveryTime: l10n.favoriteDeliveryTimeRange,
        rating: '4.5',
      ),
      _FavoriteRestaurant(
        name: l10n.favoriteRestaurantAzAlSham,
        status: l10n.favoriteStatusBusy,
        statusColor: _warningColor,
        deliveryTime: l10n.favoriteDeliveryTimeRange,
        rating: '4.5',
      ),
      _FavoriteRestaurant(
        name: l10n.favoriteRestaurantAzAlSham,
        status: l10n.favoriteStatusClosed,
        statusColor: _closedColor,
        deliveryTime: l10n.favoriteDeliveryTimeRange,
        rating: '4.5',
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final items = _items(context);

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground(context),
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.only(
            left: _screenPadding,
            top: _topInset,
            right: _screenPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const _FavoritesHeader(),
              const SizedBox(height: _contentTopGap),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.zero,
                  physics: const ClampingScrollPhysics(),
                  itemCount: items.length,
                  separatorBuilder: (_, _) => const SizedBox(height: _cardGap),
                  itemBuilder: (context, index) {
                    return _FavoriteRestaurantCard(item: items[index]);
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

class _FavoriteRestaurant {
  const _FavoriteRestaurant({
    required this.name,
    required this.status,
    required this.statusColor,
    required this.deliveryTime,
    required this.rating,
  });

  final String name;
  final String status;
  final Color statusColor;
  final String deliveryTime;
  final String rating;
}

class _FavoritesHeader extends StatelessWidget {
  const _FavoritesHeader();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    const backIcon = Icons.chevron_left_rounded;

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
  const _FavoriteRestaurantCard({required this.item});

  final _FavoriteRestaurant item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {},
      child: Container(
        height: FavouritesScreen._cardHeight,
        decoration: BoxDecoration(
          color: AppColors.surfaceCard(context),
          borderRadius: BorderRadius.circular(FavouritesScreen._cardRadius),
          border: Border.all(color: AppColors.border(context), width: 0.5),
        ),
        clipBehavior: Clip.antiAlias,
        child: Row(
          children: [
            const _RestaurantImage(),
            Expanded(
              child: Padding(
                padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(child: _FavoriteRestaurantDetails(item: item)),
                    const SizedBox(width: 8),
                    const _RemoveFavoriteButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RestaurantImage extends StatelessWidget {
  const _RestaurantImage();

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: FavouritesScreen._cardHeight,
      height: FavouritesScreen._cardHeight,
      child: Image(
        image: AssetImage(AppAssets.favoriteRestaurantAzAlSham),
        fit: BoxFit.cover,
      ),
    );
  }
}

class _FavoriteRestaurantDetails extends StatelessWidget {
  const _FavoriteRestaurantDetails({required this.item});

  final _FavoriteRestaurant item;

  Widget _buildNameStatusLine(BuildContext context) {
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          fit: FlexFit.loose,
          child: Text(
            item.name.trim(),
            textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: isRtl ? TextAlign.right : TextAlign.left,
            style: AppTextStyles.body(context).copyWith(
              color: AppColors.onSurface(context),
              fontSize: 12,
              fontWeight: FontWeight.w500,
              height: 1.3,
            ),
          ),
        ),
        const SizedBox(width: 4),
        _StatusChip(item: item),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildNameStatusLine(context),
        const SizedBox(height: 4),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _RatingBadge(rating: item.rating),
            const SizedBox(width: 12),
            _DeliveryTimeLabel(deliveryTime: item.deliveryTime),
          ],
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
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 4,
          height: 4,
          decoration: BoxDecoration(
            color: item.statusColor,
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        const SizedBox(width: 2),
        Text(
          item.status,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.start,
          style: AppTextStyles.caption(context).copyWith(
            color: item.statusColor,
            fontSize: 10,
            fontWeight: FontWeight.w400,
            height: 1.25,
          ),
        ),
      ],
    );
  }
}

class _DeliveryTimeLabel extends StatelessWidget {
  const _DeliveryTimeLabel({required this.deliveryTime});

  final String deliveryTime;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          AppAssets.favoriteTimeIcon,
          width: FavouritesScreen._metaIconSize,
          height: FavouritesScreen._metaIconSize,
          colorFilter: ColorFilter.mode(
            AppColors.onSurface(context),
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 4),
        Text(
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
        ),
      ],
    );
  }
}

class _RatingBadge extends StatelessWidget {
  const _RatingBadge({required this.rating});

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackground(context),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset(
            AppAssets.favoriteStarIcon,
            width: FavouritesScreen._metaIconSize,
            height: FavouritesScreen._metaIconSize,
          ),
          const SizedBox(width: 2),
          Text(
            rating,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.caption(context).copyWith(
              color: AppColors.onSurface(context),
              fontSize: 10,
              fontWeight: FontWeight.w500,
              height: 1.25,
            ),
          ),
        ],
      ),
    );
  }
}

class _RemoveFavoriteButton extends StatelessWidget {
  const _RemoveFavoriteButton();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        // TODO: Remove item from favorites through the real favorites API.
      },
      child: Semantics(
        label: l10n.removeFromFavorites,
        button: true,
        child: Container(
          width: FavouritesScreen._favoriteButtonSize,
          height: FavouritesScreen._favoriteButtonSize,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: AppColors.scaffoldBackground(context),
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset(
            AppAssets.favoriteHeartIcon,
            width: FavouritesScreen._favoriteIconSize,
            height: FavouritesScreen._favoriteIconSize,
          ),
        ),
      ),
    );
  }
}
