import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/user/domain/entities/user_profile.dart';

part 'user_profile_dto.freezed.dart';
part 'user_profile_dto.g.dart';

@freezed
abstract class UserProfileDto with _$UserProfileDto {
  const factory UserProfileDto({
    required String id,
    String? firstName,
    String? lastName,
    String? fullName,
    String? phone,
    String? email,
    String? avatar,
    String? locale,
  }) = _UserProfileDto;

  factory UserProfileDto.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDtoFromJson(json);
}

extension UserProfileDtoMapper on UserProfileDto {
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
