import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

/// Unified flow: `POST /api/v2/auth/otp/verify` `{ phone, otp }`.
/// Existing account → session persisted; new phone → [PhoneVerifyResult.newUser].
class VerifyPhoneOtpUseCase
    extends UseCase<PhoneVerifyResult, VerifyPhoneOtpParams> {
  VerifyPhoneOtpUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, PhoneVerifyResult>> call(VerifyPhoneOtpParams params) {
    return _repository.verifyPhoneOtp(phone: params.phone, otp: params.otp);
  }
}

class VerifyPhoneOtpParams extends Equatable {
  final String phone;
  final String otp;

  const VerifyPhoneOtpParams({required this.phone, required this.otp});

  @override
  List<Object?> get props => [phone, otp];
}
