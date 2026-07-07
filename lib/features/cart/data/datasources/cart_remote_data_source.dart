import 'package:dio/dio.dart';
import 'package:food_user_app/core/constants/api_endpoints.dart';
import 'package:food_user_app/core/network/dio_error_mapper.dart';
import 'package:food_user_app/features/cart/data/models/cart_dto.dart';
import 'package:food_user_app/features/cart/data/models/promo_preview_response_dto.dart';

abstract class CartRemoteDataSource {
  Future<CartDto> getCart();
  Future<CartDto> addToCart({
    required String menuItemId,
    required int quantity,
    List<Map<String, dynamic>>? selectedModifiers,
    String? notes,
  });
  Future<CartDto> updateCartItem({
    required String itemId,
    required int quantity,
  });
  Future<CartDto> removeFromCart(String itemId);
  Future<void> clearCart();
  Future<PromoPreviewResponseDto> applyPromo({
    required String code,
    required double subtotal,
  });
}

class CartRemoteDataSourceImpl implements CartRemoteDataSource {
  final Dio _dio;

  CartRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<CartDto> getCart() async {
    try {
      final response = await _dio.get<dynamic>(ApiEndpoints.userCart);
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        throw const FormatException('Expected cart object');
      }
      return CartDto.fromJson(raw);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<CartDto> addToCart({
    required String menuItemId,
    required int quantity,
    List<Map<String, dynamic>>? selectedModifiers,
    String? notes,
  }) async {
    try {
      final data = <String, dynamic>{
        'menuItemId': menuItemId,
        'quantity': quantity,
      };
      if (selectedModifiers != null) {
        data['selectedModifiers'] = selectedModifiers;
      }
      if (notes != null) {
        data['notes'] = notes;
      }
      final response = await _dio.post<dynamic>(
        ApiEndpoints.userCartItems,
        data: data,
      );
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        throw const FormatException('Expected cart object');
      }
      return CartDto.fromJson(raw);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<CartDto> updateCartItem({
    required String itemId,
    required int quantity,
  }) async {
    try {
      final response = await _dio.put<dynamic>(
        ApiEndpoints.userCartItem(itemId),
        queryParameters: {'quantity': quantity},
      );
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        throw const FormatException('Expected cart object');
      }
      return CartDto.fromJson(raw);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<CartDto> removeFromCart(String itemId) async {
    try {
      final response = await _dio.delete<dynamic>(
        ApiEndpoints.userCartItem(itemId),
      );
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        throw const FormatException('Expected cart object');
      }
      return CartDto.fromJson(raw);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<void> clearCart() async {
    try {
      await _dio.delete<dynamic>(ApiEndpoints.userCart);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }

  @override
  Future<PromoPreviewResponseDto> applyPromo({
    required String code,
    required double subtotal,
  }) async {
    try {
      final response = await _dio.post<dynamic>(
        ApiEndpoints.applyPromo,
        data: {
          'code': code,
          'subtotal': subtotal,
        },
      );
      final raw = response.data;
      if (raw is! Map<String, dynamic>) {
        throw const FormatException('Expected promo preview response object');
      }
      return PromoPreviewResponseDto.fromJson(raw);
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }
}
