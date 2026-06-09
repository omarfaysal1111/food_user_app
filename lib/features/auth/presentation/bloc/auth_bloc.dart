import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:food_user_app/core/usecases/usecase.dart';
import 'package:food_user_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:food_user_app/features/auth/domain/usecases/forgot_password_usecase.dart';
import 'package:food_user_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:food_user_app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:food_user_app/features/auth/domain/usecases/register_usecase.dart';
import 'package:food_user_app/features/auth/domain/usecases/set_password_usecase.dart';
import 'package:food_user_app/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.logoutUseCase,
    required this.forgotPasswordUseCase,
    required this.verifyOtpUseCase,
    required this.setPasswordUseCase,
    required this.authRepository,
  }) : super(const AuthStateInitial()) {
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<LoginSubmitted>(_onLoginSubmitted);
    on<RegisterSubmitted>(_onRegisterSubmitted);
    on<ForgotPasswordSubmitted>(_onForgotPasswordSubmitted);
    on<VerifyOtpSubmitted>(_onVerifyOtpSubmitted);
    on<SetPasswordSubmitted>(_onSetPasswordSubmitted);
    on<LogoutRequested>(_onLogoutRequested);
  }

  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;
  final ForgotPasswordUseCase forgotPasswordUseCase;
  final VerifyOtpUseCase verifyOtpUseCase;
  final SetPasswordUseCase setPasswordUseCase;
  final AuthRepository authRepository;

  Future<void> _onAuthCheckRequested(
    AuthCheckRequested event,
    Emitter<AuthState> emit,
  ) async {
    final loggedIn = await authRepository.isLoggedIn;
    if (!loggedIn) {
      emit(const Unauthenticated());
      return;
    }
    final cachedUser = await authRepository.getCachedUser();
    cachedUser.fold((_) => emit(const Unauthenticated()), (user) {
      if (user == null) {
        emit(const Unauthenticated());
      } else {
        emit(Authenticated(user));
      }
    });
  }

  Future<void> _onLoginSubmitted(
    LoginSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(const AuthLoading());

    final result = await loginUseCase(
      LoginParams(email: event.email, password: event.password),
    );

    result.fold(
      (failure) => emit(AuthError(failure.message)),
      (user) => emit(AuthSuccess(user)),
    );
  }

  Future<void> _onRegisterSubmitted(
    RegisterSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(const RegisterInProgress());

    final result = await registerUseCase(
      RegisterParams(
        name: event.name.trim(),
        email: event.email.trim(),
        password: event.password,
        phone: event.phone.trim(),
      ),
    );

    result.fold(
      (failure) => emit(RegisterFailure(failure.message)),
      (user) => emit(RegisterSuccess(user)),
    );
  }

  Future<void> _onForgotPasswordSubmitted(
    ForgotPasswordSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(const ForgotPasswordInProgress());

    final email = event.email.trim();
    final result = await forgotPasswordUseCase(
      ForgotPasswordParams(email: email),
    );

    result.fold(
      (failure) => emit(ForgotPasswordFailure(failure.message)),
      (_) => emit(ForgotPasswordSuccess(email)),
    );
  }

  Future<void> _onVerifyOtpSubmitted(
    VerifyOtpSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(const VerifyOtpInProgress());

    final email = event.email.trim();
    final otp = event.otp.trim();
    final result = await verifyOtpUseCase(
      VerifyOtpParams(email: email, otp: otp),
    );

    result.fold(
      (failure) => emit(VerifyOtpFailure(failure.message)),
      (_) => emit(VerifyOtpSuccess(email)),
    );
  }

  Future<void> _onSetPasswordSubmitted(
    SetPasswordSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(const SetPasswordInProgress());

    // Password is sent verbatim — login/register also do not trim passwords.
    final result = await setPasswordUseCase(
      SetPasswordParams(newPassword: event.newPassword),
    );

    result.fold(
      (failure) => emit(SetPasswordFailure(failure.message)),
      (_) => emit(const SetPasswordSuccess()),
    );
  }

  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const LogoutInProgress());
    await logoutUseCase(const NoParams());
    emit(const Unauthenticated());
  }
}
