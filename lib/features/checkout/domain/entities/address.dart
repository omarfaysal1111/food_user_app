class Address {
  final String id;
  final String label;
  final String fullAddress;
  final double lat;
  final double lng;
  final String city;
  final String neighborhood;
  final String streetNumber;
  final String buildingNumber;
  final String floor;
  final String apartment;
  final String addressType;
  final bool isDefault;

  const Address({
    required this.id,
    required this.label,
    required this.fullAddress,
    required this.lat,
    required this.lng,
    required this.city,
    required this.neighborhood,
    required this.streetNumber,
    required this.buildingNumber,
    required this.floor,
    required this.apartment,
    required this.addressType,
    required this.isDefault,
  });
}
