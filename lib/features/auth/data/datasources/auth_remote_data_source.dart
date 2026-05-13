import 'package:dio/dio.dart';

import 'package:food_user_app/core/constants/api_endpoints.dart';
import 'package:food_user_app/core/network/dio_error_mapper.dart';
import 'package:food_user_app/core/errors/exceptions.dart';
import 'package:food_user_app/features/auth/data/models/auth_response_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  });

  Future<AuthResponseModel> register({
    required String name,
    required String email,
    required String password,
    String role,
  });

  /// `Authorization: Bearer` is attached by [AuthInterceptor]; do not set it
  /// here. Body must include the refresh token per API contract.
  Future<void> logout({required String refreshToken});
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  AuthRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  final Dio _dio;

  @override
  Future<AuthResponseModel> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        ApiEndpoints.login,
        data: <String, dynamic>{
          'email': email,
          'password': password,
        },
      );
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        throw const ServerException('Invalid response');
      }
      return AuthResponseModel.fromJson(raw);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<AuthResponseModel> register({
    required String name,
    required String email,
    required String password,
    String role = 'ROLE_CUSTOMER',
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        ApiEndpoints.register,
        data: <String, dynamic>{
          'name': name,
          'email': email,
          'password': password,
          'role': role,
        },
      );
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        throw const ServerException('Invalid response');
      }
      return AuthResponseModel.fromJson(raw);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<void> logout({required String refreshToken}) async {
    try {
      await _dio.post<dynamic>(
        ApiEndpoints.logout,
        data: <String, dynamic>{'refreshToken': refreshToken},
      );
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }
}
