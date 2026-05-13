class ApiEndpoints {
  ApiEndpoints._();

  /// Base URL is overridable at build/run time via:
  ///   flutter run --dart-define=API_BASE_URL=https://...
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://delivery-system-api-otmb.onrender.com/api/v1',
  );

  // ── Auth ──────────────────────────────────────────────────────────────────
  static const String login = '/auth/login';
  static const String register = '/auth/register';
  static const String forgotPassword = '/auth/forgot-password';
  static const String verifyOtp = '/auth/verify-otp';
  static const String resendOtp = '/auth/resend-otp';
  static const String resetPassword = '/auth/reset-password';
  static const String logout = '/auth/logout';
  static const String me = '/auth/me';
  static const String refreshToken = '/auth/refresh';

  /// Public auth endpoints that must NOT receive an Authorization header.
  static const Set<String> publicAuthPaths = {
    login,
    register,
    forgotPassword,
    verifyOtp,
    resendOtp,
    resetPassword,
    refreshToken,
  };
}
