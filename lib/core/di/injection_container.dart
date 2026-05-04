import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // TODO: register datasources, repositories, use-cases, blocs/cubits
  // Example pattern:
  //   sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));
  //   sl.registerFactory(() => AuthBloc(loginUseCase: sl()));
}
