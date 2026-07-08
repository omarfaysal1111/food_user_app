import 'package:equatable/equatable.dart';
import 'package:food_user_app/features/auth/domain/entities/user.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthStateInitial extends AuthState {
  const AuthStateInitial();
}

class LogoutInProgress extends AuthState {
  const LogoutInProgress();
}

// ── Social Login ────────────────────────────────────────────────────────────

class SocialLoginInProgress extends AuthState {
  const SocialLoginInProgress();
}

class SocialLoginNewUser extends AuthState {
  final String firstName;
  final String lastName;
  final String email;

  const SocialLoginNewUser({
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  @override
  List<Object?> get props => [firstName, lastName, email];
}

class SocialLoginFailure extends AuthState {
  final String message;

  const SocialLoginFailure(this.message);

  @override
  List<Object?> get props => [message];
}



// ── Session status ──────────────────────────────────────────────────────────

class Authenticated extends AuthState {
  final User user;

  const Authenticated(this.user);

  @override
  List<Object?> get props => [user];
}

class Unauthenticated extends AuthState {
  const Unauthenticated();
}

// ── Unified phone login/register (API v2) ────────────────────────────────────

// Send OTP
class PhoneOtpSendInProgress extends AuthState {
  const PhoneOtpSendInProgress();
}

class PhoneOtpSent extends AuthState {
  final String phone;
  final bool isExistingUser;

  const PhoneOtpSent({required this.phone, required this.isExistingUser});

  @override
  List<Object?> get props => [phone, isExistingUser];
}

class PhoneOtpSendFailure extends AuthState {
  final String message;

  const PhoneOtpSendFailure(this.message);

  @override
  List<Object?> get props => [message];
}

// Verify OTP
class PhoneOtpVerifyInProgress extends AuthState {
  const PhoneOtpVerifyInProgress();
}

/// Existing account verified → session persisted, user signed in.
class PhoneOtpLoginSuccess extends AuthState {
  final User user;

  const PhoneOtpLoginSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

/// New phone verified → proceed to complete-profile/register with [phone].
class PhoneOtpNewUser extends AuthState {
  final String phone;

  const PhoneOtpNewUser(this.phone);

  @override
  List<Object?> get props => [phone];
}

class PhoneOtpVerifyFailure extends AuthState {
  final String message;

  const PhoneOtpVerifyFailure(this.message);

  @override
  List<Object?> get props => [message];
}

// Complete registration
class CompleteRegistrationInProgress extends AuthState {
  const CompleteRegistrationInProgress();
}

class CompleteRegistrationSuccess extends AuthState {
  final User user;

  const CompleteRegistrationSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class CompleteRegistrationFailure extends AuthState {
  final String message;

  const CompleteRegistrationFailure(this.message);

  @override
  List<Object?> get props => [message];
}
