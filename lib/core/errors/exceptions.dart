class ServerException implements Exception {
  final String message;
  const ServerException(this.message);
  @override
  String toString() => 'ServerException(message: $message)';
}

class CacheException implements Exception {
  final String message;
  const CacheException(this.message);
  @override
  String toString() => 'CacheException(message: $message)';
}

class AuthException implements Exception {
  final String message;
  const AuthException(this.message);
  @override
  String toString() => 'AuthException(message: $message)';
}

class NetworkException implements Exception {
  final String message;
  const NetworkException([this.message = 'No internet connection']);
  @override
  String toString() => 'NetworkException(message: $message)';
}

class TimeoutException implements Exception {
  final String message;
  const TimeoutException([this.message = 'Request timed out']);
  @override
  String toString() => 'TimeoutException(message: $message)';
}

class UnauthorizedException implements Exception {
  final String message;
  const UnauthorizedException([this.message = 'Unauthorized']);
  @override
  String toString() => 'UnauthorizedException(message: $message)';
}

class ValidationException implements Exception {
  final String message;
  final Map<String, dynamic>? errors;
  const ValidationException(this.message, {this.errors});
  @override
  String toString() =>
      'ValidationException(message: $message, errors: $errors)';
}

class UnknownException implements Exception {
  final String message;
  const UnknownException([this.message = 'Something went wrong']);
  @override
  String toString() => 'UnknownException(message: $message)';
}
