/// Pure domain value object for updating a user's settings.
/// ZERO dependencies on data layer.
class UpdateSettingsRequest {
  const UpdateSettingsRequest({
    this.locale,
    this.pushNotifications,
    this.smsNotifications,
    this.emailNotifications,
    this.theme,
  });

  final String? locale;
  final bool? pushNotifications;
  final bool? smsNotifications;
  final bool? emailNotifications;
  final String? theme;
}
