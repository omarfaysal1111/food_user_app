import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/home/domain/entities/banner.dart';

part 'banner_dto.freezed.dart';
part 'banner_dto.g.dart';

@freezed
abstract class BannerDto with _$BannerDto {
  const factory BannerDto({
    required String id,
    String? imageUrl,
    String? title,
    String? subtitle,
    String? ctaText,
    String? discountText,
    String? deepLink,
    int? sortOrder,
    bool? active,
  }) = _BannerDto;

  factory BannerDto.fromJson(Map<String, dynamic> json) =>
      _$BannerDtoFromJson(json);
}

extension BannerDtoMapper on BannerDto {
  BannerItem toEntity() {
    return BannerItem(
      id: id,
      imageUrl: imageUrl ?? '',
      title: title ?? '',
      subtitle: subtitle ?? '',
      ctaText: ctaText ?? '',
      discountText: discountText ?? '',
      deepLink: deepLink ?? '',
      sortOrder: sortOrder ?? 0,
    );
  }
}
