import 'package:dartz/dartz.dart';
import 'package:food_user_app/core/errors/failures.dart';
import 'package:food_user_app/features/address/data/models/create_address_request.dart';
import 'package:food_user_app/features/address/domain/entities/address.dart';

abstract class AddressRepository {
  Future<Either<Failure, List<Address>>> getAddresses();

  Future<Either<Failure, Address>> createAddress(CreateAddressRequest request);

  Future<Either<Failure, Address>> updateAddress({
    required String id,
    required CreateAddressRequest request,
  });

  Future<Either<Failure, Unit>> deleteAddress(String id);

  Future<Either<Failure, Address>> setDefaultAddress(String id);
}
