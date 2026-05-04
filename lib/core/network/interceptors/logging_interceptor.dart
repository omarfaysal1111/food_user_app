import 'package:dio/dio.dart';

class LoggingInterceptor extends Interceptor {
  // TODO: pretty-print request / response in debug mode
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
  }
}
