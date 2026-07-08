import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:food_user_app/core/usecases/usecase.dart';
import 'package:food_user_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:food_user_app/features/auth/domain/usecases/logout_usecase.dart';
import 'package:food_user_app/features/auth/domain/usecases/send_phone_otp_usecase.dart';
import 'package:food_user_app/features/auth/domain/usecases/verify_phone_otp_usecase.dart';
import 'package:food_user_app/features/auth/domain/usecases/complete_registration_usecase.dart';
import 'package:food_user_app/features/auth/data/datasources/social_auth_service.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required this.logoutUseCase,
    required this.sendPhoneOtpUseCase,
    required this.verifyPhoneOtpUseCase,
    required this.completeRegistrationUseCase,
    required this.authRepository,
  }) : super(const AuthStateInitial()) {
    on<AuthCheckRequested>(_onAuthCheckRequested);
    on<LogoutRequested>(_onLogoutRequested);
    on<PhoneOtpRequested>(_onPhoneOtpRequested);
    on<PhoneOtpVerifySubmitted>(_onPhoneOtpVerifySubmitted);
    on<CompleteRegistrationSubmitted>(_onCompleteRegistrationSubmitted);
    on<SocialLoginRequested>(_onSocialLoginRequested);
  }

  final LogoutUseCase logoutUseCase;
  final SendPhoneOtpUseCase sendPhoneOtpUseCase;
  final VerifyPhoneOtpUseCase verifyPhoneOtpUseCase;
  final CompleteRegistrationUseCase completeRegistrationUseCase;
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



  Future<void> _onLogoutRequested(
    LogoutRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const LogoutInProgress());
    await logoutUseCase(const NoParams());
    emit(const Unauthenticated());
  }

  // ── Social Login ───────────────────────────────────────────────────────────

  Future<void> _onSocialLoginRequested(
    SocialLoginRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const SocialLoginInProgress());
    
    try {
      SocialAuthResult? result;
      if (event.provider == 'google') {
        result = await SocialAuthService.signInWithGoogle();
      } else if (event.provider == 'apple') {
        result = await SocialAuthService.signInWithApple();
      } else if (event.provider == 'facebook') {
        result = await SocialAuthService.signInWithFacebook();
      }

      if (result == null) {
        emit(const SocialLoginFailure('Social login was canceled or failed.'));
        return;
      }

      final response = await authRepository.loginWithFirebase(idToken: result.idToken);
      response.fold(
        (failure) => emit(SocialLoginFailure(failure.message)),
        (authResponse) {
          if (authResponse.newUser) {
            emit(SocialLoginNewUser(
              firstName: result!.firstName,
              lastName: result.lastName,
              email: result.email,
            ));
          } else {
            emit(Authenticated(authResponse.user));
          }
        },
      );
    } catch (e) {
      emit(SocialLoginFailure(e.toString()));
    }
  }

  // ── Unified phone login/register (API v2) ──────────────────────────────────

  Future<void> _onPhoneOtpRequested(
    PhoneOtpRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(const PhoneOtpSendInProgress());
    final phone = event.phone.trim();
    final result = await sendPhoneOtpUseCase(SendPhoneOtpParams(phone: phone));
    result.fold(
      (failure) => emit(PhoneOtpSendFailure(failure.message)),
      (isExistingUser) =>
          emit(PhoneOtpSent(phone: phone, isExistingUser: isExistingUser)),
    );
  }

  Future<void> _onPhoneOtpVerifySubmitted(
    PhoneOtpVerifySubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(const PhoneOtpVerifyInProgress());
    final phone = event.phone.trim();
    final result = await verifyPhoneOtpUseCase(
      VerifyPhoneOtpParams(phone: phone, otp: event.otp.trim()),
    );
    result.fold((failure) => emit(PhoneOtpVerifyFailure(failure.message)), (
      verify,
    ) {
      if (verify.newUser || verify.user == null) {
        emit(PhoneOtpNewUser(verify.phone));
      } else {
        emit(PhoneOtpLoginSuccess(verify.user!));
      }
    });
  }

  Future<void> _onCompleteRegistrationSubmitted(
    CompleteRegistrationSubmitted event,
    Emitter<AuthState> emit,
  ) async {
    emit(const CompleteRegistrationInProgress());
    final result = await completeRegistrationUseCase(
      CompleteRegistrationParams(
        phone: event.phone.trim(),
        firstName: event.firstName.trim(),
        lastName: event.lastName.trim(),
        email: event.email?.trim(),
      ),
    );
    result.fold(
      (failure) => emit(CompleteRegistrationFailure(failure.message)),
      (user) => emit(CompleteRegistrationSuccess(user)),
    );
  }
}
