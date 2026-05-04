import 'package:dartz/dartz.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class ForgotPasswordUseCase extends UseCase<bool, NoParams> {
  // TODO: inject repository

  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    // TODO: implement
    throw UnimplementedError();
  }
}
