import 'package:dartz/dartz.dart';
import 'package:food_user_app/features/restaurant/domain/entities/restaurant.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetRestaurantDetailUseCase extends UseCase<Restaurant, NoParams> {
  // TODO: inject repository

  @override
  Future<Either<Failure, Restaurant>> call(NoParams params) {
    // TODO: implement
    throw UnimplementedError();
  }
}
