import 'package:equatable/equatable.dart';

class MarketSubCategory extends Equatable {
  final String id;
  final String categoryId;
  final String name;
  final String? image;
  final bool isVisible;

  const MarketSubCategory({
    required this.id,
    required this.categoryId,
    required this.name,
    this.image,
    required this.isVisible,
  });

  @override
  List<Object?> get props => [id, categoryId, name, image, isVisible];
}
