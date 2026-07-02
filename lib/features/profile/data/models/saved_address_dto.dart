import 'package:food_user_app/features/profile/domain/models/saved_address.dart';

class SavedAddressDto {
  const SavedAddressDto({
    required this.id,
    this.label,
    this.fullAddress,
    this.lat,
    this.lng,
    this.city,
    this.neighborhood,
    this.streetNumber,
    this.buildingNumber,
    this.floor,
    this.apartment,
    this.addressType,
    this.isDefault = false,
  });

  final String id;
  final String? label;
  final String? fullAddress;
  final double? lat;
  final double? lng;
  final String? city;
  final String? neighborhood;
  final String? streetNumber;
  final String? buildingNumber;
  final String? floor;
  final String? apartment;
  final String? addressType;
  final bool isDefault;

  factory SavedAddressDto.fromJson(Map<String, dynamic> json) {
    return SavedAddressDto(
      id: _readString(json, 'id') ?? '',
      label: _readString(json, 'label'),
      fullAddress: _readString(json, 'fullAddress'),
      lat: _readDouble(json, 'lat'),
      lng: _readDouble(json, 'lng'),
      city: _readString(json, 'city'),
      neighborhood: _readString(json, 'neighborhood'),
      streetNumber: _readString(json, 'streetNumber'),
      buildingNumber: _readString(json, 'buildingNumber'),
      floor: _readString(json, 'floor'),
      apartment: _readString(json, 'apartment'),
      addressType: _readString(json, 'addressType'),
      isDefault: json['default'] == true || json['isDefault'] == true,
    );
  }

  SavedAddress toEntity() {
    final title = _nonEmpty(label) ?? _addressTypeLabel(addressType);
    final details = _detailsText();
    final location = _locationText();

    return SavedAddress(
      id: id,
      titleAr: title,
      titleEn: title,
      detailsAr: details,
      detailsEn: details,
      locationAr: location,
      locationEn: location,
      latitude: lat ?? 0,
      longitude: lng ?? 0,
      fullAddress: fullAddress,
      city: city,
      neighborhood: neighborhood,
      streetNumber: streetNumber,
      buildingNumber: buildingNumber,
      floor: floor,
      apartment: apartment,
      addressType: addressType,
      isDefault: isDefault,
    );
  }

  String _detailsText() {
    final parts = <String>[
      if (_nonEmpty(buildingNumber) != null) 'Building: ${buildingNumber!}',
      if (_nonEmpty(apartment) != null) 'Apartment: ${apartment!}',
      if (_nonEmpty(floor) != null) 'Floor: ${floor!}',
    ];
    return parts.isEmpty ? _locationText() : parts.join(' / ');
  }

  String _locationText() {
    final full = _nonEmpty(fullAddress);
    if (full != null) return full;
    return [
      city,
      neighborhood,
      streetNumber,
    ].map(_nonEmpty).whereType<String>().join(', ');
  }

  static String _addressTypeLabel(String? value) {
    return switch (value?.toUpperCase()) {
      'HOME' => 'Home',
      'WORK' => 'Work',
      'APARTMENT' => 'Apartment',
      _ => 'Address',
    };
  }
}

class SavedAddressRequest {
  const SavedAddressRequest({
    required this.label,
    required this.fullAddress,
    required this.lat,
    required this.lng,
    this.city,
    this.neighborhood,
    this.streetNumber,
    this.buildingNumber,
    this.floor,
    this.apartment,
    this.addressType = 'APARTMENT',
    this.isDefault = false,
  });

  final String label;
  final String fullAddress;
  final double lat;
  final double lng;
  final String? city;
  final String? neighborhood;
  final String? streetNumber;
  final String? buildingNumber;
  final String? floor;
  final String? apartment;
  final String addressType;
  final bool isDefault;

  Map<String, dynamic> toJson() {
    return {
      'label': label,
      'fullAddress': fullAddress,
      'lat': lat,
      'lng': lng,
      if (_nonEmpty(city) != null) 'city': city!.trim(),
      if (_nonEmpty(neighborhood) != null) 'neighborhood': neighborhood!.trim(),
      if (_nonEmpty(streetNumber) != null) 'streetNumber': streetNumber!.trim(),
      if (_nonEmpty(buildingNumber) != null)
        'buildingNumber': buildingNumber!.trim(),
      if (_nonEmpty(floor) != null) 'floor': floor!.trim(),
      if (_nonEmpty(apartment) != null) 'apartment': apartment!.trim(),
      'addressType': addressType,
      'default': isDefault,
    };
  }
}

String? _readString(Map<String, dynamic> json, String key) {
  final value = json[key];
  if (value == null) return null;
  return _nonEmpty(value.toString());
}

double? _readDouble(Map<String, dynamic> json, String key) {
  final value = json[key];
  if (value is num) return value.toDouble();
  if (value is String) return double.tryParse(value);
  return null;
}

String? _nonEmpty(String? value) {
  final trimmed = value?.trim();
  return trimmed == null || trimmed.isEmpty ? null : trimmed;
}
