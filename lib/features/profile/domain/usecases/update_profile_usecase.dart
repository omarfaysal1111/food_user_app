import 'package:dartz/dartz.dart';
import 'package:food_user_app/features/profile/domain/entities/profile.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class UpdateProfileUseCase extends UseCase<Profile, NoParams> {
  // TODO: inject repository

  @override
  Future<Either<Failure, Profile>> call(NoParams params) {
    // TODO: implement
    throw UnimplementedError();
  }
}
