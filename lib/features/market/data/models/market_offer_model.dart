import '../../domain/entities/market_offer.dart';

class MarketOfferModel {
  final String id;
  final String marketId;
  final String title;
  final String? description;
  final String? image;
  final int discountPercent;
  final double minOrderAmount;

  const MarketOfferModel({
    required this.id,
    required this.marketId,
    required this.title,
    this.description,
    this.image,
    required this.discountPercent,
    required this.minOrderAmount,
  });

  factory MarketOfferModel.fromJson(Map<String, dynamic> json) {
    return MarketOfferModel(
      id: json['id']?.toString() ?? '',
      marketId: json['marketId']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString(),
      image: json['image']?.toString(),
      discountPercent: (json['discountPercent'] as num?)?.toInt() ?? 0,
      minOrderAmount: (json['minOrderAmount'] as num?)?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'marketId': marketId,
      'title': title,
      'description': description,
      'image': image,
      'discountPercent': discountPercent,
      'minOrderAmount': minOrderAmount,
    };
  }

  MarketOffer toEntity() {
    return MarketOffer(
      id: id,
      marketId: marketId,
      title: title,
      description: description,
      image: image,
      discountPercent: discountPercent,
      minOrderAmount: minOrderAmount,
    );
  }
}
