import 'auth_response_model.dart';

/// Parsed `POST /api/v2/auth/otp/verify` response.
///
/// Mirrors the login/register auth envelope. [accessToken] is persisted so
/// [AuthInterceptor] can authorize the following `POST /auth/set-password`.
class VerifyOtpResponseModel {
  final String? accessToken;
  final String? refreshToken;
  final String? tokenType;
  final String? userId;
  final String? email;
  final String? name;
  final String? role;

  const VerifyOtpResponseModel({
    this.accessToken,
    this.refreshToken,
    this.tokenType,
    this.userId,
    this.email,
    this.name,
    this.role,
  });

  bool get hasAccessToken =>
      accessToken != null && accessToken!.trim().isNotEmpty;

  factory VerifyOtpResponseModel.fromJson(Map<String, dynamic> json) {
    String? readString(String key) {
      final value = json[key];
      if (value == null) return null;
      final s = value.toString().trim();
      return s.isEmpty ? null : s;
    }

    return VerifyOtpResponseModel(
      accessToken: readString('accessToken') ?? readString('access_token'),
      refreshToken: readString('refreshToken') ?? readString('refresh_token'),
      tokenType: readString('tokenType') ?? readString('token_type'),
      userId: readString('userId') ?? readString('user_id'),
      email: readString('email'),
      name: readString('name'),
      role: readString('role'),
    );
  }

  /// Maps to the shared auth envelope for token/user persistence.
  AuthResponseModel toAuthResponseModel() {
    return AuthResponseModel(
      accessToken: accessToken,
      refreshToken: refreshToken,
      tokenType: tokenType,
      userId: userId ?? '',
      email: email,
      fullName: name,
      role: role,
    );
  }
}
