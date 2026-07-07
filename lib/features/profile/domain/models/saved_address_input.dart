/// Pure domain value object for creating or updating a saved address.
/// ZERO dependencies on data layer.
class SavedAddressInput {
  const SavedAddressInput({
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
}
