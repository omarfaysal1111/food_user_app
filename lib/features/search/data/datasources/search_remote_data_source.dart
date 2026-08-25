import 'package:dio/dio.dart';
import 'package:food_user_app/core/constants/api_endpoints.dart';
import 'package:food_user_app/core/network/dio_error_mapper.dart';
import 'package:food_user_app/features/search/data/models/search_result_dto.dart';

import 'package:food_user_app/features/search/domain/entities/search_log.dart';

abstract class SearchRemoteDataSource {
  Future<SearchResultDto> search(String query);
  Future<List<SearchLog>> getSearchHistory();
  Future<SearchLog> addSearchLog(String term);
  Future<void> deleteSearchLog(int id);
  Future<void> clearSearchLogs();
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final Dio _dio;

  SearchRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<SearchResultDto> search(String query) async {
    try {
      final response = await _dio.get<dynamic>(
        ApiEndpoints.stores, // Map legacy search to the stores endpoint
        queryParameters: {
          'search': query,
          'section_id': 1, // Defaulting to 1 to satisfy required param since search maps to Restaurant domain
        },
      );
      final raw = response.data;
      if (raw is! Map<String, dynamic> || !raw.containsKey('data')) {
        throw const FormatException('Expected unified envelope with data object');
      }
      final data = raw['data'] as Map<String, dynamic>;
      return SearchResultDto.fromJson(data);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<List<SearchLog>> getSearchHistory() async {
    try {
      final response = await _dio.get<dynamic>(ApiEndpoints.userSearchLogsAll);
      final raw = response.data;
      if (raw is! Map<String, dynamic> || !raw.containsKey('data')) {
        throw const FormatException('Expected unified envelope');
      }
      final data = raw['data'] as List<dynamic>? ?? [];
      return data.map((e) => SearchLog.fromJson(e as Map<String, dynamic>)).toList();
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<SearchLog> addSearchLog(String term) async {
    try {
      final response = await _dio.post<dynamic>(
        ApiEndpoints.userSearchLogsCreate,
        data: {'term': term},
      );
      final raw = response.data;
      if (raw is! Map<String, dynamic> || !raw.containsKey('data')) {
        throw const FormatException('Expected unified envelope');
      }
      return SearchLog.fromJson(raw['data'] as Map<String, dynamic>);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<void> deleteSearchLog(int id) async {
    try {
      await _dio.delete<dynamic>(
        ApiEndpoints.userSearchLogsDelete,
        queryParameters: {'id': id},
      );
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<void> clearSearchLogs() async {
    try {
      await _dio.delete<dynamic>(ApiEndpoints.userSearchLogsClear);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }
}
