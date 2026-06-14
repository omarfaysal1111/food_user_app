import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

/// Triggers `POST /auth/otp/send` for the forgot-password flow.
/// Customer-app scope: [role] is fixed to `ROLE_CUSTOMER` by default.
class ForgotPasswordUseCase extends UseCase<Unit, ForgotPasswordParams> {
  ForgotPasswordUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(ForgotPasswordParams params) {
    return _repository.sendOtp(email: params.email, role: params.role);
  }
}

class ForgotPasswordParams extends Equatable {
  final String email;
  final String role;

  const ForgotPasswordParams({
    required this.email,
    this.role = 'ROLE_CUSTOMER',
  });

  @override
  List<Object?> get props => [email, role];
}
