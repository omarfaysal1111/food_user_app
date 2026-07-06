import 'package:equatable/equatable.dart';

class UserSettings extends Equatable {
  final String id;
  final String locale;
  final bool pushNotifications;
  final bool smsNotifications;
  final bool emailNotifications;
  final String theme;

  const UserSettings({
    required this.id,
    required this.locale,
    required this.pushNotifications,
    required this.smsNotifications,
    required this.emailNotifications,
    required this.theme,
  });

  @override
  List<Object?> get props => [
        id,
        locale,
        pushNotifications,
        smsNotifications,
        emailNotifications,
        theme,
      ];
}
