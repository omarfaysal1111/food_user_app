import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/restaurant/domain/entities/branch.dart';

part 'branch_dto.freezed.dart';
part 'branch_dto.g.dart';

@freezed
abstract class BranchDto with _$BranchDto {
  const factory BranchDto({
    required String id,
    String? restaurantId,
    String? address,
    double? lat,
    double? lng,
    Map<String, dynamic>? operatingHours,
    bool? active,
  }) = _BranchDto;

  factory BranchDto.fromJson(Map<String, dynamic> json) =>
      _$BranchDtoFromJson(json);
}

extension BranchDtoMapper on BranchDto {
  Branch toEntity() {
    return Branch(
      id: id,
      restaurantId: restaurantId ?? '',
      address: address ?? '',
      lat: lat ?? 0.0,
      lng: lng ?? 0.0,
      operatingHours: operatingHours ?? {},
      active: active ?? false,
    );
  }
}
