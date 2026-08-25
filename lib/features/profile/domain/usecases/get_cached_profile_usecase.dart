import 'package:dartz/dartz.dart';
import 'package:food_user_app/features/user/domain/entities/user_profile.dart';
import 'package:food_user_app/features/user/domain/repositories/user_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetCachedProfileUseCase extends UseCase<UserProfile?, NoParams> {
  final UserRepository repository;

  GetCachedProfileUseCase(this.repository);

  @override
  Future<Either<Failure, UserProfile?>> call(NoParams params) {
    return repository.getCachedProfile();
  }
}
