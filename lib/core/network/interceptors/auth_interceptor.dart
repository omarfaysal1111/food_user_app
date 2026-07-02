import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../constants/api_endpoints.dart';
import '../../storage/token_storage.dart';

/// Attaches `Authorization: Bearer <token>` to outgoing requests, except for
/// public auth endpoints listed in [ApiEndpoints.publicAuthPaths].
///
/// 401 refresh-token retry flow is intentionally NOT implemented in Phase 1.
class AuthInterceptor extends Interceptor {
  AuthInterceptor(this._tokenStorage);

  final TokenStorage _tokenStorage;

  bool _isPublicAuthPath(String path) {
    for (final publicPath in ApiEndpoints.publicAuthPaths) {
      if (path == publicPath || path.endsWith(publicPath)) {
        return true;
      }
    }
    return false;
  }

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final path = options.uri.path;
    final isAuthRequest =
        _isPublicAuthPath(path) || _isPublicAuthPath(options.path);
    final token = await _tokenStorage.getAccessToken();
    final normalizedToken = _normalizeAccessToken(token);
    final accessTokenExists = normalizedToken != null;
    var authorizationHeaderAttached = false;

    if (!isAuthRequest && accessTokenExists) {
      options.headers['Authorization'] = 'Bearer $normalizedToken';
      authorizationHeaderAttached = true;
    }

    final authorizationHeader = options.headers['Authorization']?.toString();
    final authorizationHeaderStartsWithBearer =
        authorizationHeader?.startsWith('Bearer ') ?? false;

    _logAuthDebug('path=$path');
    _logAuthDebug('isAuthRequest=$isAuthRequest');
    _logAuthDebug('accessTokenExists=$accessTokenExists');
    _logAuthDebug('authorizationHeaderAttached=$authorizationHeaderAttached');
    _logAuthDebug(
      'authorizationHeaderStartsWithBearer='
      '$authorizationHeaderStartsWithBearer',
    );

    if (isAuthRequest) {
      return handler.next(options);
    }

    return handler.next(options);
  }

  String? _normalizeAccessToken(String? token) {
    final trimmed = token?.trim();
    if (trimmed == null || trimmed.isEmpty) return null;
    const bearerPrefix = 'Bearer ';
    if (trimmed.toLowerCase().startsWith(bearerPrefix.toLowerCase())) {
      return trimmed.substring(bearerPrefix.length).trim();
    }
    return trimmed;
  }
}

void _logAuthDebug(String message) {
  if (kDebugMode) {
    debugPrint('[AUTH_DEBUG] $message');
  }
}
