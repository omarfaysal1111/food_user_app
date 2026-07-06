import 'package:dio/dio.dart';
import 'package:food_user_app/core/constants/api_endpoints.dart';
import 'package:food_user_app/core/network/dio_error_mapper.dart';
import 'package:food_user_app/features/address/data/models/address_dto.dart';
import 'package:food_user_app/features/address/data/models/create_address_request.dart';

abstract class AddressRemoteDataSource {
  Future<List<AddressDto>> getAddresses();

  Future<AddressDto> createAddress(CreateAddressRequest request);

  Future<AddressDto> updateAddress({
    required String id,
    required CreateAddressRequest request,
  });

  Future<void> deleteAddress(String id);

  Future<AddressDto> setDefaultAddress(String id);
}

class AddressRemoteDataSourceImpl implements AddressRemoteDataSource {
  final Dio _dio;

  AddressRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<AddressDto>> getAddresses() async {
    try {
      final response = await _dio.get<dynamic>(ApiEndpoints.userAddresses);
      final raw = response.data;
      if (raw is! List) {
        throw const FormatException('Invalid JSON response: expected list');
      }
      return raw
          .map((json) => AddressDto.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<AddressDto> createAddress(CreateAddressRequest request) async {
    try {
      final response = await _dio.post<dynamic>(
        ApiEndpoints.userAddresses,
        data: request.toJson(),
      );
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        throw const FormatException('Invalid JSON response: expected object');
      }
      return AddressDto.fromJson(raw);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<AddressDto> updateAddress({
    required String id,
    required CreateAddressRequest request,
  }) async {
    try {
      final response = await _dio.put<dynamic>(
        ApiEndpoints.userAddress(id),
        data: request.toJson(),
      );
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        throw const FormatException('Invalid JSON response: expected object');
      }
      return AddressDto.fromJson(raw);
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
  Future<AddressDto> setDefaultAddress(String id) async {
    try {
      final response = await _dio.patch<dynamic>(
        ApiEndpoints.userAddressDefault(id),
      );
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        throw const FormatException('Invalid JSON response: expected object');
      }
      return AddressDto.fromJson(raw);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }
}
