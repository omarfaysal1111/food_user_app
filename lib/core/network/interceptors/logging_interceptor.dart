import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

/// Debug-only request/response logger.
///
/// Sensitive data is redacted:
///   - `Authorization` header is never printed.
///   - `password` / `newPassword` / `confirmPassword` fields are masked.
class LoggingInterceptor extends Interceptor {
  static const _maxResponseBodyLogLength = 4000;

  static const _sensitiveBodyKeys = {
    'password',
    'newPassword',
    'confirmPassword',
    'currentPassword',
    'refreshToken',
    'accessToken',
    'access_token',
    'firebase_id_token',
    'otp',
  };

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint('[HTTP →] ${options.method} ${options.uri}');
      final body = _redactBody(options.data);
      if (body != null) {
        debugPrint('[HTTP →] body: $body');
      }
    }
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint(
        '[HTTP ←] ${response.statusCode} ${response.requestOptions.method} '
        '${response.requestOptions.uri}',
      );
      if (response.data != null) {
        debugPrint('[HTTP ← body] ${_stringifyResponseBody(response.data)}');
      }
    }
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (kDebugMode) {
      debugPrint(
        '[HTTP ✗] ${err.response?.statusCode ?? '-'} '
        '${err.requestOptions.method} ${err.requestOptions.uri} '
        '| ${err.type} | ${err.message ?? ''}',
      );
    }
    super.onError(err, handler);
  }

  String _stringifyResponseBody(dynamic data) {
    final text = data.toString();
    if (text.length <= _maxResponseBodyLogLength) {
      return text;
    }
    return '${text.substring(0, _maxResponseBodyLogLength)}... '
        '[truncated ${text.length - _maxResponseBodyLogLength} chars]';
  }

  Object? _redactBody(dynamic data) {
    if (data is Map) {
      final redacted = <String, dynamic>{};
      data.forEach((key, value) {
        if (_sensitiveBodyKeys.contains(key.toString())) {
          redacted[key.toString()] = '***';
        } else {
          redacted[key.toString()] = value;
        }
      });
      return redacted;
    }
    return data;
  }
}
