/// Pure domain value object for creating/updating an address.
/// Contains ZERO dependencies on data layer (no Freezed, no JSON).
class AddressRequest {
  const AddressRequest({
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
    this.isDefault,
  });

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
  final bool? isDefault;
}
