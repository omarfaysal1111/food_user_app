import 'package:equatable/equatable.dart';

class BannerItem extends Equatable {
  final String id;
  final String imageUrl;
  final String title;
  final String subtitle;
  final String ctaText;
  final String discountText;
  final String deepLink;
  final int sortOrder;

  const BannerItem({
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.subtitle,
    required this.ctaText,
    required this.discountText,
    required this.deepLink,
    required this.sortOrder,
  });

  @override
  List<Object?> get props => [
    id,
    imageUrl,
    title,
    subtitle,
    ctaText,
    discountText,
    deepLink,
    sortOrder,
  ];
}
