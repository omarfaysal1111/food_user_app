import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_user_settings_request.freezed.dart';
part 'update_user_settings_request.g.dart';

@freezed
abstract class UpdateUserSettingsRequest with _$UpdateUserSettingsRequest {
  const factory UpdateUserSettingsRequest({
    String? locale,
    bool? pushNotifications,
    bool? smsNotifications,
    bool? emailNotifications,
    String? theme,
  }) = _UpdateUserSettingsRequest;

  factory UpdateUserSettingsRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserSettingsRequestFromJson(json);
}
