import 'package:dartz/dartz.dart';
import 'package:food_user_app/features/address/domain/repositories/address_repository.dart';
import 'package:food_user_app/features/address/domain/entities/address.dart';
import 'package:food_user_app/features/address/domain/models/address_request.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class SaveAddressUseCase extends UseCase<Address, AddressRequest> {
  final AddressRepository repository;

  SaveAddressUseCase(this.repository);

  @override
  Future<Either<Failure, Address>> call(AddressRequest params) {
    return repository.createAddress(params);
  }
}
