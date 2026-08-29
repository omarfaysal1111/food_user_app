import re

with open('lib/core/widgets/shared_store_list_tile.dart', 'r') as f:
    content = f.read()

# Fix _TimeLabel
time_label_old = """class _TimeLabel extends StatelessWidget {
  const _TimeLabel({
    required this.time,
  });

  final String time;

  @override
  Widget build(BuildContext context) {
    final color = AppColors.onSurface(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        AppRasterImage.asset(
          AppAssets.serviceTimeIconPng,
          width: 14,
          height: 14,
          color: color,
        ),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            time,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.caption(
              context,
            ).copyWith(color: color, fontSize: 10, height: 1.25),
          ),
        ),
      ],
    );
  }
}"""

time_label_new = """class _TimeLabel extends StatelessWidget {
  const _TimeLabel({
    required this.time,
  });

  final String time;

  @override
  Widget build(BuildContext context) {
    final color = AppColors.onSurface(context);
    final isRtl = Directionality.of(context) == TextDirection.rtl;
    final minLabel = isRtl ? 'دقيقة' : 'mins';
    
    // Clean up any existing "min", "mins", or "دقيقة"
    var cleanTime = time.replaceAll(RegExp(r'\s*(mins?|دقيقة)'), '').trim();
    if (cleanTime.isEmpty) cleanTime = time; 
    final displayTime = '$cleanTime $minLabel';

    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppRasterImage.asset(
          AppAssets.serviceTimeIconPng,
          width: 14,
          height: 14,
          color: color,
        ),
        const SizedBox(width: 4),
        Flexible(
          child: Text(
            displayTime,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: AppTextStyles.caption(
              context,
            ).copyWith(color: color, fontSize: 10, height: 1.0),
          ),
        ),
      ],
    );
  }
}"""

# Fix _RatingLabel
rating_label_old = """class _RatingLabel extends StatelessWidget {
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
}"""

rating_label_new = """class _RatingLabel extends StatelessWidget {
  const _RatingLabel({required this.rating});

  final String rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        AppSvgImage.asset(AppAssets.serviceStarIcon, width: 14, height: 14),
        const SizedBox(width: 2),
        Text(
          rating,
          style: AppTextStyles.body(
            context,
          ).copyWith(fontSize: 10, height: 1.0),
        ),
      ],
    );
  }
}"""

content = content.replace(time_label_old, time_label_new)
content = content.replace(rating_label_old, rating_label_new)

with open('lib/core/widgets/shared_store_list_tile.dart', 'w') as f:
    f.write(content)

