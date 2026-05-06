import 'package:dartz/dartz.dart';
import 'package:food_user_app/core/errors/exceptions.dart';
import 'package:food_user_app/core/errors/failures.dart';
import 'package:food_user_app/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:food_user_app/features/auth/domain/entities/user.dart';
import '../../domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<Failure, User>> login({
    required String email,
    required String password,
  }) async {
    try {
      final user = await remoteDataSource.login(email: email, password: password);
      return Right(user);
    } on AuthException catch (error) {
      return Left(AuthFailure(error.message));
    } on ServerException catch (error) {
      return Left(ServerFailure(error.message));
    }
  }
}
