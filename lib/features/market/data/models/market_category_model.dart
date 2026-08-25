import '../../domain/entities/market_category.dart';

class MarketCategoryModel {
  final String id;
  final String marketId;
  final String name;
  final String? image;
  final bool isVisible;

  const MarketCategoryModel({
    required this.id,
    required this.marketId,
    required this.name,
    this.image,
    required this.isVisible,
  });

  factory MarketCategoryModel.fromJson(Map<String, dynamic> json) {
    return MarketCategoryModel(
      id: json['id']?.toString() ?? '',
      marketId: json['marketId']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      image: json['image']?.toString(),
      isVisible: json['isVisible'] == true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'marketId': marketId,
      'name': name,
      'image': image,
      'isVisible': isVisible,
    };
  }

  MarketCategory toEntity() {
    return MarketCategory(
      id: id,
      marketId: marketId,
      name: name,
      image: image,
      isVisible: isVisible,
    );
  }
}
