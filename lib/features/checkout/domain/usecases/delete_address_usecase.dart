import 'package:dartz/dartz.dart';
import 'package:food_user_app/features/address/domain/repositories/address_repository.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class DeleteAddressUseCase extends UseCase<Unit, String> {
  final AddressRepository repository;

  DeleteAddressUseCase(this.repository);

  @override
  Future<Either<Failure, Unit>> call(String params) {
    return repository.deleteAddress(params);
  }
}
