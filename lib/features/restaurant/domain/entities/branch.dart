import 'package:equatable/equatable.dart';

class Branch extends Equatable {
  final String id;
  final String restaurantId;
  final String address;
  final double lat;
  final double lng;
  final Map<String, dynamic> operatingHours;
  final bool active;

  const Branch({
    required this.id,
    required this.restaurantId,
    required this.address,
    required this.lat,
    required this.lng,
    required this.operatingHours,
    required this.active,
  });

  @override
  List<Object?> get props => [
        id,
        restaurantId,
        address,
        lat,
        lng,
        operatingHours,
        active,
      ];
}
