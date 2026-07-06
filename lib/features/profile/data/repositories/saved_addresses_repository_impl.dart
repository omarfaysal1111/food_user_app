import 'package:food_user_app/features/address/data/models/create_address_request.dart';
import 'package:food_user_app/features/address/domain/entities/address.dart';
import 'package:food_user_app/features/address/domain/repositories/address_repository.dart';
import 'package:food_user_app/features/profile/data/models/saved_address_dto.dart';
import 'package:food_user_app/features/profile/domain/models/saved_address.dart';
import 'package:food_user_app/features/profile/domain/repositories/saved_addresses_repository.dart';

class SavedAddressesRepositoryImpl implements SavedAddressesRepository {
  const SavedAddressesRepositoryImpl({required this.addressRepository});

  final AddressRepository addressRepository;

  @override
  Future<List<SavedAddress>> getAddresses() async {
    final result = await addressRepository.getAddresses();
    return result.fold(
      (failure) => throw Exception(failure.message),
      (list) => list.map(_mapToSavedAddress).toList(growable: false),
    );
  }

  @override
  Future<SavedAddress> createAddress(SavedAddressRequest request) async {
    final createRequest = CreateAddressRequest(
      label: request.label,
      fullAddress: request.fullAddress,
      lat: request.lat,
      lng: request.lng,
      city: request.city,
      neighborhood: request.neighborhood,
      streetNumber: request.streetNumber,
      buildingNumber: request.buildingNumber,
      floor: request.floor,
      apartment: request.apartment,
      addressType: request.addressType,
      isDefault: request.isDefault,
    );
    final result = await addressRepository.createAddress(createRequest);
    return result.fold(
      (failure) => throw Exception(failure.message),
      (address) => _mapToSavedAddress(address),
    );
  }

  @override
  Future<SavedAddress> updateAddress({
    required String id,
    required SavedAddressRequest request,
  }) async {
    final updateRequest = CreateAddressRequest(
      label: request.label,
      fullAddress: request.fullAddress,
      lat: request.lat,
      lng: request.lng,
      city: request.city,
      neighborhood: request.neighborhood,
      streetNumber: request.streetNumber,
      buildingNumber: request.buildingNumber,
      floor: request.floor,
      apartment: request.apartment,
      addressType: request.addressType,
      isDefault: request.isDefault,
    );
    final result = await addressRepository.updateAddress(
      id: id,
      request: updateRequest,
    );
    return result.fold(
      (failure) => throw Exception(failure.message),
      (address) => _mapToSavedAddress(address),
    );
  }

  @override
  Future<void> deleteAddress(String id) async {
    final result = await addressRepository.deleteAddress(id);
    return result.fold(
      (failure) => throw Exception(failure.message),
      (_) => null,
    );
  }

  @override
  Future<void> setDefaultAddress(String id) async {
    final result = await addressRepository.setDefaultAddress(id);
    return result.fold(
      (failure) => throw Exception(failure.message),
      (_) => null,
    );
  }

  SavedAddress _mapToSavedAddress(Address address) {
    final title = address.label.isNotEmpty
        ? address.label
        : _addressTypeLabel(address.addressType);
    final details = _detailsText(address);
    final location = _locationText(address);

    return SavedAddress(
      id: address.id,
      titleAr: title,
      titleEn: title,
      detailsAr: details,
      detailsEn: details,
      locationAr: location,
      locationEn: location,
      latitude: address.lat,
      longitude: address.lng,
      fullAddress: address.fullAddress,
      city: address.city,
      neighborhood: address.neighborhood,
      streetNumber: address.streetNumber,
      buildingNumber: address.buildingNumber,
      floor: address.floor,
      apartment: address.apartment,
      addressType: address.addressType,
      isDefault: address.isDefault,
    );
  }

  String _addressTypeLabel(String? value) {
    return switch (value?.toUpperCase()) {
      'HOME' => 'Home',
      'WORK' => 'Work',
      'APARTMENT' => 'Apartment',
      _ => 'Other',
    };
  }

  String _detailsText(Address address) {
    final parts = <String>[
      if (address.buildingNumber.isNotEmpty)
        'Building: ${address.buildingNumber}',
      if (address.apartment.isNotEmpty) 'Apartment: ${address.apartment}',
      if (address.floor.isNotEmpty) 'Floor: ${address.floor}',
    ];
    return parts.isEmpty ? _locationText(address) : parts.join(' / ');
  }

  String _locationText(Address address) {
    if (address.fullAddress.isNotEmpty) return address.fullAddress;
    return [
      address.city,
      address.neighborhood,
      address.streetNumber,
    ].where((p) => p.isNotEmpty).join(', ');
  }
}
