import 'package:freezed_annotation/freezed_annotation.dart';

part 'create_address_request.freezed.dart';
part 'create_address_request.g.dart';

@freezed
abstract class CreateAddressRequest with _$CreateAddressRequest {
  const factory CreateAddressRequest({
    String? label,
    String? fullAddress,
    double? lat,
    double? lng,
    String? city,
    String? neighborhood,
    String? streetNumber,
    String? buildingNumber,
    String? floor,
    String? apartment,
    String? addressType,
    @JsonKey(name: 'default') bool? isDefault,
  }) = _CreateAddressRequest;

  factory CreateAddressRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateAddressRequestFromJson(json);
}
