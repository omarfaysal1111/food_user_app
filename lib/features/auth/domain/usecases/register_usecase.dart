import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_user_app/features/auth/domain/entities/user.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';
import '../repositories/auth_repository.dart';

class RegisterUseCase extends UseCase<User, RegisterParams> {
  RegisterUseCase(this._repository);

  final AuthRepository _repository;

  @override
  Future<Either<Failure, User>> call(RegisterParams params) {
    return _repository.register(
      name: params.name,
      email: params.email,
      password: params.password,
      phone: params.phone,
      role: params.role,
    );
  }
}

class RegisterParams extends Equatable {
  final String name;
  final String email;
  final String password;
  final String phone;
  final String role;

  const RegisterParams({
    required this.name,
    required this.email,
    required this.password,
    required this.phone,
    this.role = 'ROLE_CUSTOMER',
  });

  @override
  List<Object?> get props => [name, email, password, phone, role];
}
