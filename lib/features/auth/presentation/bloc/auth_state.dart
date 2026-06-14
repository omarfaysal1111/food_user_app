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

// ── Login flow ──────────────────────────────────────────────────────────────

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthSuccess extends AuthState {
  final User user;

  const AuthSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class AuthError extends AuthState {
  final String message;

  const AuthError(this.message);

  @override
  List<Object?> get props => [message];
}

// ── Register flow ───────────────────────────────────────────────────────────

class RegisterInProgress extends AuthState {
  const RegisterInProgress();
}

class RegisterSuccess extends AuthState {
  final User user;

  const RegisterSuccess(this.user);

  @override
  List<Object?> get props => [user];
}

class RegisterFailure extends AuthState {
  final String message;

  const RegisterFailure(this.message);

  @override
  List<Object?> get props => [message];
}

// ── Forgot password (send OTP) ──────────────────────────────────────────────

class ForgotPasswordInProgress extends AuthState {
  const ForgotPasswordInProgress();
}

class ForgotPasswordSuccess extends AuthState {
  final String email;

  const ForgotPasswordSuccess(this.email);

  @override
  List<Object?> get props => [email];
}

class ForgotPasswordFailure extends AuthState {
  final String message;

  const ForgotPasswordFailure(this.message);

  @override
  List<Object?> get props => [message];
}

// ── Verify OTP ──────────────────────────────────────────────────────────────

class VerifyOtpInProgress extends AuthState {
  const VerifyOtpInProgress();
}

class VerifyOtpSuccess extends AuthState {
  final String email;

  const VerifyOtpSuccess(this.email);

  @override
  List<Object?> get props => [email];
}

class VerifyOtpFailure extends AuthState {
  final String message;

  const VerifyOtpFailure(this.message);

  @override
  List<Object?> get props => [message];
}

// ── Set new password ────────────────────────────────────────────────────────

class SetPasswordInProgress extends AuthState {
  const SetPasswordInProgress();
}

class SetPasswordSuccess extends AuthState {
  const SetPasswordSuccess();
}

class SetPasswordFailure extends AuthState {
  final String message;

  const SetPasswordFailure(this.message);

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
