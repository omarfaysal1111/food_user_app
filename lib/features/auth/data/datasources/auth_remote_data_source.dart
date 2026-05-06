import 'package:food_user_app/features/auth/data/models/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<UserModel> login({
    required String email,
    required String password,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl();

  @override
  Future<UserModel> login({
    required String email,
    required String password,
  }) async {
    // TODO: Replace mock auth flow with real API via DioClient.
    await Future<void>.delayed(const Duration(seconds: 1));
    return UserModel(
      id: 'mock-user-id',
      name: 'Mock User',
      token: 'mock-token',
    );
  }
}
