import 'user_model.dart';

/// Response envelope returned by `POST /auth/register` (and expected from
/// `POST /auth/login` once the backend is wired). Shape is flat:
///
/// ```json
/// {
///   "accessToken": "...",
///   "refreshToken": "...",
///   "tokenType": "Bearer",
///   "userId": "uuid",
///   "email": "omar@gmail.com",
///   "name": "Omar Tharwat",
///   "role": "ROLE_CUSTOMER"
/// }
/// ```
class AuthResponseModel {
  final String accessToken;
  final String? refreshToken;
  final String? tokenType;
  final String userId;
  final String email;
  final String name;
  final String? role;

  const AuthResponseModel({
    required this.accessToken,
    required this.userId,
    required this.email,
    required this.name,
    this.refreshToken,
    this.tokenType,
    this.role,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      accessToken: json['accessToken']?.toString() ?? '',
      refreshToken: json['refreshToken']?.toString(),
      tokenType: json['tokenType']?.toString(),
      userId: json['userId']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      role: json['role']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'accessToken': accessToken,
      if (refreshToken != null) 'refreshToken': refreshToken,
      if (tokenType != null) 'tokenType': tokenType,
      'userId': userId,
      'email': email,
      'name': name,
      if (role != null) 'role': role,
    };
  }

  /// Convenience accessor that exposes the user payload as a [UserModel]
  /// so callers don't need to know about the auth envelope.
  UserModel get user =>
      UserModel(id: userId, name: name, email: email, role: role);
}
