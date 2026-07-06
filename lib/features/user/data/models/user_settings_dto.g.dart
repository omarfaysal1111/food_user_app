// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserSettingsDto _$UserSettingsDtoFromJson(Map<String, dynamic> json) =>
    _UserSettingsDto(
      id: json['id'] as String,
      locale: json['locale'] as String?,
      pushNotifications: json['pushNotifications'] as bool?,
      smsNotifications: json['smsNotifications'] as bool?,
      emailNotifications: json['emailNotifications'] as bool?,
      theme: json['theme'] as String?,
    );

Map<String, dynamic> _$UserSettingsDtoToJson(_UserSettingsDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'locale': instance.locale,
      'pushNotifications': instance.pushNotifications,
      'smsNotifications': instance.smsNotifications,
      'emailNotifications': instance.emailNotifications,
      'theme': instance.theme,
    };
