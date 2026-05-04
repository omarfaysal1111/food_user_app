import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetOrderTrackingUseCase extends UseCase<Order, NoParams> {
  // TODO: inject repository

  @override
  Future<Either<Failure, Order>> call(NoParams params) {
    // TODO: implement
    throw UnimplementedError();
  }
}
