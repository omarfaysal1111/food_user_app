import 'package:food_user_app/features/profile/domain/models/saved_address.dart';
import 'package:food_user_app/features/profile/domain/models/saved_address_input.dart';

abstract class SavedAddressesRepository {
  Future<List<SavedAddress>> getAddresses();

  Future<SavedAddress> createAddress(SavedAddressInput input);

  Future<SavedAddress> updateAddress({
    required String id,
    required SavedAddressInput input,
  });

  Future<void> deleteAddress(String id);

  Future<void> setDefaultAddress(String id);
}
