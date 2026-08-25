import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

/// `POST /api/v1/auth/phone/send-otp` — sends OTP to [phone].
class SendPhoneOtpUseCase extends UseCase<void, SendPhoneOtpParams> {
  SendPhoneOtpUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, void>> call(SendPhoneOtpParams params) {
    return _repository.sendPhoneOtp(phone: params.phone);
  }
}

class SendPhoneOtpParams extends Equatable {
  final String phone;

  const SendPhoneOtpParams({required this.phone});

  @override
  List<Object?> get props => [phone];
}
