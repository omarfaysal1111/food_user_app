import 'package:equatable/equatable.dart';

/// A tag / cuisine / filter tag scoped to a [Section].
/// Returned by `GET /api/v1/tags?section_id={id}`.
class Tag extends Equatable {
  final int id;
  final int sectionId;
  final String name;
  final String? image;

  const Tag({
    required this.id,
    required this.sectionId,
    required this.name,
    this.image,
  });

  @override
  List<Object?> get props => [id, sectionId, name, image];
}
