import 'package:dio/dio.dart';

class RetryInterceptor extends Interceptor {
  final Dio dio;
  RetryInterceptor({required this.dio});
  // TODO: implement exponential back-off retry logic
}
