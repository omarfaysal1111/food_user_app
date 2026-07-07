import 'package:dartz/dartz.dart';
import 'package:food_user_app/core/errors/failures.dart';
import 'package:food_user_app/core/usecases/usecase.dart';
import 'package:food_user_app/features/restaurant/domain/entities/restaurant.dart';
import 'package:food_user_app/features/restaurant/domain/repositories/restaurant_repository.dart';

class GetRestaurantDetailUseCase
    extends UseCase<Restaurant, GetRestaurantDetailParams> {
  final RestaurantRepository repository;

  GetRestaurantDetailUseCase({required this.repository});

  @override
  Future<Either<Failure, Restaurant>> call(GetRestaurantDetailParams params) {
    return repository.getRestaurantDetail(params.id);
  }
}

class GetRestaurantDetailParams {
  final String id;

  const GetRestaurantDetailParams({required this.id});
}
