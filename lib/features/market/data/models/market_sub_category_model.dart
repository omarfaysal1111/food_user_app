import '../../domain/entities/market_sub_category.dart';

class MarketSubCategoryModel {
  final String id;
  final String categoryId;
  final String name;
  final String? image;
  final bool isVisible;

  const MarketSubCategoryModel({
    required this.id,
    required this.categoryId,
    required this.name,
    this.image,
    required this.isVisible,
  });

  factory MarketSubCategoryModel.fromJson(Map<String, dynamic> json) {
    return MarketSubCategoryModel(
      id: json['id']?.toString() ?? '',
      categoryId: json['categoryId']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      image: json['image']?.toString(),
      isVisible: json['isVisible'] == true,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'categoryId': categoryId,
      'name': name,
      'image': image,
      'isVisible': isVisible,
    };
  }

  MarketSubCategory toEntity() {
    return MarketSubCategory(
      id: id,
      categoryId: categoryId,
      name: name,
      image: image,
      isVisible: isVisible,
    );
  }
}
