// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_settings_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateUserSettingsRequest _$UpdateUserSettingsRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateUserSettingsRequest(
  locale: json['locale'] as String?,
  pushNotifications: json['pushNotifications'] as bool?,
  smsNotifications: json['smsNotifications'] as bool?,
  emailNotifications: json['emailNotifications'] as bool?,
  theme: json['theme'] as String?,
);

Map<String, dynamic> _$UpdateUserSettingsRequestToJson(
  _UpdateUserSettingsRequest instance,
) => <String, dynamic>{
  'locale': instance.locale,
  'pushNotifications': instance.pushNotifications,
  'smsNotifications': instance.smsNotifications,
  'emailNotifications': instance.emailNotifications,
  'theme': instance.theme,
};
