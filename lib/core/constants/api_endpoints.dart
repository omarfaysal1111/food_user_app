class ApiEndpoints {
  ApiEndpoints._();

  /// Base URL is overridable at build/run time via:
  ///   flutter run --dart-define=API_BASE_URL=https://...
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://delivery-system-api-otmb.onrender.com/api/v1',
  );

  /// Base URL for forgot-password / OTP / set-password only (API v2).
  /// Login, register, and other auth calls stay on [baseUrl] (v1).
  static const String baseUrlV2 = String.fromEnvironment(
    'API_BASE_URL_V2',
    defaultValue: 'https://delivery-system-api-otmb.onrender.com/api/v2',
  );

  // ── Auth (v1 — login, register, logout, …) ────────────────────────────────
  static const String login = '/auth/login';
  static const String register = '/auth/register';

  // ── Password recovery (v2 only) ───────────────────────────────────────────
  static const String sendOtp = '/auth/otp/send';
  static const String verifyOtp = '/auth/otp/verify';

  /// Requires `Authorization: Bearer <accessToken>` from verify OTP — see
  /// [AuthInterceptor]. Do NOT add to [publicAuthPaths].
  static const String setPassword = '/auth/set-password';

  /// Absolute URL for a v2 password-recovery path (used instead of [baseUrl]).
  static String passwordRecoveryUrl(String path) => '$baseUrlV2$path';

  static const String logout = '/auth/logout';
  static const String me = '/auth/me';
  static const String refreshToken = '/auth/refresh';

  /// Public auth endpoints that must NOT receive an Authorization header.
  /// `/auth/set-password` is intentionally NOT listed here.
  static const Set<String> publicAuthPaths = {
    login,
    register,
    sendOtp,
    verifyOtp,
    refreshToken,
  };
}
