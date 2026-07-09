import 'package:dartz/dartz.dart';
import 'package:food_user_app/features/address/domain/repositories/address_repository.dart';
import 'package:food_user_app/features/address/domain/entities/address.dart';
import 'package:food_user_app/features/address/domain/models/address_request.dart';
import '../../../../core/errors/failures.dart';
import '../../../../core/usecases/usecase.dart';

class UpdateAddressParams {
  final String id;
  final AddressRequest request;

  const UpdateAddressParams({required this.id, required this.request});
}

class UpdateAddressUseCase extends UseCase<Address, UpdateAddressParams> {
  final AddressRepository repository;

  UpdateAddressUseCase(this.repository);

  @override
  Future<Either<Failure, Address>> call(UpdateAddressParams params) {
    return repository.updateAddress(id: params.id, request: params.request);
  }
}
