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

  // ── Unified phone login/register + password recovery (API v2) ─────────────
  // The same `/auth/otp/send` + `/auth/otp/verify` drive the phone-first
  // unified flow: send a code to any phone; verify → existing user gets tokens,
  // a new phone gets `newUser:true` and then calls [registerV2].
  static const String sendOtp = '/auth/otp/send';
  static const String verifyOtp = '/auth/otp/verify';

  /// Completes sign-up for a freshly OTP-verified phone (API v2).
  static const String registerV2 = '/auth/register';

  /// Requires `Authorization: Bearer <accessToken>` from verify OTP — see
  /// [AuthInterceptor]. Do NOT add to [publicAuthPaths].
  static const String setPassword = '/auth/set-password';

  /// Absolute URL for a v2 auth path (used instead of the v1 [baseUrl]).
  static String passwordRecoveryUrl(String path) => '$baseUrlV2$path';

  /// Absolute URL for a v2 auth path. Alias of [passwordRecoveryUrl] with a
  /// clearer name for the unified login/register flow.
  static String v2(String path) => '$baseUrlV2$path';

  static const String logout = '/auth/logout';
  static const String firebaseAuth = '/auth/firebase';
  static const String me = '/auth/me';
  static const String refreshToken = '/auth/refresh';

  // ── User addresses ────────────────────────────────────────────────────────
  static const String userAddresses = '/user/addresses';
  static String userAddress(String id) => '$userAddresses/$id';
  static String userAddressDefault(String id) => '$userAddresses/$id/default';

  // ── User Profile & Settings ───────────────────────────────────────────────
  static const String userProfile = '/user/profile';
  static const String userSettings = '/user/settings';
  static const String user = '/user';

  // ── Banners & Search ──────────────────────────────────────────────────────
  static const String banners = '/banners';
  static const String search = '/search';
  static const String searchHistory = '/search/history';

  // ── Restaurants ───────────────────────────────────────────────────────────
  static const String restaurants = '/restaurants';
  static String restaurantDetails(String id) => '$restaurants/$id';
  static String restaurantBranches(String id) => '$restaurants/$id/branches';
  static String restaurantOffers(String id) => '$restaurants/$id/offers';

  /// Public auth endpoints that must NOT receive an Authorization header.
  /// `/auth/set-password` is intentionally NOT listed here.
  // Note: [registerV2] shares the same path string as [register]
  // (`/auth/register`), so it is already covered here and not repeated.
  static const Set<String> publicAuthPaths = {
    login,
    register,
    sendOtp,
    verifyOtp,
    firebaseAuth,
    refreshToken,
    logout,
  };
}
