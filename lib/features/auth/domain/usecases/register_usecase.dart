import 'package:dartz/dartz.dart';
import 'package:food_user_app/features/auth/domain/entities/user.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class RegisterUseCase extends UseCase<User, NoParams> {
  // TODO: inject repository

  @override
  Future<Either<Failure, User>> call(NoParams params) {
    // TODO: implement
    throw UnimplementedError();
  }
}
