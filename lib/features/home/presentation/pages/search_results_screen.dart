import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_user_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:food_user_app/features/search/presentation/cubit/search_state.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/app_spacing.dart';
import 'package:food_user_app/features/restaurant/presentation/widgets/restaurant_card.dart';

class SearchResultsScreen extends StatelessWidget {
  const SearchResultsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search Results'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      backgroundColor: AppColors.scaffoldBackground(context),
      body: BlocBuilder<SearchCubit, SearchState>(
        builder: (context, state) {
          return state.maybeWhen(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (msg) => Center(child: Text(msg)),
            loaded: (result) {
              if (result.restaurants.isEmpty && result.items.isEmpty) {
                return const Center(child: Text('No results found'));
              }
              return CustomScrollView(
                slivers: [
                  if (result.restaurants.isNotEmpty) ...[
                    const SliverPadding(
                      padding: EdgeInsets.all(AppSpacing.md),
                      sliver: SliverToBoxAdapter(
                        child: Text(
                          'Restaurants',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SliverList.separated(
                      itemCount: result.restaurants.length,
                      separatorBuilder: (_, __) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        final restaurant = result.restaurants[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
                          child: RestaurantCard(
                            restaurant: restaurant,
                            width: double.infinity,
                          ),
                        );
                      },
                    ),
                  ],
                  if (result.items.isNotEmpty) ...[
                    const SliverPadding(
                      padding: EdgeInsets.all(AppSpacing.md),
                      sliver: SliverToBoxAdapter(
                        child: Text(
                          'Items',
                          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    SliverList.separated(
                      itemCount: result.items.length,
                      separatorBuilder: (_, __) => const Divider(),
                      itemBuilder: (context, index) {
                        final item = result.items[index];
                        return ListTile(
                          leading: item.imageUrl.isNotEmpty
                              ? Image.network(item.imageUrl, width: 50, height: 50, fit: BoxFit.cover)
                              : const Icon(Icons.fastfood),
                          title: Text(item.name),
                          subtitle: Text(item.description),
                          trailing: Text('EGP ${item.price}'),
                        );
                      },
                    ),
                  ]
                ],
              );
            },
            orElse: () => const Center(child: Text('Start searching')),
          );
        },
      ),
    );
  }
}
