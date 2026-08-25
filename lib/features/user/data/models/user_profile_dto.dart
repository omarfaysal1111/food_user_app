import 'package:food_user_app/features/user/domain/entities/user_profile.dart';

class UserProfileDto {
  final String id;
  final String? firstName;
  final String? lastName;
  final String? fullName;
  final String? phone;
  final String? email;
  final String? avatar;
  final String? locale;

  const UserProfileDto({
    required this.id,
    this.firstName,
    this.lastName,
    this.fullName,
    this.phone,
    this.email,
    this.avatar,
    this.locale,
  });

  factory UserProfileDto.fromJson(Map<String, dynamic> json) {
    return UserProfileDto(
      id: json['id']?.toString() ?? '',
      firstName: json['first_name'] as String? ?? json['firstName'] as String?,
      lastName: json['last_name'] as String? ?? json['lastName'] as String?,
      fullName: json['full_name'] as String? ?? json['fullName'] as String?,
      phone: json['phone'] as String?,
      email: json['email'] as String?,
      avatar: json['avatar'] as String?,
      locale: json['locale'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'full_name': fullName,
      'phone': phone,
      'email': email,
      'avatar': avatar,
      'locale': locale,
    };
  }

  UserProfile toEntity() {
    return UserProfile(
      id: id,
      firstName: firstName ?? '',
      lastName: lastName ?? '',
      fullName: fullName ?? '',
      phone: phone ?? '',
      email: email ?? '',
      avatar: avatar ?? '',
      locale: locale ?? '',
    );
  }
}
