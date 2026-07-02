import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/app_radius.dart';
import 'package:food_user_app/core/theme/app_spacing.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/app_media.dart';
import 'package:food_user_app/features/cart/domain/entities/cart_item.dart';
import 'package:food_user_app/features/restaurant/data/mock/restaurant_mock_data.dart';
import 'package:food_user_app/core/widgets/app_directional_icons.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class RestaurantSearchScreen extends StatefulWidget {
  const RestaurantSearchScreen({this.restaurantId = 'az-al-sham', super.key});

  final String restaurantId;

  @override
  State<RestaurantSearchScreen> createState() => _RestaurantSearchScreenState();
}

class _RestaurantSearchScreenState extends State<RestaurantSearchScreen> {
  late final TextEditingController _controller;
  late final FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController()..addListener(_onChanged);
    _focusNode = FocusNode();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focusNode.requestFocus();
    });
  }

  @override
  void dispose() {
    _controller
      ..removeListener(_onChanged)
      ..dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _onChanged() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final copy = _RestaurantSearchCopy.of(context);
    final locale = Localizations.localeOf(context);
    final query = _controller.text.trim().toLowerCase();
    final items = query.isEmpty
        ? mockRestaurant.menu
        : mockRestaurant.menu.where((item) {
            final text = [
              item.name(locale),
              item.description(locale),
              ...item.keywords(locale),
            ].join(' ').toLowerCase();
            return text.contains(query);
          }).toList();

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
                  const SizedBox(height: 20),
                  _SearchField(
                    controller: _controller,
                    focusNode: _focusNode,
                    hint: copy.hint,
                  ),
                  const SizedBox(height: 16),
                  if (items.isEmpty)
                    _EmptyRestaurantSearch(title: copy.emptyTitle)
                  else
                    _RestaurantSearchGrid(items: items),
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
          icon: Icon(AppDirectionalIcons.backArrow(context), size: 20),
        ),
        const SizedBox(width: AppSpacing.xs),
        Text(
          title,
          style: AppTextStyles.heading4(
            context,
          ).copyWith(fontSize: 16, height: 1.4),
        ),
      ],
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField({
    required this.controller,
    required this.focusNode,
    required this.hint,
  });

  final TextEditingController controller;
  final FocusNode focusNode;
  final String hint;

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
              onPressed: controller.clear,
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

class _RestaurantSearchGrid extends StatelessWidget {
  const _RestaurantSearchGrid({required this.items});

  final List<MockMenuItem> items;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: items.length + (items.length < 8 ? items.length : 0),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        childAspectRatio: 165.5 / 165,
      ),
      itemBuilder: (context, index) {
        return _RestaurantSearchCard(item: items[index % items.length]);
      },
    );
  }
}

class _RestaurantSearchCard extends StatelessWidget {
  const _RestaurantSearchCard({required this.item});

  final MockMenuItem item;

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);

    return Material(
      color: AppColors.surfaceCard(context),
      borderRadius: const BorderRadius.all(AppRadius.md),
      child: InkWell(
        borderRadius: const BorderRadius.all(AppRadius.md),
        onTap: () => context.push(
          RouteNames.productDetails,
          extra: CartItem(
            id: item.id,
            name: item.name(locale),
            description: item.description(locale),
            price: item.price,
            imageAsset: item.imageAsset,
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(AppRadius.md),
            border: Border.all(color: AppColors.border(context), width: 0.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Stack(
                  children: [
                    Positioned.fill(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                          top: AppRadius.md,
                        ),
                        child: AppRasterImage.asset(
                          item.imageAsset,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    PositionedDirectional(
                      start: AppSpacing.sm,
                      bottom: AppSpacing.sm,
                      child: Container(
                        width: 28,
                        height: 28,
                        decoration: BoxDecoration(
                          color: AppColors.surfaceCard(context),
                          borderRadius: const BorderRadius.all(AppRadius.sm),
                        ),
                        child: const Icon(Icons.add_rounded, size: 18),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.name(locale),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyles.caption(context).copyWith(
                        fontSize: 12,
                        height: 1.3,
                        color: AppColors.onSurface(context),
                      ),
                    ),
                    const SizedBox(height: AppSpacing.sm),
                    Text(
                      item.priceLabel(locale),
                      style: AppTextStyles.body(
                        context,
                      ).copyWith(fontSize: 12, height: 1.3),
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
}

class _EmptyRestaurantSearch extends StatelessWidget {
  const _EmptyRestaurantSearch({required this.title});

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
            style: AppTextStyles.body(context).copyWith(fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class _RestaurantSearchCopy {
  const _RestaurantSearchCopy({
    required this.title,
    required this.hint,
    required this.emptyTitle,
  });

  final String title;
  final String hint;
  final String emptyTitle;

  static _RestaurantSearchCopy of(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return _RestaurantSearchCopy(
      title: l10n.restaurantSearchTitle,
      hint: l10n.serviceSearchHint,
      emptyTitle: l10n.restaurantSearchEmptyTitle,
    );
  }
}
