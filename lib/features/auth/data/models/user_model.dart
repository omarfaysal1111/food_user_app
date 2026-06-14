import 'package:food_user_app/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    super.email,
    super.role,
  });

  /// Parses a flat user-shaped JSON object.
  ///
  /// Supports both `id` and `userId` as the id field so this model can be
  /// reused from the register response (which uses `userId`) and from any
  /// future `GET /auth/me` style endpoint (which typically uses `id`).
  factory UserModel.fromJson(Map<String, dynamic> json) {
    final rawId = json['userId'] ?? json['id'];
    return UserModel(
      id: rawId?.toString() ?? '',
      name: json['name']?.toString() ?? '',
      email: json['email']?.toString(),
      role: json['role']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      if (email != null) 'email': email,
      if (role != null) 'role': role,
    };
  }
}
