import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/theme/app_colors.dart';
import '../cubit/market_catalog_cubit.dart';
import '../cubit/market_catalog_state.dart';
import '../cubit/market_details_cubit.dart';
import '../cubit/market_details_state.dart';
import '../cubit/market_favorite_cubit.dart';
import '../widgets/market_empty_state.dart';

import '../widgets/market_not_found_widget.dart';
import '../widgets/product_card.dart';

class MarketDetailsScreen extends StatefulWidget {
  final String marketId;

  const MarketDetailsScreen({
    super.key,
    required this.marketId,
  });

  @override
  State<MarketDetailsScreen> createState() => _MarketDetailsScreenState();
}

class _MarketDetailsScreenState extends State<MarketDetailsScreen> {
  late final MarketDetailsCubit _detailsCubit;
  late final MarketCatalogCubit _catalogCubit;
  late final MarketFavoriteCubit _favoriteCubit;

  @override
  void initState() {
    super.initState();
    _detailsCubit = GetIt.I<MarketDetailsCubit>()
      ..loadMarketDetails(widget.marketId);
    _catalogCubit = GetIt.I<MarketCatalogCubit>();
    _favoriteCubit = GetIt.I<MarketFavoriteCubit>();
  }

  @override
  Widget build(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final theme = Theme.of(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _detailsCubit),
        BlocProvider.value(value: _catalogCubit),
        BlocProvider.value(value: _favoriteCubit),
      ],
      child: Scaffold(
        body: BlocConsumer<MarketDetailsCubit, MarketDetailsState>(
          listener: (context, state) {
            if (state is MarketDetailsLoaded && state.categories.isNotEmpty) {
              _catalogCubit.selectCategory(
                marketId: widget.marketId,
                categoryId: state.categories.first.id,
              );
            }
          },
          builder: (context, state) {
            if (state is MarketDetailsLoading) {
              return const Center(
                child: CircularProgressIndicator(color: AppColors.primary),
              );
            }

            if (state is MarketDetailsNotFound) {
              return MarketNotFoundWidget(message: state.message);
            }

            if (state is MarketDetailsError) {
              return Scaffold(
                appBar: AppBar(),
                body: MarketEmptyState(
                  title: isArabic ? 'حدث خطأ' : 'Error',
                  message: state.message,
                  onRetry: () => _detailsCubit.loadMarketDetails(widget.marketId),
                ),
              );
            }

            if (state is MarketDetailsLoaded) {
              final market = state.market;
              final categories = state.categories;
              final offers = state.offers;

              return CustomScrollView(
                slivers: [
                  // ── Market Banner Header ────────────────────────────────────
                  SliverAppBar(
                    expandedHeight: 200,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      title: Text(
                        market.name,
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          shadows: [
                            Shadow(color: Colors.black54, blurRadius: 6),
                          ],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      background: Stack(
                        fit: StackFit.expand,
                        children: [
                          market.coverImage != null &&
                                  market.coverImage!.isNotEmpty
                              ? Image.network(
                                  market.coverImage!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (_, _, _) => Container(
                                    color: Colors.grey.shade300,
                                    child: const Icon(
                                      Icons.storefront,
                                      size: 64,
                                      color: Colors.grey,
                                    ),
                                  ),
                                )

                              : Container(
                                  color: Colors.grey.shade300,
                                  child: const Icon(
                                    Icons.storefront,
                                    size: 64,
                                    color: Colors.grey,
                                  ),
                                ),
                          Container(
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Colors.black87,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ── Market Summary Card ─────────────────────────────────────
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              // Rating
                              const Icon(
                                Icons.star,
                                color: AppColors.ratingStar,
                                size: 18,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${market.rating.toStringAsFixed(1)} (${market.ratingCount})',
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const Spacer(),
                              // Delivery info
                              Icon(
                                Icons.access_time_filled,
                                size: 16,
                                color: theme.hintColor,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                isArabic
                                    ? '${market.deliveryTimeMin}-${market.deliveryTimeMax} دقيقة'
                                    : '${market.deliveryTimeMin}-${market.deliveryTimeMax} min',
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: theme.hintColor,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),

                          Row(
                            children: [
                              Icon(
                                Icons.delivery_dining,
                                size: 18,
                                color: theme.hintColor,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                isArabic
                                    ? 'التوصيل: ${market.deliveryFee == 0 ? "مجاني" : "${market.deliveryFee.toStringAsFixed(2)} ج.م"}'
                                    : 'Delivery: ${market.deliveryFee == 0 ? "Free" : "${market.deliveryFee.toStringAsFixed(2)} EGP"}',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.hintColor,
                                ),
                              ),
                              const SizedBox(width: 16),
                              Text(
                                isArabic
                                    ? 'الحد الأدنى: ${market.minimumOrder.toStringAsFixed(2)} ج.م'
                                    : 'Min Order: ${market.minimumOrder.toStringAsFixed(2)} EGP',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: theme.hintColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // ── Offers Carousel ─────────────────────────────────────────
                  if (offers.isNotEmpty)
                    SliverToBoxAdapter(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Text(
                              isArabic ? 'العروض المتاحة' : 'Special Offers',
                              style: theme.textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          SizedBox(
                            height: 100,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 12),
                              itemCount: offers.length,
                              itemBuilder: (context, index) {
                                final offer = offers[index];
                                return Container(
                                  width: 260,
                                  margin: const EdgeInsets.symmetric(
                                    horizontal: 4,
                                  ),
                                  padding: const EdgeInsets.all(12),
                                  decoration: BoxDecoration(
                                    color: AppColors.primary,
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        offer.title,
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      if (offer.description != null) ...[
                                        const SizedBox(height: 4),
                                        Text(
                                          offer.description!,
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 12,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),

                  // ── Root Categories Bar ─────────────────────────────────────
                  if (categories.isEmpty)
                    const SliverToBoxAdapter(
                      child: MarketEmptyState(
                        title: 'لا توجد أقسام',
                        message: 'هذا المتجر لا يحتوي على أقسام حالياً.',
                      ),
                    )
                  else
                    BlocBuilder<MarketCatalogCubit, MarketCatalogState>(
                      builder: (context, catalogState) {
                        final selectedCatId = catalogState is MarketCatalogLoaded
                            ? catalogState.selectedCategoryId
                            : categories.first.id;

                        return SliverToBoxAdapter(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Categories Tabs
                              SizedBox(
                                height: 48,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  itemCount: categories.length,
                                  itemBuilder: (context, index) {
                                    final cat = categories[index];
                                    final isSelected = cat.id == selectedCatId;

                                    return Padding(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 4.0,
                                      ),
                                      child: ChoiceChip(
                                        label: Text(cat.name),
                                        selected: isSelected,
                                        selectedColor: AppColors.primary,
                                        labelStyle: TextStyle(
                                          color: isSelected
                                              ? Colors.white
                                              : theme.textTheme.bodyMedium?.color,
                                          fontWeight: isSelected
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                        onSelected: (selected) {
                                          if (selected) {
                                            _catalogCubit.selectCategory(
                                              marketId: widget.marketId,
                                              categoryId: cat.id,
                                            );
                                          }
                                        },
                                      ),
                                    );
                                  },
                                ),
                              ),
                              const SizedBox(height: 8),

                              // Sub-categories Chips
                              if (catalogState is MarketCatalogLoaded &&
                                  catalogState.subCategories.isNotEmpty) ...[
                                Container(
                                  height: 40,
                                  color: Colors.grey.shade100,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 12,
                                    ),
                                    itemCount:
                                        catalogState.subCategories.length,
                                    itemBuilder: (context, index) {
                                      final subCat =
                                          catalogState.subCategories[index];
                                      final isSubSelected =
                                          subCat.id ==
                                              catalogState.selectedSubCategoryId;

                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 4.0,
                                        ),
                                        child: ActionChip(
                                          label: Text(
                                            subCat.name,
                                            style: TextStyle(
                                              fontSize: 12,
                                              color: isSubSelected
                                                  ? AppColors.primary
                                                  : theme
                                                      .textTheme
                                                      .bodyMedium
                                                      ?.color,
                                              fontWeight: isSubSelected
                                                  ? FontWeight.bold
                                                  : FontWeight.normal,
                                            ),
                                          ),
                                          backgroundColor: isSubSelected
                                              ? AppColors.primary
                                                  .withValues(alpha: 0.1)
                                              : Colors.white,
                                          side: BorderSide(
                                            color: isSubSelected
                                                ? AppColors.primary
                                                : Colors.grey.shade300,
                                          ),
                                          onPressed: () {
                                            _catalogCubit.selectSubCategory(
                                              marketId: widget.marketId,
                                              categoryId: catalogState
                                                  .selectedCategoryId,
                                              subCategoryId: subCat.id,
                                            );
                                          },
                                        ),
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 8),
                              ],
                            ],
                          ),
                        );
                      },
                    ),

                  // ── Products List ───────────────────────────────────────────
                  BlocBuilder<MarketCatalogCubit, MarketCatalogState>(
                    builder: (context, catalogState) {
                      if (catalogState is MarketCatalogLoading) {
                        return const SliverFillRemaining(
                          child: Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primary,
                            ),
                          ),
                        );
                      }

                      if (catalogState is MarketCatalogError) {
                        return SliverToBoxAdapter(
                          child: MarketEmptyState(
                            title: isArabic ? 'خطأ' : 'Error',
                            message: catalogState.message,
                          ),
                        );
                      }

                      if (catalogState is MarketCatalogLoaded) {
                        if (catalogState.isLoadingProducts) {
                          return const SliverFillRemaining(
                            child: Center(
                              child: CircularProgressIndicator(
                                color: AppColors.primary,
                              ),
                            ),
                          );
                        }

                        if (catalogState.products.isEmpty) {
                          return SliverToBoxAdapter(
                            child: MarketEmptyState(
                              title: isArabic
                                  ? 'لا توجد منتجات'
                                  : 'No Products Found',
                              message: isArabic
                                  ? 'لم نتمكن من العثور على منتجات في هذا القسم.'
                                  : 'No products are available in this category.',
                            ),
                          );
                        }

                        return SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) {
                              final product = catalogState.products[index];
                              return ProductCard(
                                product: product,
                                onAddToCart: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        isArabic
                                            ? 'تمت إضافة ${product.name} إلى السلة'
                                            : 'Added ${product.name} to cart',
                                      ),
                                      duration: const Duration(seconds: 2),
                                    ),
                                  );
                                },
                              );
                            },
                            childCount: catalogState.products.length,
                          ),
                        );
                      }

                      return const SliverToBoxAdapter(child: SizedBox.shrink());
                    },
                  ),
                ],
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
