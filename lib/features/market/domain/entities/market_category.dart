import 'package:equatable/equatable.dart';

class MarketCategory extends Equatable {
  final String id;
  final String marketId;
  final String name;
  final String? image;
  final bool isVisible;

  const MarketCategory({
    required this.id,
    required this.marketId,
    required this.name,
    this.image,
    required this.isVisible,
  });

  @override
  List<Object?> get props => [id, marketId, name, image, isVisible];
}
