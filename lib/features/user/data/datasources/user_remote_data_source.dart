import 'package:dio/dio.dart';
import 'package:food_user_app/core/constants/api_endpoints.dart';
import 'package:food_user_app/core/network/dio_error_mapper.dart';
import 'package:food_user_app/features/user/data/models/update_user_profile_request.dart';
import 'package:food_user_app/features/user/data/models/update_user_settings_request.dart';
import 'package:food_user_app/features/user/data/models/user_profile_dto.dart';
import 'package:food_user_app/features/user/data/models/user_settings_dto.dart';

abstract class UserRemoteDataSource {
  Future<UserProfileDto> getProfile();

  Future<UserProfileDto> updateProfile(UpdateUserProfileRequest request);

  Future<UserSettingsDto> getSettings();

  Future<UserSettingsDto> updateSettings(UpdateUserSettingsRequest request);

  Future<void> deleteAccount();
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio _dio;

  UserRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<UserProfileDto> getProfile() async {
    try {
      final response = await _dio.get<dynamic>(ApiEndpoints.userProfile);
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        throw const FormatException('Invalid JSON response');
      }
      return UserProfileDto.fromJson(raw);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<UserProfileDto> updateProfile(UpdateUserProfileRequest request) async {
    try {
      final response = await _dio.put<dynamic>(
        ApiEndpoints.userProfile,
        data: request.toJson(),
      );
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        throw const FormatException('Invalid JSON response');
      }
      return UserProfileDto.fromJson(raw);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<UserSettingsDto> getSettings() async {
    try {
      final response = await _dio.get<dynamic>(ApiEndpoints.userSettings);
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        throw const FormatException('Invalid JSON response');
      }
      return UserSettingsDto.fromJson(raw);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<UserSettingsDto> updateSettings(
    UpdateUserSettingsRequest request,
  ) async {
    try {
      final response = await _dio.put<dynamic>(
        ApiEndpoints.userSettings,
        data: request.toJson(),
      );
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        throw const FormatException('Invalid JSON response');
      }
      return UserSettingsDto.fromJson(raw);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<void> deleteAccount() async {
    try {
      await _dio.delete<dynamic>(ApiEndpoints.user);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }
}
