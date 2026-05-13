import 'package:dio/dio.dart';

/// Placeholder retry interceptor.
///
/// For Phase 1 this is a safe pass-through. Real retry logic must:
///   * never retry POST/PUT/PATCH/DELETE (non-idempotent),
///   * only retry on connection/timeout errors,
///   * cap attempts and use exponential back-off.
///
/// TODO(phase-2): Implement bounded exponential back-off retry for
///                GET requests on connection/timeout failures.
class RetryInterceptor extends Interceptor {
  RetryInterceptor({required this.dio});

  final Dio dio;
}
