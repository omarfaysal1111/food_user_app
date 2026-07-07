import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import '../../constants/api_endpoints.dart';
import '../../storage/token_storage.dart';
import '../../router/app_router.dart';
import '../../router/route_names.dart';

/// Attaches `Authorization: Bearer <token>` to outgoing requests, except for
/// public auth endpoints listed in [ApiEndpoints.publicAuthPaths].
///
/// Implements 401 refresh-token retry flow using a locking mechanism.
class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor(
    this._tokenStorage, {
    required this.getDio,
  });

  final TokenStorage _tokenStorage;
  final Dio Function() getDio;

  bool _isRefreshing = false;

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

    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode == 401) {
      final isRefreshRequest =
          err.requestOptions.path == ApiEndpoints.refreshToken ||
          err.requestOptions.path.endsWith(ApiEndpoints.refreshToken);

      if (isRefreshRequest) {
        await _logout();
        return handler.next(err);
      }

      // If another request is already refreshing the token, just retry after it's done
      // Since this is a QueuedInterceptor, the queue is naturally locked/paused during async operations.
      // However, we simulate the lock/unlock state explicitly as requested.
      if (_isRefreshing) {
        try {
          final response = await _retryRequest(err.requestOptions);
          return handler.resolve(response);
        } catch (e) {
          return handler.next(err);
        }
      }

      _lock();

      try {
        final success = await _refreshToken();
        if (success) {
          _unlock();
          final response = await _retryRequest(err.requestOptions);
          return handler.resolve(response);
        } else {
          _unlock();
          await _logout();
          return handler.next(err);
        }
      } catch (e) {
        _unlock();
        await _logout();
        return handler.next(err);
      }
    }

    return handler.next(err);
  }

  // Simulated lock mechanism (QueuedInterceptor handles actual queueing in Dio 5)
  void _lock() {
    _isRefreshing = true;
  }

  void _unlock() {
    _isRefreshing = false;
  }

  Future<bool> _refreshToken() async {
    print("Token refresh initiated...");
    final refreshToken = await _tokenStorage.getRefreshToken();
    if (refreshToken == null || refreshToken.isEmpty) {
      return false;
    }

    // Use a separate Dio instance to avoid recursive interception loops
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    try {
      final response = await dio.post(
        ApiEndpoints.refreshToken,
        data: {'refreshToken': refreshToken},
      );

      final data = response.data;
      if (data is Map<String, dynamic> && data['data'] != null) {
        final tokenData = data['data'];
        final newAccess = tokenData['accessToken'];
        final newRefresh = tokenData['refreshToken'];

        if (newAccess != null) {
          await _tokenStorage.saveAccessToken(newAccess);
          if (newRefresh != null) {
            await _tokenStorage.saveRefreshToken(newRefresh);
          }
          return true;
        }
      }
      return false;
    } catch (_) {
      return false;
    }
  }

  Future<Response<dynamic>> _retryRequest(RequestOptions requestOptions) async {
    final dio = getDio();
    final newAccessToken = await _tokenStorage.getAccessToken();
    final normalizedToken = _normalizeAccessToken(newAccessToken);

    if (normalizedToken != null) {
      requestOptions.headers['Authorization'] = 'Bearer $normalizedToken';
    }

    return await dio.fetch(requestOptions);
  }

  Future<void> _logout() async {
    await _tokenStorage.clearAccessToken();
    await _tokenStorage.clearRefreshToken();
    AppRouter.router.go(RouteNames.authEntry);
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
