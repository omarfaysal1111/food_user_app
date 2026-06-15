import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:food_user_app/core/theme/app_colors.dart';
import 'package:food_user_app/core/theme/app_radius.dart';
import 'package:food_user_app/core/theme/app_spacing.dart';
import 'package:food_user_app/core/theme/text_styles.dart';
import 'package:food_user_app/features/restaurant/presentation/mock/restaurant_mock_data.dart';

class RestaurantRateScreen extends StatelessWidget {
  const RestaurantRateScreen({this.restaurantId = 'az-al-sham', super.key});

  final String restaurantId;

  @override
  Widget build(BuildContext context) {
    final copy = _RateCopy.of(context);
    final locale = Localizations.localeOf(context);
    final restaurant = mockRestaurant;

    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground(context),
      body: SafeArea(
        bottom: false,
        child: CustomScrollView(
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
                  _RateHeader(title: copy.title),
                  const SizedBox(height: 20),
                  _RatingSummary(
                    rating: restaurant.rating,
                    ratingCount: restaurant.ratingCount,
                    copy: copy,
                  ),
                  const SizedBox(height: 16),
                  _SectionHeader(title: copy.customerReviews),
                  const SizedBox(height: 12),
                  ...restaurant.reviews.map(
                    (review) => _ReviewTile(review: review, locale: locale),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RateHeader extends StatelessWidget {
  const _RateHeader({required this.title});

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
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
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

class _RatingSummary extends StatelessWidget {
  const _RatingSummary({
    required this.rating,
    required this.ratingCount,
    required this.copy,
  });

  final double rating;
  final String ratingCount;
  final _RateCopy copy;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.all(12),
      decoration: BoxDecoration(
        color: AppColors.scaffoldBackground(context),
        borderRadius: const BorderRadius.all(AppRadius.md),
        border: Border.all(color: AppColors.border(context), width: 1),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 152,
            child: Column(
              children: [
                Text(
                  rating.toStringAsFixed(1),
                  style: AppTextStyles.heading1(
                    context,
                  ).copyWith(fontSize: 20, height: 1.4),
                ),
                const SizedBox(height: AppSpacing.sm),
                const _Stars(size: 24),
                const SizedBox(height: AppSpacing.sm),
                Text(
                  '($ratingCount ${copy.ratingsLabel})',
                  style: AppTextStyles.caption(
                    context,
                  ).copyWith(fontSize: 12, height: 1.3),
                ),
              ],
            ),
          ),
          Container(width: 1, height: 40, color: AppColors.border(context)),
          const _RatingBars(),
        ],
      ),
    );
  }
}

class _Stars extends StatelessWidget {
  const _Stars({required this.size, this.count = 5});

  final double size;
  final int count;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        count,
        (_) => Icon(
          Icons.star_rounded,
          color: const Color(0xFFFFB800),
          size: size,
        ),
      ),
    );
  }
}

class _RatingBars extends StatelessWidget {
  const _RatingBars();

  static const _values = [0.94, 0.64, 0.54, 0.82, 0.19];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.generate(5, (index) {
        final value = _values[index];
        final score = 5 - index;
        return Padding(
          padding: const EdgeInsetsDirectional.symmetric(vertical: 3),
          child: Row(
            children: [
              SizedBox(
                width: 122,
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(AppRadius.full),
                  child: LinearProgressIndicator(
                    minHeight: 3,
                    value: value,
                    backgroundColor: const Color(0xFFB6B6B6),
                    color: AppColors.primary,
                  ),
                ),
              ),
              const SizedBox(width: 5),
              Text(
                '$score',
                style: AppTextStyles.caption(
                  context,
                ).copyWith(fontSize: 12, color: AppColors.onSurface(context)),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: Text(
        title,
        style: AppTextStyles.heading4(
          context,
        ).copyWith(fontSize: 15, height: 1.4),
      ),
    );
  }
}

class _ReviewTile extends StatelessWidget {
  const _ReviewTile({required this.review, required this.locale});

  final MockReview review;
  final Locale locale;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsetsDirectional.only(bottom: 12),
      margin: const EdgeInsetsDirectional.only(bottom: 12),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColors.border(context), width: 0.5),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                review.date,
                style: AppTextStyles.caption(
                  context,
                ).copyWith(fontSize: 10, height: 1.25),
              ),
              Text(
                review.name(locale),
                style: AppTextStyles.body(
                  context,
                ).copyWith(fontSize: 12, height: 1.3),
              ),
            ],
          ),
          const SizedBox(height: AppSpacing.sm),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [_Stars(size: 12, count: review.rating)],
          ),
          const SizedBox(height: AppSpacing.sm),
          Align(
            alignment: AlignmentDirectional.centerEnd,
            child: Text(
              review.comment(locale),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
              style: AppTextStyles.caption(
                context,
              ).copyWith(fontSize: 12, height: 1.3),
            ),
          ),
        ],
      ),
    );
  }
}

class _RateCopy {
  const _RateCopy({
    required this.title,
    required this.customerReviews,
    required this.ratingsLabel,
  });

  final String title;
  final String customerReviews;
  final String ratingsLabel;

  static _RateCopy of(BuildContext context) {
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    return isArabic ? _arabic : _english;
  }

  static const _arabic = _RateCopy(
    title: 'التقييم',
    customerReviews: 'أراء العملاء',
    ratingsLabel: 'التقييمات',
  );

  static const _english = _RateCopy(
    title: 'Rating',
    customerReviews: 'Customer reviews',
    ratingsLabel: 'ratings',
  );
}
