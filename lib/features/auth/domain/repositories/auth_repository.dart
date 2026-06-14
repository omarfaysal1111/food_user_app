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

  /// Sends an OTP to [email] as part of the forgot-password flow (API v2).
  /// Returns [Unit] on success. Any OTP in the response body is not exposed.
  Future<Either<Failure, Unit>> sendOtp({
    required String email,
    String role = 'ROLE_CUSTOMER',
  });

  /// Verifies that [otp] matches the one previously sent to [email] (API v2).
  /// Persists access/refresh tokens from the response for set-password.
  Future<Either<Failure, Unit>> verifyOtp({
    required String email,
    required String otp,
  });

  /// Sets a new password (API v2). Requires Bearer token from verify OTP.
  Future<Either<Failure, Unit>> setPassword({required String newPassword});

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
