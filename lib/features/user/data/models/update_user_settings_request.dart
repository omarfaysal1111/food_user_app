class UpdateUserSettingsRequest {
  final String? locale;
  final bool? pushNotifications;
  final bool? smsNotifications;
  final bool? emailNotifications;
  final String? theme;

  const UpdateUserSettingsRequest({
    this.locale,
    this.pushNotifications,
    this.smsNotifications,
    this.emailNotifications,
    this.theme,
  });

  Map<String, dynamic> toJson() {
    return {
      if (pushNotifications != null) 'is_notify': pushNotifications! ? 1 : 0,
      // locale, sms, email, theme are not supported by the new API currently, but kept for signature compat
    };
  }
}
