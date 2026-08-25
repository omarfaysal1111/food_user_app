import 'package:food_user_app/features/home/domain/entities/section.dart';

/// Data model for `GET /api/v1/sections`.
///
/// API shape inside unified `{ status, msg, data }` envelope:
/// ```json
/// [
///   { "id": 1, "name": "المطاعم", "image": "...", "supports_major": false },
///   { "id": 2, "name": "البقالة", "image": "...", "supports_major": false }
/// ]
/// ```
class SectionModel extends Section {
  const SectionModel({
    required super.id,
    required super.name,
    super.image,
    super.supportsMajor,
  });

  factory SectionModel.fromJson(Map<String, dynamic> json) {
    return SectionModel(
      id: (json['id'] as num).toInt(),
      name: json['name']?.toString() ?? '',
      image: json['image']?.toString(),
      supportsMajor: json['supports_major'] == true,
    );
  }
}
