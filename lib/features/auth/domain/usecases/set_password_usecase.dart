import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

/// Triggers `POST /auth/set-password` for the currently authenticated user.
/// The endpoint body is `{ newPassword }` only — no email, no old password,
/// no confirm password. The Bearer token is attached by [AuthInterceptor].
class SetPasswordUseCase extends UseCase<Unit, SetPasswordParams> {
  SetPasswordUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, Unit>> call(SetPasswordParams params) {
    return _repository.setPassword(newPassword: params.newPassword);
  }
}

class SetPasswordParams extends Equatable {
  final String newPassword;

  const SetPasswordParams({required this.newPassword});

  @override
  List<Object?> get props => [newPassword];
}
