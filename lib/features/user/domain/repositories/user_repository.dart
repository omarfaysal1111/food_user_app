import 'package:dartz/dartz.dart';
import 'package:food_user_app/core/errors/failures.dart';
import 'package:food_user_app/features/user/data/models/update_user_profile_request.dart';
import 'package:food_user_app/features/user/data/models/update_user_settings_request.dart';
import 'package:food_user_app/features/user/domain/entities/user_profile.dart';
import 'package:food_user_app/features/user/domain/entities/user_settings.dart';

abstract class UserRepository {
  Future<Either<Failure, UserProfile>> getProfile();

  Future<Either<Failure, UserProfile>> updateProfile(
    UpdateUserProfileRequest request,
  );

  Future<Either<Failure, UserSettings>> getSettings();

  Future<Either<Failure, UserSettings>> updateSettings(
    UpdateUserSettingsRequest request,
  );

  Future<Either<Failure, Unit>> deleteAccount();
}
