import 'package:dartz/dartz.dart';
import 'package:food_user_app/features/user/domain/entities/user_profile.dart';
import 'package:food_user_app/features/user/domain/models/update_profile_request.dart';
import 'package:food_user_app/features/user/domain/repositories/user_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class UpdateProfileUseCase extends UseCase<UserProfile, UpdateProfileRequest> {
  final UserRepository repository;

  UpdateProfileUseCase(this.repository);

  @override
  Future<Either<Failure, UserProfile>> call(UpdateProfileRequest params) {
    return repository.updateProfile(params);
  }
}
