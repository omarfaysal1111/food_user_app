enum ServiceListingType {
  restaurants('restaurants'),
  grocery('grocery'),
  stores('stores'),
  pickup('pickup');

  const ServiceListingType(this.pathSegment);

  final String pathSegment;

  static ServiceListingType fromPathSegment(String? value) {
    return ServiceListingType.values.firstWhere(
      (type) => type.pathSegment == value,
      orElse: () => ServiceListingType.restaurants,
    );
  }
}
