import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/user/domain/entities/user_settings.dart';

part 'user_settings_dto.freezed.dart';
part 'user_settings_dto.g.dart';

@freezed
abstract class UserSettingsDto with _$UserSettingsDto {
  const factory UserSettingsDto({
    required String id,
    String? locale,
    bool? pushNotifications,
    bool? smsNotifications,
    bool? emailNotifications,
    String? theme,
  }) = _UserSettingsDto;

  factory UserSettingsDto.fromJson(Map<String, dynamic> json) =>
      _$UserSettingsDtoFromJson(json);
}

extension UserSettingsDtoMapper on UserSettingsDto {
  UserSettings toEntity() {
    return UserSettings(
      id: id,
      locale: locale ?? 'ar',
      pushNotifications: pushNotifications ?? false,
      smsNotifications: smsNotifications ?? false,
      emailNotifications: emailNotifications ?? false,
      theme: theme ?? 'light',
    );
  }
}
