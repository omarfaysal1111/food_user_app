import 'package:flutter/foundation.dart';

import 'package:food_user_app/features/profile/data/datasources/saved_addresses_remote_data_source.dart';
import 'package:food_user_app/features/profile/data/models/saved_address_dto.dart';
import 'package:food_user_app/features/profile/domain/models/saved_address.dart';
import 'package:food_user_app/features/profile/domain/repositories/saved_addresses_repository.dart';

class SavedAddressesRepositoryImpl implements SavedAddressesRepository {
  const SavedAddressesRepositoryImpl({required this.remoteDataSource});

  final SavedAddressesRemoteDataSource remoteDataSource;

  @override
  Future<List<SavedAddress>> getAddresses() async {
    final dtos = await remoteDataSource.getAddresses();
    return dtos.map((dto) => dto.toEntity()).toList(growable: false);
  }

  @override
  Future<SavedAddress> createAddress(SavedAddressRequest request) async {
    _logAddressDebug(
      'SavedAddressesRepository.createAddress body=${request.toJson()}',
    );
    return (await remoteDataSource.createAddress(request)).toEntity();
  }

  @override
  Future<SavedAddress> updateAddress({
    required String id,
    required SavedAddressRequest request,
  }) async {
    return (await remoteDataSource.updateAddress(
      id: id,
      request: request,
    )).toEntity();
  }

  @override
  Future<void> deleteAddress(String id) {
    return remoteDataSource.deleteAddress(id);
  }

  @override
  Future<void> setDefaultAddress(String id) {
    return remoteDataSource.setDefaultAddress(id);
  }
}

void _logAddressDebug(String message) {
  if (kDebugMode) {
    debugPrint('[ADDRESS_DEBUG] $message');
  }
}
