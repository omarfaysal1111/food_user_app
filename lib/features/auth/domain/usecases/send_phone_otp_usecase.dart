import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

/// Unified flow: `POST /api/v2/auth/otp/send` `{ phone }`.
/// Returns `isExistingUser` so the UI can hint login vs. sign-up.
class SendPhoneOtpUseCase extends UseCase<bool, SendPhoneOtpParams> {
  SendPhoneOtpUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, bool>> call(SendPhoneOtpParams params) {
    return _repository.sendPhoneOtp(phone: params.phone);
  }
}

class SendPhoneOtpParams extends Equatable {
  final String phone;

  const SendPhoneOtpParams({required this.phone});

  @override
  List<Object?> get props => [phone];
}
