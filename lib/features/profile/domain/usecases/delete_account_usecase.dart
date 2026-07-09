import 'package:dartz/dartz.dart';
import 'package:food_user_app/features/user/domain/repositories/user_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class DeleteAccountUseCase extends UseCase<Unit, NoParams> {
  final UserRepository repository;

  DeleteAccountUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(NoParams params) {
    return repository.deleteAccount();
  }
}
