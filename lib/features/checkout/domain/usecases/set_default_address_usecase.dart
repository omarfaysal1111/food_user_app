import 'package:dartz/dartz.dart';
import 'package:food_user_app/features/address/domain/repositories/address_repository.dart';
import 'package:food_user_app/features/address/domain/entities/address.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class SetDefaultAddressUseCase extends UseCase<Address, String> {
  final AddressRepository repository;

  SetDefaultAddressUseCase(this.repository);

  @override
  Future<Either<Failure, Address>> call(String params) {
    return repository.setDefaultAddress(params);
  }
}
