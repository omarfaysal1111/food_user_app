import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/restaurant/domain/entities/restaurant.dart';

part 'restaurant_dto.freezed.dart';
part 'restaurant_dto.g.dart';

@freezed
abstract class RestaurantDto with _$RestaurantDto {
  const factory RestaurantDto({
    required String id,
    String? name,
    String? cuisineType,
    String? coverImageUrl,
    double? rating,
    int? deliveryTimeMin,
    int? deliveryTimeMax,
    double? deliveryFee,
    bool? isFavorited,
  }) = _RestaurantDto;

  factory RestaurantDto.fromJson(Map<String, dynamic> json) =>
      _$RestaurantDtoFromJson(json);
}

extension RestaurantDtoMapper on RestaurantDto {
  Restaurant toEntity() {
    return Restaurant(
      id: id,
      name: name ?? '',
      cuisineType: cuisineType ?? '',
      coverImageUrl: coverImageUrl ?? '',
      rating: rating ?? 0.0,
      deliveryTimeMin: deliveryTimeMin ?? 0,
      deliveryTimeMax: deliveryTimeMax ?? 0,
      deliveryFee: deliveryFee ?? 0.0,
      isFavorited: isFavorited ?? false,
    );
  }
}
