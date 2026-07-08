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

class SocialLoginRequested extends AuthEvent {
  final String provider;

  const SocialLoginRequested({required this.provider});

  @override
  List<Object?> get props => [provider];
}


// ── Unified phone login/register (API v2) ────────────────────────────────────

/// `POST /api/v2/auth/otp/send` — request a code for [phone] (login OR sign-up).
class PhoneOtpRequested extends AuthEvent {
  final String phone;

  const PhoneOtpRequested({required this.phone});

  @override
  List<Object?> get props => [phone];
}

/// `POST /api/v2/auth/otp/verify` — verify [otp] for [phone].
class PhoneOtpVerifySubmitted extends AuthEvent {
  final String phone;
  final String otp;

  const PhoneOtpVerifySubmitted({required this.phone, required this.otp});

  @override
  List<Object?> get props => [phone, otp];
}

/// `POST /api/v2/auth/register` — finish sign-up for a verified [phone].
class CompleteRegistrationSubmitted extends AuthEvent {
  final String phone;
  final String firstName;
  final String lastName;
  final String? email;

  const CompleteRegistrationSubmitted({
    required this.phone,
    required this.firstName,
    required this.lastName,
    this.email,
  });

  @override
  List<Object?> get props => [phone, firstName, lastName, email];
}
