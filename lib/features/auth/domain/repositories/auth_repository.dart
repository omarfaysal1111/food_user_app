import 'package:dartz/dartz.dart' show Either, Unit;
import 'package:food_user_app/core/errors/failures.dart';
import 'package:food_user_app/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, User>> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    String role = 'ROLE_CUSTOMER',
  });

  /// Returns the locally cached user (if any), or `null` when not signed in.
  Future<Either<Failure, User?>> getCachedUser();

  /// Returns the locally cached access token (if any), or `null`.
  Future<Either<Failure, String?>> getCachedToken();

  /// Minimal session check: `true` when both an access token and a cached
  /// user are present. Does NOT validate token expiry or refresh.
  Future<bool> get isLoggedIn;

  /// Calls remote logout when possible, then always clears local session.
  Future<Either<Failure, Unit>> logout();
}
