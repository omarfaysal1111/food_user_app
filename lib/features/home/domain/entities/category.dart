import 'package:equatable/equatable.dart';
import 'package:food_user_app/features/service_listing/presentation/models/service_listing_type.dart';

class Category extends Equatable {
  final String id;
  final String name;
  final String imageUrl;
  final ServiceListingType type;

  const Category({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.type,
  });

  @override
  List<Object?> get props => [id, name, imageUrl, type];
}
