import 'package:food_user_app/features/profile/data/models/saved_address_dto.dart';
import 'package:food_user_app/features/profile/domain/models/saved_address.dart';

abstract class SavedAddressesRepository {
  Future<List<SavedAddress>> getAddresses();

  Future<SavedAddress> createAddress(SavedAddressRequest request);

  Future<SavedAddress> updateAddress({
    required String id,
    required SavedAddressRequest request,
  });

  Future<void> deleteAddress(String id);

  Future<void> setDefaultAddress(String id);
}
