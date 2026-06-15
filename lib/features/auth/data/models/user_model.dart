import 'package:food_user_app/features/auth/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    super.email,
    super.phone,
    super.role,
  });

  /// Parses a flat user-shaped JSON object.
  ///
  /// Accepts both `id` and `userId` for the identifier, and composes a display
  /// name from `name`, else `fullName`, else `firstName` + `lastName` — so the
  /// same model parses the backend auth envelope and the locally cached user.
  factory UserModel.fromJson(Map<String, dynamic> json) {
    final rawId = json['userId'] ?? json['id'];

    String composeName() {
      final name = json['name']?.toString().trim();
      if (name != null && name.isNotEmpty) return name;
      final full = json['fullName']?.toString().trim();
      if (full != null && full.isNotEmpty) return full;
      final parts = [json['firstName'], json['lastName']]
          .where((p) => p != null && p.toString().trim().isNotEmpty)
          .map((p) => p.toString().trim())
          .toList();
      return parts.join(' ');
    }

    return UserModel(
      id: rawId?.toString() ?? '',
      name: composeName(),
      email: json['email']?.toString(),
      phone: json['phone']?.toString(),
      role: json['role']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (role != null) 'role': role,
    };
  }
}
