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
import 'package:food_user_app/features/auth/domain/usecases/send_phone_otp_usecase.dart';
import 'package:food_user_app/features/auth/domain/usecases/verify_phone_otp_usecase.dart';
import 'package:food_user_app/features/auth/domain/usecases/complete_registration_usecase.dart';
import 'package:food_user_app/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:food_user_app/features/profile/presentation/bloc/profile_bloc.dart';
import 'package:food_user_app/features/profile/data/repositories/saved_addresses_repository_impl.dart';
import 'package:food_user_app/features/profile/domain/repositories/saved_addresses_repository.dart';
import 'package:food_user_app/features/user/data/datasources/user_remote_data_source.dart';
import 'package:food_user_app/features/user/data/repositories/user_repository_impl.dart';
import 'package:food_user_app/features/user/domain/repositories/user_repository.dart';
import 'package:food_user_app/features/address/data/datasources/address_remote_data_source.dart';
import 'package:food_user_app/features/address/data/repositories/address_repository_impl.dart';
import 'package:food_user_app/features/address/domain/repositories/address_repository.dart';
import 'package:food_user_app/features/home/data/datasources/banner_remote_data_source.dart';
import 'package:food_user_app/features/home/data/repositories/banner_repository_impl.dart';
import 'package:food_user_app/features/home/domain/repositories/banner_repository.dart';
import 'package:food_user_app/features/home/presentation/cubit/banner_cubit.dart';
import 'package:food_user_app/features/search/data/datasources/search_remote_data_source.dart';
import 'package:food_user_app/features/search/data/repositories/search_repository_impl.dart';
import 'package:food_user_app/features/search/domain/repositories/search_repository.dart';
import 'package:food_user_app/features/search/presentation/cubit/search_cubit.dart';
import 'package:food_user_app/features/restaurant/data/datasources/restaurant_remote_data_source.dart';
import 'package:food_user_app/features/restaurant/data/repositories/restaurant_repository_impl.dart';
import 'package:food_user_app/features/restaurant/domain/repositories/restaurant_repository.dart';
import 'package:food_user_app/features/restaurant/domain/usecases/get_restaurants_by_category_usecase.dart';
import 'package:food_user_app/features/restaurant/domain/usecases/get_restaurant_detail_usecase.dart';
import 'package:food_user_app/features/restaurant/presentation/cubit/restaurant_list_cubit.dart';
import 'package:food_user_app/features/restaurant/presentation/cubit/restaurant_detail_cubit.dart';

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
  // Unified phone login/register (API v2)
  sl.registerLazySingleton(() => SendPhoneOtpUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(() => VerifyPhoneOtpUseCase(sl<AuthRepository>()));
  sl.registerLazySingleton(
    () => CompleteRegistrationUseCase(sl<AuthRepository>()),
  );

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
      sendPhoneOtpUseCase: sl<SendPhoneOtpUseCase>(),
      verifyPhoneOtpUseCase: sl<VerifyPhoneOtpUseCase>(),
      completeRegistrationUseCase: sl<CompleteRegistrationUseCase>(),
      authRepository: sl<AuthRepository>(),
    ),
  );

  sl.registerFactory<ProfileBloc>(
    () => ProfileBloc(userRepository: sl<UserRepository>()),
  );

  // ── Saved addresses ───────────────────────────────────────────────────────
  sl.registerLazySingleton<AddressRemoteDataSource>(
    () => AddressRemoteDataSourceImpl(dio: sl<DioClient>().dio),
  );
  sl.registerLazySingleton<AddressRepository>(
    () => AddressRepositoryImpl(remoteDataSource: sl<AddressRemoteDataSource>()),
  );
  sl.registerLazySingleton<SavedAddressesRepository>(
    () => SavedAddressesRepositoryImpl(
      addressRepository: sl<AddressRepository>(),
    ),
  );

  // ── User Profile & Settings ────────────────────────────────────────────────
  sl.registerLazySingleton<UserRemoteDataSource>(
    () => UserRemoteDataSourceImpl(dio: sl<DioClient>().dio),
  );
  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(remoteDataSource: sl<UserRemoteDataSource>()),
  );

  // ── Banners & Search ───────────────────────────────────────────────────────
  sl.registerLazySingleton<BannerRemoteDataSource>(
    () => BannerRemoteDataSourceImpl(dio: sl<DioClient>().dio),
  );
  sl.registerLazySingleton<BannerRepository>(
    () => BannerRepositoryImpl(remoteDataSource: sl<BannerRemoteDataSource>()),
  );
  sl.registerFactory<BannerCubit>(
    () => BannerCubit(bannerRepository: sl<BannerRepository>()),
  );

  sl.registerLazySingleton<SearchRemoteDataSource>(
    () => SearchRemoteDataSourceImpl(dio: sl<DioClient>().dio),
  );
  sl.registerLazySingleton<SearchRepository>(
    () => SearchRepositoryImpl(remoteDataSource: sl<SearchRemoteDataSource>()),
  );
  sl.registerFactory<SearchCubit>(
    () => SearchCubit(searchRepository: sl<SearchRepository>()),
  );

  // ── Restaurants ────────────────────────────────────────────────────────────
  sl.registerLazySingleton<RestaurantRemoteDataSource>(
    () => RestaurantRemoteDataSourceImpl(dio: sl<DioClient>().dio),
  );
  sl.registerLazySingleton<RestaurantRepository>(
    () => RestaurantRepositoryImpl(
      remoteDataSource: sl<RestaurantRemoteDataSource>(),
    ),
  );
  sl.registerLazySingleton(
    () => GetRestaurantsByCategoryUseCase(
      repository: sl<RestaurantRepository>(),
    ),
  );
  sl.registerLazySingleton(
    () => GetRestaurantDetailUseCase(
      repository: sl<RestaurantRepository>(),
    ),
  );
  sl.registerFactory<RestaurantListCubit>(
    () => RestaurantListCubit(
      restaurantRepository: sl<RestaurantRepository>(),
    ),
  );
  sl.registerFactory<RestaurantDetailCubit>(
    () => RestaurantDetailCubit(
      restaurantRepository: sl<RestaurantRepository>(),
    ),
  );
}
