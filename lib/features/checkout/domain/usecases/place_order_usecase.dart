import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class PlaceOrderUseCase extends UseCase<dynamic, NoParams> {
  // TODO: inject repository

  @override
  Future<Either<Failure, dynamic>> call(NoParams params) {
    // TODO: implement
    throw UnimplementedError();
  }
}
