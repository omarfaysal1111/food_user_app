import 'package:dartz/dartz.dart';
import 'package:food_user_app/features/user/domain/entities/user_settings.dart';
import 'package:food_user_app/features/user/domain/repositories/user_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetCachedSettingsUseCase extends UseCase<UserSettings?, NoParams> {
  final UserRepository repository;

  GetCachedSettingsUseCase(this.repository);

  @override
  Future<Either<Failure, UserSettings?>> call(NoParams params) {
    return repository.getCachedSettings();
  }
}
