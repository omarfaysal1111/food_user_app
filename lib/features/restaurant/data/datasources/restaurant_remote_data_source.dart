import 'package:dio/dio.dart';
import 'package:food_user_app/core/constants/api_endpoints.dart';
import 'package:food_user_app/core/network/dio_error_mapper.dart';
import 'package:food_user_app/features/restaurant/data/models/branch_dto.dart';
import 'package:food_user_app/features/restaurant/data/models/offer_dto.dart';
import 'package:food_user_app/features/restaurant/data/models/page_response_restaurant_dto.dart';
import 'package:food_user_app/features/restaurant/data/models/restaurant_dto.dart';

abstract class RestaurantRemoteDataSource {
  Future<PageResponseRestaurantDto> getRestaurants({
    int page = 0,
    int size = 20,
    String? categoryId,
  });

  Future<RestaurantDto> getRestaurantDetail(String id);

  Future<List<BranchDto>> getBranches(String restaurantId);

  Future<List<OfferDto>> getOffers(String restaurantId);

  Future<PageResponseRestaurantDto> getTopRated({int page = 0, int size = 20});

  Future<PageResponseRestaurantDto> getMostOrdered({
    int page = 0,
    int size = 20,
  });

  Future<PageResponseRestaurantDto> getWithOffers({
    int page = 0,
    int size = 20,
  });

  Future<List<RestaurantDto>> getFavorites();

  Future<void> addFavorite(String id);

  Future<void> removeFavorite(String id);
}

class RestaurantRemoteDataSourceImpl implements RestaurantRemoteDataSource {
  final Dio _dio;

  RestaurantRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<PageResponseRestaurantDto> getRestaurants({
    int page = 0,
    int size = 20,
    String? categoryId,
  }) async {
    try {
      final queryParams = <String, dynamic>{'page': page, 'size': size};
      if (categoryId != null && categoryId.isNotEmpty) {
        queryParams['categoryId'] = categoryId;
      }
      final response = await _dio.get<dynamic>(
        ApiEndpoints.restaurants,
        queryParameters: queryParams,
      );
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        throw const FormatException('Expected paginated response');
      }
      return PageResponseRestaurantDto.fromJson(raw);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<RestaurantDto> getRestaurantDetail(String id) async {
    try {
      final response = await _dio.get<dynamic>(
        ApiEndpoints.restaurantDetails(id),
      );
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        throw const FormatException('Expected restaurant object');
      }
      return RestaurantDto.fromJson(raw);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<List<BranchDto>> getBranches(String restaurantId) async {
    try {
      final response = await _dio.get<dynamic>(
        ApiEndpoints.restaurantBranches(restaurantId),
      );
      final raw = response.data;
      if (raw is! List) {
        throw const FormatException('Expected list of branches');
      }
      return raw
          .map((json) => BranchDto.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<List<OfferDto>> getOffers(String restaurantId) async {
    try {
      final response = await _dio.get<dynamic>(
        ApiEndpoints.restaurantOffers(restaurantId),
      );
      final raw = response.data;
      if (raw is! List) {
        throw const FormatException('Expected list of offers');
      }
      return raw
          .map((json) => OfferDto.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<PageResponseRestaurantDto> getTopRated({
    int page = 0,
    int size = 20,
  }) async {
    try {
      final response = await _dio.get<dynamic>(
        ApiEndpoints.topRated,
        queryParameters: {'page': page, 'size': size},
      );
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        throw const FormatException('Expected paginated response');
      }
      return PageResponseRestaurantDto.fromJson(raw);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<PageResponseRestaurantDto> getMostOrdered({
    int page = 0,
    int size = 20,
  }) async {
    try {
      final response = await _dio.get<dynamic>(
        ApiEndpoints.mostOrdered,
        queryParameters: {'page': page, 'size': size},
      );
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        throw const FormatException('Expected paginated response');
      }
      return PageResponseRestaurantDto.fromJson(raw);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<PageResponseRestaurantDto> getWithOffers({
    int page = 0,
    int size = 20,
  }) async {
    try {
      final response = await _dio.get<dynamic>(
        ApiEndpoints.withOffers,
        queryParameters: {'page': page, 'size': size},
      );
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        throw const FormatException('Expected paginated response');
      }
      return PageResponseRestaurantDto.fromJson(raw);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<List<RestaurantDto>> getFavorites() async {
    try {
      final response = await _dio.get<dynamic>(ApiEndpoints.favorites);
      final raw = response.data;
      if (raw is! List) {
        throw const FormatException('Expected list of favorite restaurants');
      }
      return raw
          .map((json) => RestaurantDto.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<void> addFavorite(String id) async {
    try {
      await _dio.post<dynamic>(ApiEndpoints.toggleFavorite(id));
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<void> removeFavorite(String id) async {
    try {
      await _dio.delete<dynamic>(ApiEndpoints.toggleFavorite(id));
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }
}
