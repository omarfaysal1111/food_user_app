import '../../domain/entities/market.dart';

class MarketModel {
  final String id;
  final String ownerId;
  final String name;
  final String? coverImage;
  final String? logoImage;
  final double rating;
  final int ratingCount;
  final int deliveryTimeMin;
  final int deliveryTimeMax;
  final double deliveryFee;
  final double minimumOrder;
  final bool isAvailable;
  final bool isFavorite;
  final bool pickupAvailable;
  final bool isVisible;

  const MarketModel({
    required this.id,
    required this.ownerId,
    required this.name,
    this.coverImage,
    this.logoImage,
    required this.rating,
    required this.ratingCount,
    required this.deliveryTimeMin,
    required this.deliveryTimeMax,
    required this.deliveryFee,
    required this.minimumOrder,
    required this.isAvailable,
    required this.isFavorite,
    required this.pickupAvailable,
    required this.isVisible,
  });

  factory MarketModel.fromJson(Map<String, dynamic> json) {
    return MarketModel(
      id: json['id']?.toString() ?? '',
      ownerId: json['ownerId']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      coverImage: json['coverImage']?.toString(),
      logoImage: json['logoImage']?.toString(),
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      ratingCount: (json['ratingCount'] as num?)?.toInt() ?? 0,
      deliveryTimeMin: (json['deliveryTimeMin'] as num?)?.toInt() ?? 0,
      deliveryTimeMax: (json['deliveryTimeMax'] as num?)?.toInt() ?? 0,
      deliveryFee: (json['deliveryFee'] as num?)?.toDouble() ?? 0.0,
      minimumOrder: (json['minimumOrder'] as num?)?.toDouble() ?? 0.0,
      isAvailable: json['isAvailable'] == true,
      isFavorite: json['isFavorite'] == true,
      pickupAvailable: json['pickupAvailable'] == true,
      isVisible: json['isVisible'] == true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ownerId': ownerId,
      'name': name,
      'coverImage': coverImage,
      'logoImage': logoImage,
      'rating': rating,
      'ratingCount': ratingCount,
      'deliveryTimeMin': deliveryTimeMin,
      'deliveryTimeMax': deliveryTimeMax,
      'deliveryFee': deliveryFee,
      'minimumOrder': minimumOrder,
      'isAvailable': isAvailable,
      'isFavorite': isFavorite,
      'pickupAvailable': pickupAvailable,
      'isVisible': isVisible,
    };
  }

  Market toEntity() {
    return Market(
      id: id,
      ownerId: ownerId,
      name: name,
      coverImage: coverImage,
      logoImage: logoImage,
      rating: rating,
      ratingCount: ratingCount,
      deliveryTimeMin: deliveryTimeMin,
      deliveryTimeMax: deliveryTimeMax,
      deliveryFee: deliveryFee,
      minimumOrder: minimumOrder,
      isAvailable: isAvailable,
      isFavorite: isFavorite,
      pickupAvailable: pickupAvailable,
      isVisible: isVisible,
    );
  }

  factory MarketModel.fromEntity(Market entity) {
    return MarketModel(
      id: entity.id,
      ownerId: entity.ownerId,
      name: entity.name,
      coverImage: entity.coverImage,
      logoImage: entity.logoImage,
      rating: entity.rating,
      ratingCount: entity.ratingCount,
      deliveryTimeMin: entity.deliveryTimeMin,
      deliveryTimeMax: entity.deliveryTimeMax,
      deliveryFee: entity.deliveryFee,
      minimumOrder: entity.minimumOrder,
      isAvailable: entity.isAvailable,
      isFavorite: entity.isFavorite,
      pickupAvailable: entity.pickupAvailable,
      isVisible: entity.isVisible,
    );
  }
}
