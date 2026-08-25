import 'package:dartz/dartz.dart';
import 'package:food_user_app/core/errors/failures.dart';
import 'package:food_user_app/core/usecases/usecase.dart';
import 'package:food_user_app/features/home/domain/entities/app_settings.dart';
import 'package:food_user_app/features/home/domain/repositories/home_repository.dart';

/// `GET /api/v1/general-settings`
class GetGeneralSettingsUseCase extends UseCase<AppSettings, NoParams> {
  GetGeneralSettingsUseCase(this._repository);
  final HomeRepository _repository;

  @override
  Future<Either<Failure, AppSettings>> call(NoParams params) {
    return _repository.getGeneralSettings();
  }
}
