import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  final String id;
  final String firstName;
  final String lastName;
  final String fullName;
  final String phone;
  final String email;
  final String avatar;
  final String locale;

  const UserProfile({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.fullName,
    required this.phone,
    required this.email,
    required this.avatar,
    required this.locale,
  });

  @override
  List<Object?> get props => [
    id,
    firstName,
    lastName,
    fullName,
    phone,
    email,
    avatar,
    locale,
  ];
}
