import 'package:dio/dio.dart';
import 'package:food_user_app/core/constants/api_endpoints.dart';
import 'package:food_user_app/core/network/dio_error_mapper.dart';
import 'package:food_user_app/features/home/data/models/banner_dto.dart';

abstract class BannerRemoteDataSource {
  Future<List<BannerDto>> getActiveBanners();
}

class BannerRemoteDataSourceImpl implements BannerRemoteDataSource {
  final Dio _dio;

  BannerRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<List<BannerDto>> getActiveBanners() async {
    try {
      final response = await _dio.get<dynamic>(ApiEndpoints.banners);
      final raw = response.data;
      if (raw is! List) {
        throw const FormatException('Expected list of banners');
      }
      return raw
          .map((json) => BannerDto.fromJson(json as Map<String, dynamic>))
          .toList();
    } on DioException catch (e) {
      throw DioErrorMapper.map(e);
    }
  }
}
