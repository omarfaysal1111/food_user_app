import 'dart:async';
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:food_user_app/core/constants/api_endpoints.dart';
import 'package:food_user_app/core/network/interceptors/auth_interceptor.dart';
import 'package:food_user_app/core/storage/token_storage.dart';
import 'package:mocktail/mocktail.dart';

class _MockTokenStorage extends Mock implements TokenStorage {}

class _CapturingAdapter implements HttpClientAdapter {
  RequestOptions? capturedOptions;

  @override
  void close({bool force = false}) {}

  @override
  Future<ResponseBody> fetch(
    RequestOptions options,
    Stream<Uint8List>? requestStream,
    Future<void>? cancelFuture,
  ) async {
    capturedOptions = options;
    return ResponseBody.fromString('{}', 200);
  }
}

void main() {
  group('AuthInterceptor', () {
    test('attaches Bearer token to POST /user/addresses', () async {
      final tokenStorage = _MockTokenStorage();
      when(
        tokenStorage.getAccessToken,
      ).thenAnswer((_) async => 'test-access-token');
      final adapter = _CapturingAdapter();
      final dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl))
        ..interceptors.add(AuthInterceptor(tokenStorage))
        ..httpClientAdapter = adapter;

      await dio.post<dynamic>(ApiEndpoints.userAddresses, data: {});

      final authorization = adapter.capturedOptions?.headers['Authorization']
          ?.toString();
      expect(authorization, 'Bearer test-access-token');
      expect(authorization?.startsWith('Bearer '), isTrue);
    });

    test('does not double-prefix a token already stored with Bearer', () async {
      final tokenStorage = _MockTokenStorage();
      when(
        tokenStorage.getAccessToken,
      ).thenAnswer((_) async => 'Bearer test-access-token');
      final adapter = _CapturingAdapter();
      final dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl))
        ..interceptors.add(AuthInterceptor(tokenStorage))
        ..httpClientAdapter = adapter;

      await dio.post<dynamic>(ApiEndpoints.userAddresses, data: {});

      expect(
        adapter.capturedOptions?.headers['Authorization'],
        'Bearer test-access-token',
      );
    });

    test('skips Authorization for auth requests', () async {
      final tokenStorage = _MockTokenStorage();
      when(
        tokenStorage.getAccessToken,
      ).thenAnswer((_) async => 'test-access-token');
      final adapter = _CapturingAdapter();
      final dio = Dio(BaseOptions(baseUrl: ApiEndpoints.baseUrl))
        ..interceptors.add(AuthInterceptor(tokenStorage))
        ..httpClientAdapter = adapter;

      await dio.post<dynamic>(ApiEndpoints.login, data: {});

      expect(adapter.capturedOptions?.headers['Authorization'], isNull);
    });
  });
}
