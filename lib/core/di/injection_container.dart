import 'package:get_it/get_it.dart';
import 'package:food_user_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:food_user_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:food_user_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:food_user_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:food_user_app/features/auth/presentation/bloc/auth_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // TODO: Re-enable DioClient registration when backend APIs are ready.
  // sl.registerLazySingleton(() => DioClient());

  sl.registerLazySingleton<AuthRemoteDataSource>(
    // TODO: Inject DioClient into AuthRemoteDataSourceImpl for real API calls.
    () => AuthRemoteDataSourceImpl(),
  );

  sl.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(remoteDataSource: sl()),
  );

  sl.registerLazySingleton(() => LoginUseCase(sl()));

  sl.registerFactory(() => AuthBloc(loginUseCase: sl()));
}
