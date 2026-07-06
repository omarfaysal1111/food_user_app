import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/address/domain/entities/address.dart';

part 'address_dto.freezed.dart';
part 'address_dto.g.dart';

@freezed
abstract class AddressDto with _$AddressDto {
  const factory AddressDto({
    required String id,
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
  }) = _AddressDto;

  factory AddressDto.fromJson(Map<String, dynamic> json) =>
      _$AddressDtoFromJson(json);
}

extension AddressDtoMapper on AddressDto {
  Address toEntity() {
    return Address(
      id: id,
      label: label ?? '',
      fullAddress: fullAddress ?? '',
      lat: lat ?? 0.0,
      lng: lng ?? 0.0,
      city: city ?? '',
      neighborhood: neighborhood ?? '',
      streetNumber: streetNumber ?? '',
      buildingNumber: buildingNumber ?? '',
      floor: floor ?? '',
      apartment: apartment ?? '',
      addressType: addressType ?? 'OTHER',
      isDefault: isDefault ?? false,
    );
  }
}
