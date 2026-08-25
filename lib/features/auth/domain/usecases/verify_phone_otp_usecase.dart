import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

/// `POST /api/v1/auth/phone/verify-otp` — verifies [otp] for [phone].
///
/// Returns [AuthFlowResult]:
/// - `isAuthenticated = true`  → existing user, session persisted.
/// - `isAuthenticated = false` → new user, [registrationToken] is set.
class VerifyPhoneOtpUseCase
    extends UseCase<AuthFlowResult, VerifyPhoneOtpParams> {
  VerifyPhoneOtpUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, AuthFlowResult>> call(VerifyPhoneOtpParams params) {
    return _repository.verifyPhoneOtp(
      phone: params.phone,
      otp: params.otp,
      registrationToken: params.registrationToken,
    );
  }
}

class VerifyPhoneOtpParams extends Equatable {
  final String phone;
  final String otp;
  final String? registrationToken;

  const VerifyPhoneOtpParams({
    required this.phone,
    required this.otp,
    this.registrationToken,
  });

  @override
  List<Object?> get props => [phone, otp, registrationToken];
}
