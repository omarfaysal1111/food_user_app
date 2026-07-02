import 'package:food_user_app/features/restaurant/data/mock/restaurant_mock_data.dart';

class RestaurantDetailArgs {
  const RestaurantDetailArgs({
    required this.id,
    required this.name,
    required this.description,
    required this.deliveryTime,
    required this.rating,
    required this.logoAsset,
    required this.coverAsset,
    this.deliveryFee,
    this.initialFavorite = false,
  });

  final String id;
  final String name;
  final String description;
  final String deliveryTime;
  final double rating;
  final String logoAsset;
  final String coverAsset;
  final String? deliveryFee;
  final bool initialFavorite;

  MockRestaurant toRestaurant() {
    return MockRestaurant(
      id: id,
      nameAr: name,
      nameEn: name,
      descriptionAr: description,
      descriptionEn: description,
      deliveryTimeAr: deliveryTime,
      deliveryTimeEn: deliveryTime,
      deliveryFeeAr: deliveryFee ?? mockRestaurant.deliveryFeeAr,
      deliveryFeeEn: deliveryFee ?? mockRestaurant.deliveryFeeEn,
      minimumOrderAr: mockRestaurant.minimumOrderAr,
      minimumOrderEn: mockRestaurant.minimumOrderEn,
      addressAr: mockRestaurant.addressAr,
      addressEn: mockRestaurant.addressEn,
      previousOrdersAr: mockRestaurant.previousOrdersAr,
      previousOrdersEn: mockRestaurant.previousOrdersEn,
      rating: rating,
      ratingCount: mockRestaurant.ratingCount,
      logoAsset: logoAsset,
      coverAsset: coverAsset,
      categoriesAr: mockRestaurant.categoriesAr,
      categoriesEn: mockRestaurant.categoriesEn,
      menu: mockRestaurant.menu,
      menuSections: mockRestaurant.menuSections,
      reviews: mockRestaurant.reviews,
    );
  }
}
