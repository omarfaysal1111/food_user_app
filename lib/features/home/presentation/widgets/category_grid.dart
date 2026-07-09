import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:food_user_app/core/constants/app_assets.dart';
import 'package:food_user_app/core/router/route_names.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/app_spacing.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/core/widgets/app_media.dart';
import 'package:food_user_app/features/home/domain/entities/category.dart';
import 'package:food_user_app/features/home/presentation/cubit/category_cubit.dart';
import 'package:food_user_app/features/home/presentation/cubit/category_state.dart';
import 'package:food_user_app/features/service_listing/presentation/models/service_listing_type.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class CategoryGrid extends StatefulWidget {
  const CategoryGrid({super.key});

  @override
  State<CategoryGrid> createState() => _CategoryGridState();
}

class _CategoryGridState extends State<CategoryGrid> {
  @override
  void initState() {
    super.initState();
    context.read<CategoryCubit>().fetchCategories();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CategoryCubit, CategoryState>(
      builder: (context, state) {
        return state.maybeWhen(
          loaded: (categories) {
            if (categories.isEmpty) return const SizedBox.shrink();

            return Row(
              children: [
                for (var index = 0; index < categories.length; index++) ...[
                  Expanded(child: _CategoryTile(category: categories[index])),
                  if (index != categories.length - 1)
                    const SizedBox(width: 14),
                ],
              ],
            );
          },
          orElse: () {
            return const SizedBox(
              height: 104,
              child: Center(child: CircularProgressIndicator()),
            );
          },
        );
      },
    );
  }
}

class _CategoryTile extends StatelessWidget {
  const _CategoryTile({required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          context.push(RouteNames.serviceListingFor(category.type.pathSegment)),
      borderRadius: const BorderRadius.all(Radius.circular(12)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 72,
            height: 72,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              color: AppColors.surfaceCard(context),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              border: Border.all(color: AppColors.border(context), width: 0.5),
              boxShadow: [
                BoxShadow(
                  color: AppColors.black.withValues(alpha: 0.06),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                const PositionedDirectional(
                  top: 0,
                  start: 0,
                  end: 0,
                  child: AppRasterImage.asset(
                    AppAssets.homeCategoryStrokeTop,
                    height: 2,
                    fit: BoxFit.fill,
                  ),
                ),
                const PositionedDirectional(
                  bottom: 0,
                  start: 0,
                  end: 0,
                  child: AppRasterImage.asset(
                    AppAssets.homeCategoryStrokeBottom,
                    height: 2,
                    fit: BoxFit.fill,
                  ),
                ),
                AppRasterImage.asset(
                  category.imageUrl,
                  width: 56,
                  height: 56,
                ),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.sm),
          Text(
            _getLocalizedCategoryName(context, category),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.body(context).copyWith(
              fontSize: 12,
              height: 1.3,
              color: AppColors.onSurface(context),
            ),
          ),
        ],
      ),
    );
  }

  String _getLocalizedCategoryName(BuildContext context, Category category) {
    final l10n = AppLocalizations.of(context)!;
    switch (category.type) {
      case ServiceListingType.restaurants:
        return l10n.homeCategoryRestaurants;
      case ServiceListingType.grocery:
        return l10n.homeCategoryGrocery;
      case ServiceListingType.stores:
        return l10n.homeCategoryStores;
      case ServiceListingType.pickup:
        return l10n.homeCategoryPickup;
    }
  }
}
