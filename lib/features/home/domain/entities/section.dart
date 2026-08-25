import 'package:equatable/equatable.dart';

/// A home section (e.g. "Restaurants", "Grocery").
/// Returned by `GET /api/v1/sections`.
class Section extends Equatable {
  final int id;
  final String name;
  final String? image;

  /// Whether this section supports a "Major Stores" list
  /// (`GET /api/v1/stores/major`).
  final bool supportsMajor;

  const Section({
    required this.id,
    required this.name,
    this.image,
    this.supportsMajor = false,
  });

  @override
  List<Object?> get props => [id, name, image, supportsMajor];
}
