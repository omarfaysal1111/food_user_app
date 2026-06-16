import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:food_user_app/core/errors/exceptions.dart';
import 'package:food_user_app/core/errors/failures.dart';
import 'package:food_user_app/core/network/dio_error_mapper.dart';
import 'package:food_user_app/core/network/network_info.dart';
import 'package:food_user_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:food_user_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:food_user_app/features/auth/data/models/auth_response_model.dart';
import 'package:food_user_app/features/auth/domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure('No internet connection'));
    }
    try {
      final auth = await remoteDataSource.login(
        email: email,
        password: password,
      );
      await _persistSession(auth);
      return Right(auth.user);
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, User>> register({
    required String name,
    required String email,
    required String password,
    required String phone,
    String role = 'ROLE_CUSTOMER',
  }) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure('No internet connection'));
    }
    try {
      final auth = await remoteDataSource.register(
        name: name,
        email: email,
        password: password,
        phone: phone,
        role: role,
      );
      await _persistSession(auth);
      return Right(auth.user);
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> sendOtp({
    required String email,
    String role = 'ROLE_CUSTOMER',
  }) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure('No internet connection'));
    }
    try {
      await remoteDataSource.sendOtp(email: email, role: role);
      return const Right(unit);
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure('No internet connection'));
    }
    try {
      final result = await remoteDataSource.verifyOtp(email: email, otp: otp);
      await _persistSession(result.toAuthResponseModel());
      return const Right(unit);
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, Unit>> setPassword({
    required String newPassword,
  }) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure('No internet connection'));
    }
    try {
      await remoteDataSource.setPassword(newPassword: newPassword);
      // OTP-verify tokens are only for this step; clear so splash/login do
      // not treat the user as signed in before they log in with the new password.
      await _clearLocalSession();
      return const Right(unit);
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, User?>> getCachedUser() async {
    try {
      final user = await localDataSource.getCachedUser();
      return Right(user);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, String?>> getCachedToken() async {
    try {
      final token = await localDataSource.getAccessToken();
      return Right(token);
    } on CacheException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(UnknownFailure(e.toString()));
    }
  }

  @override
  Future<bool> get isLoggedIn async {
    try {
      final token = await localDataSource.getAccessToken();
      if (token == null || token.isEmpty) return false;
      final user = await localDataSource.getCachedUser();
      return user != null;
    } catch (_) {
      return false;
    }
  }

  @override
  Future<Either<Failure, Unit>> logout() async {
    final refresh = await localDataSource.getRefreshToken();
    if (refresh != null &&
        refresh.isNotEmpty &&
        await networkInfo.isConnected) {
      try {
        await remoteDataSource.logout(refreshToken: refresh);
      } catch (_) {
        // Best-effort remote logout; local session is cleared regardless.
      }
    }
    await _clearLocalSession();
    return const Right(unit);
  }

  // ── Unified phone login/register (API v2) ──────────────────────────────────

  @override
  Future<Either<Failure, bool>> sendPhoneOtp({required String phone}) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure('No internet connection'));
    }
    try {
      final res = await remoteDataSource.sendPhoneOtp(phone: phone);
      return Right(res.isExistingUser ?? false);
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, PhoneVerifyResult>> verifyPhoneOtp({
    required String phone,
    required String otp,
  }) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure('No internet connection'));
    }
    try {
      final auth = await remoteDataSource.verifyPhoneOtp(
        phone: phone,
        otp: otp,
      );
      if (auth.newUser || !auth.hasAccessToken) {
        // New phone: nothing to persist yet — caller goes to complete-profile.
        return Right(PhoneVerifyResult(newUser: true, phone: phone));
      }
      await _persistSession(auth);
      return Right(
        PhoneVerifyResult(newUser: false, phone: phone, user: auth.user),
      );
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, User>> completeRegistration({
    required String phone,
    required String firstName,
    required String lastName,
    String? email,
  }) async {
    if (!await networkInfo.isConnected) {
      return const Left(NetworkFailure('No internet connection'));
    }
    try {
      final auth = await remoteDataSource.completeRegistration(
        phone: phone,
        firstName: firstName,
        lastName: lastName,
        email: email,
      );
      await _persistSession(auth);
      return Right(auth.user);
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  Future<void> _clearLocalSession() async {
    await localDataSource.clearTokens();
    await localDataSource.clearCachedUser();
  }

  Future<void> _persistSession(AuthResponseModel auth) async {
    final access = auth.accessToken;
    if (access != null && access.isNotEmpty) {
      await localDataSource.cacheAccessToken(access);
    }
    final refresh = auth.refreshToken;
    if (refresh != null && refresh.isNotEmpty) {
      await localDataSource.cacheRefreshToken(refresh);
    } else {
      await localDataSource.clearRefreshToken();
    }
    await localDataSource.cacheUser(auth.user);
  }

  Failure _mapExceptionToFailure(Object error) {
    if (error is DioException) {
      return _mapExceptionToFailure(DioErrorMapper.map(error));
    }
    if (error is AuthException) return AuthFailure(error.message);
    if (error is ServerException) return ServerFailure(error.message);
    if (error is NetworkException) return NetworkFailure(error.message);
    if (error is TimeoutException) return TimeoutFailure(error.message);
    if (error is UnauthorizedException) {
      return UnauthorizedFailure(error.message);
    }
    if (error is ValidationException) {
      return ValidationFailure(error.message, errors: error.errors);
    }
    if (error is UnknownException) return UnknownFailure(error.message);
    if (error is CacheException) return CacheFailure(error.message);
    return UnknownFailure(error.toString());
  }
}
