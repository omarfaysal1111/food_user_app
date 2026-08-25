class CreateAddressRequest {
  final String? name;
  final String? fullAddress;
  final String? buildingNumber;
  final String? floor;
  final String? apartment;
  final double? lat;
  final double? lng;
  final String? type;

  const CreateAddressRequest({
    this.name,
    this.fullAddress,
    this.buildingNumber,
    this.floor,
    this.apartment,
    this.lat,
    this.lng,
    this.type,
  });

  Map<String, dynamic> toJson() {
    return {
      if (name != null) 'name': name,
      if (fullAddress != null) 'full_address': fullAddress,
      if (buildingNumber != null) 'building_number': buildingNumber,
      if (floor != null) 'floor': floor,
      if (apartment != null) 'apartment': apartment,
      if (lat != null) 'lat': lat,
      if (lng != null) 'long': lng,
      if (type != null) 'type': type,
    };
  }
}
