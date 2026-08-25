import '../../domain/entities/product.dart';

class ProductModel {
  final String id;
  final String subCategoryId;
  final String name;
  final String? description;
  final String? image;
  final double price;
  final double? originalPrice;
  final List<String> customizations;

  const ProductModel({
    required this.id,
    required this.subCategoryId,
    required this.name,
    this.description,
    this.image,
    required this.price,
    this.originalPrice,
    required this.customizations,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    final rawCustomizations = json['customizations'];
    List<String> parsedCustomizations = [];
    if (rawCustomizations is List) {
      parsedCustomizations = rawCustomizations
          .map((e) => e.toString())
          .where((e) => e.isNotEmpty)
          .toList();
    }

    return ProductModel(
      id: json['id']?.toString() ?? '',
      subCategoryId: json['subCategoryId']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      description: json['description']?.toString(),
      image: json['image']?.toString(),
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      originalPrice: (json['originalPrice'] as num?)?.toDouble(),
      customizations: parsedCustomizations,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'subCategoryId': subCategoryId,
      'name': name,
      'description': description,
      'image': image,
      'price': price,
      'originalPrice': originalPrice,
      'customizations': customizations,
    };
  }

  Product toEntity() {
    return Product(
      id: id,
      subCategoryId: subCategoryId,
      name: name,
      description: description,
      image: image,
      price: price,
      originalPrice: originalPrice,
      customizations: customizations,
    );
  }
}
