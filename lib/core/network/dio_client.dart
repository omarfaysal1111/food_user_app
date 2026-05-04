import 'package:dio/dio.dart';
import '../constants/api_endpoints.dart';
import 'interceptors/auth_interceptor.dart';
import 'interceptors/logging_interceptor.dart';
import 'interceptors/retry_interceptor.dart';

class DioClient {
  late final Dio _dio;

  DioClient() {
    _dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        headers: {'Content-Type': 'application/json'},
      ),
    )
      ..interceptors.add(AuthInterceptor())
      ..interceptors.add(LoggingInterceptor())
      ..interceptors.add(RetryInterceptor(dio: _dio));
  }

  Dio get dio => _dio;
}
