import 'package:equatable/equatable.dart';

class Offer extends Equatable {
  final String id;
  final String restaurantId;
  final String title;
  final int discountPercent;
  final double minOrderAmount;
  final String description;
  final DateTime expiresAt;
  final bool active;

  const Offer({
    required this.id,
    required this.restaurantId,
    required this.title,
    required this.discountPercent,
    required this.minOrderAmount,
    required this.description,
    required this.expiresAt,
    required this.active,
  });

  @override
  List<Object?> get props => [
        id,
        restaurantId,
        title,
        discountPercent,
        minOrderAmount,
        description,
        expiresAt,
        active,
      ];
}
