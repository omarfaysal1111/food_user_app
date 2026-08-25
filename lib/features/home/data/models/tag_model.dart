import 'package:food_user_app/features/home/domain/entities/tag.dart';

/// Data model for `GET /api/v1/tags?section_id={id}`.
///
/// API shape inside unified envelope:
/// ```json
/// { "id": 1, "section_id": 1, "name": "بيتزا", "image": "..." }
/// ```
class TagModel extends Tag {
  const TagModel({
    required super.id,
    required super.sectionId,
    required super.name,
    super.image,
  });

  factory TagModel.fromJson(Map<String, dynamic> json) {
    return TagModel(
      id: (json['id'] as num).toInt(),
      sectionId: (json['section_id'] as num).toInt(),
      name: json['name']?.toString() ?? '',
      image: json['image']?.toString(),
    );
  }
}
