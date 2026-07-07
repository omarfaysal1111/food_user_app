import 'package:equatable/equatable.dart';

class Restaurant extends Equatable {
  final String id;
  final String name;
  final String cuisineType;
  final String coverImageUrl;
  final double rating;
  final int deliveryTimeMin;
  final int deliveryTimeMax;
  final double deliveryFee;
  final bool isFavorited;

  const Restaurant({
    required this.id,
    required this.name,
    required this.cuisineType,
    required this.coverImageUrl,
    required this.rating,
    required this.deliveryTimeMin,
    required this.deliveryTimeMax,
    required this.deliveryFee,
    required this.isFavorited,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    cuisineType,
    coverImageUrl,
    rating,
    deliveryTimeMin,
    deliveryTimeMax,
    deliveryFee,
    isFavorited,
  ];
}
