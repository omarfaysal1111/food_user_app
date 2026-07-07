import 'package:dartz/dartz.dart';
import 'package:food_user_app/core/errors/failures.dart';
import 'package:food_user_app/features/address/domain/entities/address.dart';
import 'package:food_user_app/features/address/domain/models/address_request.dart';

abstract class AddressRepository {
  Future<Either<Failure, List<Address>>> getAddresses();

  Future<Either<Failure, Address>> createAddress(AddressRequest request);

  Future<Either<Failure, Address>> updateAddress({
    required String id,
    required AddressRequest request,
  });

  Future<Either<Failure, Unit>> deleteAddress(String id);

  Future<Either<Failure, Address>> setDefaultAddress(String id);
}
