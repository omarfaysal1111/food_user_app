import 'package:dio/dio.dart';
import 'package:food_user_app/core/constants/api_endpoints.dart';
import 'package:food_user_app/core/network/dio_error_mapper.dart';
import 'package:food_user_app/features/restaurant/data/models/menu_category_dto.dart';
import 'package:food_user_app/features/restaurant/data/models/item_modifier_dto.dart';

abstract class MenuRemoteDataSource {
  Future<List<MenuCategoryDto>> getRestaurantMenu(String restaurantId);
  Future<List<MenuCategoryDto>> getBranchMenu(String branchId);
  Future<List<ItemModifierDto>> getItemModifiers(String itemId);
}

class MenuRemoteDataSourceImpl implements MenuRemoteDataSource {
  final Dio _dio;

  MenuRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<MenuCategoryDto>> getRestaurantMenu(String restaurantId) async {
    try {
      final response = await _dio.get<dynamic>(
        ApiEndpoints.restaurantMenu(restaurantId),
      );
      final raw = response.data;
      if (raw is! List) {
        throw const FormatException('Expected a list of menu categories');
      }
      return raw
          .map((json) => MenuCategoryDto.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<List<MenuCategoryDto>> getBranchMenu(String branchId) async {
    try {
      final response = await _dio.get<dynamic>(
        ApiEndpoints.branchMenu(branchId),
      );
      final raw = response.data;
      if (raw is! List) {
        throw const FormatException('Expected a list of menu categories');
      }
      return raw
          .map((json) => MenuCategoryDto.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<List<ItemModifierDto>> getItemModifiers(String itemId) async {
    try {
      final response = await _dio.get<dynamic>(
        ApiEndpoints.itemModifiers(itemId),
      );
      final raw = response.data;
      if (raw is! List) {
        throw const FormatException('Expected a list of item modifiers');
      }
      return raw
          .map((json) => ItemModifierDto.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }
}
