import 'package:dartz/dartz.dart';
import 'package:food_user_app/features/restaurant/domain/entities/restaurant.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetRestaurantsByCategoryUseCase extends UseCase<List<Restaurant>, NoParams> {
  // TODO: inject repository

  @override
  Future<Either<Failure, List<Restaurant>>> call(NoParams params) {
    // TODO: implement
    throw UnimplementedError();
  }
}
