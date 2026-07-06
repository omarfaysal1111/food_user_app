// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_user_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UpdateUserProfileRequest _$UpdateUserProfileRequestFromJson(
  Map<String, dynamic> json,
) => _UpdateUserProfileRequest(
  firstName: json['firstName'] as String?,
  lastName: json['lastName'] as String?,
  phone: json['phone'] as String?,
  email: json['email'] as String?,
  avatar: json['avatar'] as String?,
  locale: json['locale'] as String?,
);

Map<String, dynamic> _$UpdateUserProfileRequestToJson(
  _UpdateUserProfileRequest instance,
) => <String, dynamic>{
  'firstName': instance.firstName,
  'lastName': instance.lastName,
  'phone': instance.phone,
  'email': instance.email,
  'avatar': instance.avatar,
  'locale': instance.locale,
};
