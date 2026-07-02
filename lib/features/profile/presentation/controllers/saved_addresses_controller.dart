import 'package:flutter/foundation.dart';

import 'package:food_user_app/features/profile/data/models/saved_address_dto.dart';
import 'package:food_user_app/features/profile/domain/models/saved_address.dart';
import 'package:food_user_app/features/profile/domain/repositories/saved_addresses_repository.dart';

class SavedAddressesController extends ChangeNotifier {
  SavedAddressesController({required SavedAddressesRepository repository})
    : _repository = repository;

  final SavedAddressesRepository _repository;

  List<SavedAddress> _addresses = const [];
  String? _selectedAddressId;
  bool _hasLoaded = false;
  bool _isLoading = false;
  bool _isMutating = false;
  Object? _lastError;

  List<SavedAddress> get addresses => List.unmodifiable(_addresses);

  String? get selectedAddressId => _selectedAddressId;

  bool get hasLoaded => _hasLoaded;

  bool get isLoading => _isLoading;

  bool get isMutating => _isMutating;

  bool get hasError => _lastError != null;

  Object? get lastError => _lastError;

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

  Future<void> loadAddressesIfNeeded() async {
    if (_hasLoaded || _isLoading) return;
    await loadAddresses();
  }

  Future<void> loadAddresses() async {
    _isLoading = true;
    _lastError = null;
    notifyListeners();
    try {
      final addresses = await _repository.getAddresses();
      _setAddresses(addresses);
      _hasLoaded = true;
    } catch (error) {
      _lastError = error;
      _addresses = const [];
      _selectedAddressId = null;
      _hasLoaded = true;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<bool> selectAddress(String id) async {
    if (_selectedAddressId == id || !_addresses.any((item) => item.id == id)) {
      return true;
    }
    final previousId = _selectedAddressId;
    _selectedAddressId = id;
    _addresses = [
      for (final address in _addresses)
        address.copyWith(isDefault: address.id == id),
    ];
    _lastError = null;
    notifyListeners();

    try {
      await _repository.setDefaultAddress(id);
      await loadAddresses();
      return true;
    } catch (error) {
      _lastError = error;
      _selectedAddressId = previousId;
      _addresses = [
        for (final address in _addresses)
          address.copyWith(isDefault: address.id == previousId),
      ];
      notifyListeners();
      return false;
    }
  }

  Future<bool> addAddress(SavedAddressRequest request) async {
    _logAddressDebug(
      'SavedAddressesController.addAddress body=${request.toJson()}',
    );
    return _mutate(() async {
      await _repository.createAddress(request);
      await loadAddresses();
    });
  }

  Future<bool> updateAddress({
    required String id,
    required SavedAddressRequest request,
  }) async {
    return _mutate(() async {
      await _repository.updateAddress(id: id, request: request);
      await loadAddresses();
    });
  }

  Future<bool> deleteAddress(String id) async {
    return _mutate(() async {
      final wasSelected = _selectedAddressId == id;
      await _repository.deleteAddress(id);
      await loadAddresses();
      if (wasSelected && _addresses.isNotEmpty && _selectedAddressId == null) {
        await selectAddress(_addresses.first.id);
      }
    });
  }

  Future<bool> _mutate(Future<void> Function() action) async {
    if (_isMutating) return false;
    _isMutating = true;
    _lastError = null;
    notifyListeners();
    try {
      await action();
      return true;
    } catch (error) {
      _lastError = error;
      notifyListeners();
      return false;
    } finally {
      _isMutating = false;
      notifyListeners();
    }
  }

  void _setAddresses(List<SavedAddress> addresses) {
    _addresses = addresses;
    if (_addresses.isEmpty) {
      _selectedAddressId = null;
      return;
    }

    final defaultAddress = _addresses.where((address) => address.isDefault);
    final currentStillExists =
        _selectedAddressId != null && addressById(_selectedAddressId!) != null;
    _selectedAddressId = defaultAddress.isNotEmpty
        ? defaultAddress.first.id
        : currentStillExists
        ? _selectedAddressId
        : _addresses.first.id;
  }
}

void _logAddressDebug(String message) {
  if (kDebugMode) {
    debugPrint('[ADDRESS_DEBUG] $message');
  }
}
