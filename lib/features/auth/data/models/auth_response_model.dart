import 'user_model.dart';

/// Auth envelope returned by the backend's v2 unified flow
/// (`/api/v2/auth/otp/verify` and `/api/v2/auth/register`) and v1 login.
///
/// Backend shape (note: split name + phone + newUser):
/// ```json
/// {
///   "accessToken": "...",
///   "refreshToken": "...",
///   "tokenType": "Bearer",
///   "userId": "uuid",
///   "email": "omar@gmail.com",
///   "phone": "+201012345678",
///   "firstName": "Omar",
///   "lastName": "Tharwat",
///   "fullName": "Omar Tharwat",
///   "role": "ROLE_CUSTOMER",
///   "newUser": false
/// }
/// ```
///
/// For a brand-new phone, `accessToken`/`refreshToken` are null and
/// `newUser` is true — the client must then call `/api/v2/auth/register`.
class AuthResponseModel {
  final String? accessToken;
  final String? refreshToken;
  final String? tokenType;
  final String userId;
  final String? email;
  final String? phone;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? role;
  final bool newUser;

  const AuthResponseModel({
    required this.userId,
    this.accessToken,
    this.refreshToken,
    this.tokenType,
    this.email,
    this.phone,
    this.firstName,
    this.lastName,
    this.fullName,
    this.role,
    this.newUser = false,
  });

  bool get hasAccessToken =>
      accessToken != null && accessToken!.trim().isNotEmpty;

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    String? str(String key) {
      final v = json[key];
      if (v == null) return null;
      final s = v.toString().trim();
      return s.isEmpty ? null : s;
    }

    return AuthResponseModel(
      accessToken: str('accessToken') ?? str('access_token'),
      refreshToken: str('refreshToken') ?? str('refresh_token'),
      tokenType: str('tokenType') ?? str('token_type'),
      userId: str('userId') ?? str('id') ?? '',
      email: str('email'),
      phone: str('phone'),
      firstName: str('firstName'),
      lastName: str('lastName'),
      fullName: str('fullName'),
      role: str('role'),
      newUser: json['newUser'] == true,
    );
  }

  /// Composes a display name from `fullName`, else `firstName + lastName`.
  String get displayName {
    final fn = fullName?.trim();
    if (fn != null && fn.isNotEmpty) return fn;
    final parts = [firstName, lastName]
        .where((p) => p != null && p.trim().isNotEmpty)
        .map((p) => p!.trim())
        .toList();
    return parts.join(' ');
  }

  /// Exposes the user payload as a [UserModel].
  UserModel get user => UserModel(
    id: userId,
    name: displayName,
    email: email,
    phone: phone,
    role: role,
  );
}
