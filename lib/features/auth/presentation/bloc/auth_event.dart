import 'package:equatable/equatable.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

/// Splash-time session check. Reads cached token + user and emits either
/// [Authenticated] or [Unauthenticated].
class AuthCheckRequested extends AuthEvent {
  const AuthCheckRequested();
}

class LogoutRequested extends AuthEvent {
  const LogoutRequested();
}

class LoginSubmitted extends AuthEvent {
  final String email;
  final String password;

  const LoginSubmitted({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}

class RegisterSubmitted extends AuthEvent {
  final String name;
  final String phone;
  final String email;
  final String password;

  const RegisterSubmitted({
    required this.name,
    required this.phone,
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [name, phone, email, password];
}
