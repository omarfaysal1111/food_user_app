import 'package:flutter/foundation.dart';

import 'package:food_user_app/features/profile/domain/models/saved_address.dart';

class SavedAddressesController extends ChangeNotifier {
  SavedAddressesController()
    : _addresses = _mockAddresses,
      _selectedAddressId = _mockAddresses.first.id;

  List<SavedAddress> _addresses;
  String? _selectedAddressId;

  List<SavedAddress> get addresses => List.unmodifiable(_addresses);

  String? get selectedAddressId => _selectedAddressId;

  SavedAddress? get selectedAddress {
    final selectedId = _selectedAddressId;
    if (selectedId == null) return null;

    return addressById(selectedId);
  }

  SavedAddress? addressById(String id) {
    for (final address in _addresses) {
      if (address.id == id) return address;
    }
    return null;
  }

  void selectAddress(String id) {
    if (_selectedAddressId == id || !_addresses.any((item) => item.id == id)) {
      return;
    }
    _selectedAddressId = id;
    notifyListeners();
  }

  void addAddress(SavedAddress address) {
    _addresses = [..._addresses, address];
    _selectedAddressId ??= address.id;
    notifyListeners();
  }

  void updateAddress(SavedAddress address) {
    if (!_addresses.any((item) => item.id == address.id)) return;

    _addresses = [
      for (final item in _addresses)
        if (item.id == address.id) address else item,
    ];
    notifyListeners();
  }

  void deleteAddress(String id) {
    final nextAddresses = _addresses
        .where((address) => address.id != id)
        .toList(growable: false);
    if (nextAddresses.length == _addresses.length) return;

    _addresses = nextAddresses;
    if (_selectedAddressId == id) {
      _selectedAddressId = _addresses.isEmpty ? null : _addresses.first.id;
    }
    notifyListeners();
  }

  static const _mockAddresses = [
    SavedAddress(
      id: 'apartment-madinaty',
      titleAr: 'الشقة',
      titleEn: 'Apartment',
      detailsAr: 'مبنى : السعدني / شقة : 201 / الدور : الخامس',
      detailsEn: 'Building: El Saadany / Apartment: 201 / Floor: Fifth',
      locationAr: 'القاهره الجديده ، مدينتي ، حي الزهور',
      locationEn: 'New Cairo, Madinaty, Al Zuhour District',
      latitude: 30.0444,
      longitude: 31.2357,
    ),
    SavedAddress(
      id: 'work-maadi',
      titleAr: 'العمل',
      titleEn: 'Work',
      detailsAr: 'مبنى : النيل / مكتب : 12 / الدور : الثالث',
      detailsEn: 'Building: Nile / Office: 12 / Floor: Third',
      locationAr: 'القاهرة ، المعادي ، كورنيش النيل',
      locationEn: 'Cairo, Maadi, Nile Corniche',
      latitude: 29.9602,
      longitude: 31.2569,
    ),
  ];
}
