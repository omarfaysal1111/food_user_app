import 'package:dartz/dartz.dart';
import 'package:food_user_app/features/address/domain/repositories/address_repository.dart';
import 'package:food_user_app/features/address/domain/entities/address.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class GetSavedAddressesUseCase extends UseCase<List<Address>, NoParams> {
  final AddressRepository repository;

  GetSavedAddressesUseCase(this.repository);

  @override
  Future<Either<Failure, List<Address>>> call(NoParams params) {
    return repository.getAddresses();
  }
}
