import 'package:dio/dio.dart';

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
    if (_isPublicAuthPath(options.path)) {
      return handler.next(options);
    }

    final token = await _tokenStorage.getAccessToken();
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }
}
