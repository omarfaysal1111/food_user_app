import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:food_user_app/core/network/dio_client.dart';
import 'package:food_user_app/core/network/interceptors/auth_interceptor.dart';
import 'package:food_user_app/core/network/interceptors/logging_interceptor.dart';
import 'package:food_user_app/core/network/interceptors/retry_interceptor.dart';
import 'package:food_user_app/core/network/network_info.dart';
import 'package:food_user_app/core/storage/token_storage.dart';

import 'package:food_user_app/features/auth/data/datasources/auth_local_data_source.dart';
import 'package:food_user_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:food_user_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:food_user_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:food_user_app/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:food_user_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:food_user_app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:food_user_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:food_user_app/features/auth/domain/usecases/set_password_usecase.dart';
import 'package:food_user_app/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:food_user_app/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

/// Initializes the service locator.
///
/// Pass [prefs] in from `main.dart` so the same instance is shared with
/// [LocaleController] and anything else that needs SharedPreferences.
Future<void> init({SharedPreferences? prefs}) async {
  // ── External dependencies ───────────────────────────────────────────────
  if (prefs != null && !sl.isRegistered<SharedPreferences>()) {
    sl.registerLazySingleton<SharedPreferences>(() => prefs);
  }
  sl.registerLazySingleton<FlutterSecureStorage>(
    () => const FlutterSecureStorage(),
  );
  sl.registerLazySingleton<Connectivity>(() => Connectivity());

  // ── Storage ─────────────────────────────────────────────────────────────
  sl.registerLazySingleton<TokenStorage>(
    () => TokenStorage(storage: sl<FlutterSecureStorage>()),
  );

  // ── Network ─────────────────────────────────────────────────────────────
  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(sl<Connectivity>()),
  );

  sl.registerLazySingleton<AuthInterceptor>(
    () => AuthInterceptor(sl<TokenStorage>()),
  );
  sl.registerLazySingleton<LoggingInterceptor>(() => LoggingInterceptor());

  // RetryInterceptor needs a Dio reference but is a pass-through in Phase 1
  // (see RetryInterceptor TODO). We give it a throwaway Dio here; once a real
  // retry policy is implemented, switch this to share `sl<DioClient>().dio`.
  sl.registerLazySingleton<RetryInterceptor>(
    () => RetryInterceptor(dio: Dio()),
  );

  sl.registerLazySingleton<DioClient>(
    () => DioClient(
      authInterceptor: sl<AuthInterceptor>(),
      loggingInterceptor: sl<LoggingInterceptor>(),
      retryInterceptor: sl<RetryInterceptor>(),
    ),
  );

  // ── Auth local cache ─────────────────────────────────────────────────────
  sl.registerLazySingleton<AuthLocalDataSource>(
    () => AuthLocalDataSourceImpl(
      prefs: sl<SharedPreferences>(),
      tokenStorage: sl<TokenStorage>(),
    ),
  );

  // ── Auth remote (login still mock; register uses real API) ───────────────
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(dio: sl<DioClient>().dio),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteDataSource: sl<AuthRemoteDataSource>(),
      localDataSource: sl<AuthLocalDataSource>(),
      networkInfo: sl<NetworkInfo>(),
    ),
  );

  sl.registerLazySingleton(() => LoginUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => RegisterUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => LogoutUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => ForgotPasswordUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => VerifyOtpUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => SetPasswordUseCase(sl<AuthRepository>()));

  // Single AuthBloc shared across splash/login/register so the cached
  // session state is consistent. Provided globally in `app.dart`.
  sl.registerLazySingleton<AuthBloc>(
    () => AuthBloc(
      loginUseCase: sl<LoginUseCase>(),
      registerUseCase: sl<RegisterUseCase>(),
      logoutUseCase: sl<LogoutUseCase>(),
      forgotPasswordUseCase: sl<ForgotPasswordUseCase>(),
      verifyOtpUseCase: sl<VerifyOtpUseCase>(),
      setPasswordUseCase: sl<SetPasswordUseCase>(),
      authRepository: sl<AuthRepository>(),
    ),
  );
}
