import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:food_user_app/core/constants/api_endpoints.dart';
import 'package:food_user_app/core/errors/exceptions.dart';
import 'package:food_user_app/core/network/dio_error_mapper.dart';
import 'package:food_user_app/core/storage/token_storage.dart';
import 'package:food_user_app/features/profile/data/models/saved_address_dto.dart';

abstract class SavedAddressesRemoteDataSource {
  Future<List<SavedAddressDto>> getAddresses();

  Future<SavedAddressDto> createAddress(SavedAddressRequest request);

  Future<SavedAddressDto> updateAddress({
    required String id,
    required SavedAddressRequest request,
  });

  Future<void> deleteAddress(String id);

  Future<void> setDefaultAddress(String id);
}

class SavedAddressesRemoteDataSourceImpl
    implements SavedAddressesRemoteDataSource {
  const SavedAddressesRemoteDataSourceImpl({
    required Dio dio,
    required TokenStorage tokenStorage,
  }) : _dio = dio,
       _tokenStorage = tokenStorage;

  final Dio _dio;
  final TokenStorage _tokenStorage;

  @override
  Future<List<SavedAddressDto>> getAddresses() async {
    try {
      final response = await _dio.get<dynamic>(ApiEndpoints.userAddresses);
      final raw = response.data;
      final list = _extractList(raw);
      return [
        for (final item in list)
          if (item is Map<String, dynamic>) SavedAddressDto.fromJson(item),
      ].where((address) => address.id.isNotEmpty).toList(growable: false);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<SavedAddressDto> createAddress(SavedAddressRequest request) async {
    final requestBody = request.toJson();
    final endpointUrl = _endpointUrl(ApiEndpoints.userAddresses);
    try {
      final accessToken = await _tokenStorage.getAccessToken();
      _logAddressDebug('ADD_ADDRESS_API_REQUEST');
      _logAddressDebug('URL=$endpointUrl');
      _logAddressDebug('method=POST');
      _logAddressDebug('body=${_toJsonLog(requestBody)}');
      _logAddressDebug(
        'accessTokenExists=${accessToken != null && accessToken.isNotEmpty}',
      );
      final response = await _dio.post<dynamic>(
        ApiEndpoints.userAddresses,
        data: requestBody,
      );
      _logAddressDebug('ADD_ADDRESS_API_SUCCESS');
      _logAddressDebug('statusCode=${response.statusCode}');
      _logAddressDebug('responseBody=${_toJsonLog(response.data)}');
      return _parseAddress(response.data);
    } on DioException catch (e) {
      _logAddressDebug('ADD_ADDRESS_API_ERROR');
      _logAddressDebug('statusCode=${e.response?.statusCode}');
      _logAddressDebug('responseData=${_toJsonLog(e.response?.data)}');
      _logAddressDebug(
        'responseHeaders=${_toJsonLog(e.response?.headers.map)}',
      );
      _logAddressDebug('dioType=${e.type}');
      _logAddressDebug('dioMessage=${e.message}');
      _logAddressDebug('requestBody=${_toJsonLog(requestBody)}');
      _logAddressDebug('endpointUrl=${e.requestOptions.uri}');
      throw DioErrorMapper.map(e);
    } catch (error, stackTrace) {
      _logAddressDebug('ADD_ADDRESS_UNKNOWN_ERROR');
      _logAddressDebug('error=$error');
      _logAddressDebug('stackTrace=$stackTrace');
      rethrow;
    }
  }

  @override
  Future<SavedAddressDto> updateAddress({
    required String id,
    required SavedAddressRequest request,
  }) async {
    try {
      final response = await _dio.put<dynamic>(
        ApiEndpoints.userAddress(id),
        data: request.toJson(),
      );
      return _parseAddress(response.data);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<void> deleteAddress(String id) async {
    try {
      await _dio.delete<dynamic>(ApiEndpoints.userAddress(id));
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<void> setDefaultAddress(String id) async {
    try {
      await _dio.patch<dynamic>(ApiEndpoints.userAddressDefault(id));
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  static List<dynamic> _extractList(dynamic raw) {
    if (raw is List) return raw;
    if (raw is Map<String, dynamic>) {
      final data = raw['data'];
      if (data is List) return data;
      final addresses = raw['addresses'];
      if (addresses is List) return addresses;
      final content = raw['content'];
      if (content is List) return content;
    }
    return const [];
  }

  static SavedAddressDto _parseAddress(dynamic raw) {
    if (raw is Map<String, dynamic>) {
      final data = raw['data'];
      if (data is Map<String, dynamic>) return SavedAddressDto.fromJson(data);
      return SavedAddressDto.fromJson(raw);
    }
    throw const ServerException('Invalid address response');
  }

  String _endpointUrl(String path) {
    final baseUrl = _dio.options.baseUrl;
    if (path.startsWith('http')) return path;
    if (baseUrl.endsWith('/') && path.startsWith('/')) {
      return '${baseUrl.substring(0, baseUrl.length - 1)}$path';
    }
    if (!baseUrl.endsWith('/') && !path.startsWith('/')) {
      return '$baseUrl/$path';
    }
    return '$baseUrl$path';
  }
}

void _logAddressDebug(String message) {
  if (kDebugMode) {
    debugPrint('[ADDRESS_DEBUG] $message');
  }
}

String _toJsonLog(dynamic value) {
  try {
    return jsonEncode(value);
  } catch (_) {
    return value.toString();
  }
}
