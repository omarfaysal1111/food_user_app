import 'package:food_user_app/features/home/domain/entities/category.dart';
import 'package:food_user_app/features/service_listing/presentation/models/service_listing_type.dart';

class CategoryModel extends Category {
  const CategoryModel({
    required super.id,
    required super.name,
    required super.imageUrl,
    required super.type,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'] as String,
      name: json['name'] as String,
      imageUrl: json['imageUrl'] as String,
      type: ServiceListingType.fromPathSegment(json['type'] as String?),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'imageUrl': imageUrl,
      'type': type.pathSegment,
    };
  }
}
