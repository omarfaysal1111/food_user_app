import 'package:dio/dio.dart';
import 'package:food_user_app/core/constants/api_endpoints.dart';
import 'package:food_user_app/core/network/dio_error_mapper.dart';
import 'package:food_user_app/features/search/data/models/search_result_dto.dart';

abstract class SearchRemoteDataSource {
  Future<SearchResultDto> search(String query);

  Future<List<String>> getSearchHistory();
}

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final Dio _dio;

  SearchRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<SearchResultDto> search(String query) async {
    try {
      final response = await _dio.get<dynamic>(
        ApiEndpoints.search,
        queryParameters: {'q': query},
      );
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        throw const FormatException('Expected JSON object for search results');
      }
      return SearchResultDto.fromJson(raw);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<List<String>> getSearchHistory() async {
    try {
      final response = await _dio.get<dynamic>(ApiEndpoints.searchHistory);
      final raw = response.data;
      if (raw is! List) {
        throw const FormatException(
          'Expected list of strings for search history',
        );
      }
      return raw.map((e) => e.toString()).toList();
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }
}
