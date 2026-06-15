import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:food_user_app/features/auth/domain/entities/user.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

/// Unified flow: `POST /api/v2/auth/register` for a freshly-verified phone.
class CompleteRegistrationUseCase
    extends UseCase<User, CompleteRegistrationParams> {
  CompleteRegistrationUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, User>> call(CompleteRegistrationParams params) {
    return _repository.completeRegistration(
      phone: params.phone,
      firstName: params.firstName,
      lastName: params.lastName,
      email: params.email,
    );
  }
}

class CompleteRegistrationParams extends Equatable {
  final String phone;
  final String firstName;
  final String lastName;
  final String? email;

  const CompleteRegistrationParams({
    required this.phone,
    required this.firstName,
    required this.lastName,
    this.email,
  });

  @override
  List<Object?> get props => [phone, firstName, lastName, email];
}
