import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/app_spacing.dart';
import 'package:food_user_app/features/restaurant/presentation/cubit/restaurant_filter_cubit.dart';
import 'package:food_user_app/l10n/app_localizations.dart';

class FilterBottomSheet extends StatelessWidget {
  const FilterBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: AppColors.surfaceCard(context),
        borderRadius: const BorderRadius.vertical(top: Radius.circular(24)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            'Filters',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: AppSpacing.md),
          ListTile(
            leading: const Icon(Icons.star, color: Colors.orange),
            title: Text(AppLocalizations.of(context)!.filterTopRated),
            onTap: () {
              context.read<RestaurantFilterCubit>().fetchTopRated();
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.trending_up, color: Colors.green),
            title: Text(AppLocalizations.of(context)!.filterMostOrdered),
            onTap: () {
              context.read<RestaurantFilterCubit>().fetchMostOrdered();
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: const Icon(Icons.local_offer, color: Colors.red),
            title: Text(AppLocalizations.of(context)!.filterWithOffers),
            onTap: () {
              context.read<RestaurantFilterCubit>().fetchWithOffers();
              Navigator.pop(context);
            },
          ),
          const SizedBox(height: AppSpacing.lg),
        ],
      ),
    );
  }
}
