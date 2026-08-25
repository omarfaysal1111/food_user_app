import 'package:dio/dio.dart';
import 'package:food_user_app/core/constants/api_endpoints.dart';
import 'package:food_user_app/core/network/dio_error_mapper.dart';
import 'package:food_user_app/features/home/data/models/banner_model.dart';

abstract class BannerRemoteDataSource {
  /// `GET /api/v1/banners` — returns active banners from unified envelope.
  Future<List<BannerModel>> getActiveBanners();
}

class BannerRemoteDataSourceImpl implements BannerRemoteDataSource {
  final Dio _dio;

  BannerRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<BannerModel>> getActiveBanners() async {
    try {
      final response = await _dio.get<dynamic>(ApiEndpoints.banners);
      final raw = response.data;

      // New unified envelope: { status, msg, data: [...] }
      List<dynamic>? list;
      if (raw is Map<String, dynamic>) {
        final data = raw['data'];
        if (data is List) list = data;
      } else if (raw is List) {
        // Fallback: raw list (legacy shape)
        list = raw;
      }

      if (list == null) return [];
      return list
          .whereType<Map<String, dynamic>>()
          .map(BannerModel.fromJson)
          .toList();
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }
}
