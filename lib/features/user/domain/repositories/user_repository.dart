import 'package:dartz/dartz.dart';
import 'package:food_user_app/core/errors/failures.dart';
import 'package:food_user_app/features/user/domain/entities/user_profile.dart';
import 'package:food_user_app/features/user/domain/entities/user_settings.dart';
import 'package:food_user_app/features/user/domain/models/update_profile_request.dart';
import 'package:food_user_app/features/user/domain/models/update_settings_request.dart';

abstract class UserRepository {
  Future<Either<Failure, UserProfile>> getProfile();

  Future<Either<Failure, UserProfile>> updateProfile(
    UpdateProfileRequest request,
  );

  Future<Either<Failure, UserSettings>> getSettings();

  Future<Either<Failure, UserSettings>> updateSettings(
    UpdateSettingsRequest request,
  );

  Future<Either<Failure, Unit>> deleteAccount();
}
