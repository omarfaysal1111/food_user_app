import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import 'package:food_user_app/features/restaurant/domain/repositories/restaurant_repository.dart';
import 'package:food_user_app/features/restaurant/domain/entities/restaurant.dart';

class GetFavouritesUseCase extends UseCase<List<Restaurant>, NoParams> {
  final RestaurantRepository repository;

  GetFavouritesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Restaurant>>> call(NoParams params) async {
    return await repository.getFavorites();
  }
}
