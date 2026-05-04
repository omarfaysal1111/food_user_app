import 'package:dio/dio.dart';

class AuthInterceptor extends Interceptor {
  // TODO: inject token storage and attach Bearer token
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    super.onRequest(options, handler);
  }
}
