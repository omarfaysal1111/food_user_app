import 'package:dartz/dartz.dart';
import 'package:food_user_app/core/errors/failures.dart';
import 'package:food_user_app/core/usecases/usecase.dart';
import 'package:food_user_app/features/restaurant/domain/entities/page_response_restaurant.dart';
import 'package:food_user_app/features/restaurant/domain/repositories/restaurant_repository.dart';

class GetRestaurantsByCategoryUseCase
    extends UseCase<PageResponseRestaurant, GetRestaurantsParams> {
  final RestaurantRepository repository;

  GetRestaurantsByCategoryUseCase({required this.repository});

  @override
  Future<Either<Failure, PageResponseRestaurant>> call(
    GetRestaurantsParams params,
  ) {
    return repository.getRestaurants(
      page: params.page,
      size: params.size,
      categoryId: params.categoryId,
    );
  }
}

class GetRestaurantsParams {
  final int page;
  final int size;
  final String? categoryId;

  const GetRestaurantsParams({this.page = 0, this.size = 20, this.categoryId});
}
