import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetNearbyRestaurantsUseCase extends UseCase<List<dynamic>, NoParams> {
  // TODO: inject repository

  @override
  Future<Either<Failure, List<dynamic>>> call(NoParams params) {
    // TODO: implement
    throw UnimplementedError();
  }
}
