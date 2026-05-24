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

/// Triggers `POST /auth/otp/send`. Customer app only sends
/// `ROLE_CUSTOMER` by default.
class ForgotPasswordSubmitted extends AuthEvent {
  final String email;

  const ForgotPasswordSubmitted({required this.email});

  @override
  List<Object?> get props => [email];
}

/// Triggers `POST /auth/otp/verify` using the email captured during the
/// forgot-password step and the OTP entered by the user.
class VerifyOtpSubmitted extends AuthEvent {
  final String email;
  final String otp;

  const VerifyOtpSubmitted({required this.email, required this.otp});

  @override
  List<Object?> get props => [email, otp];
}

/// Triggers `POST /auth/set-password`. The Bearer token is attached by the
/// [AuthInterceptor]; the body only carries [newPassword]. Password is sent
/// exactly as typed — login/register don't trim passwords either.
class SetPasswordSubmitted extends AuthEvent {
  final String newPassword;

  const SetPasswordSubmitted({required this.newPassword});

  @override
  List<Object?> get props => [newPassword];
}
