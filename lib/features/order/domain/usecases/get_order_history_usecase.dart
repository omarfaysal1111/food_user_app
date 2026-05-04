import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetOrderHistoryUseCase extends UseCase<List<Order>, NoParams> {
  // TODO: inject repository

  @override
  Future<Either<Failure, List<Order>>> call(NoParams params) {
    // TODO: implement
    throw UnimplementedError();
  }
}
