import 'package:freezed_annotation/freezed_annotation.dart';

part 'save_card_request_dto.freezed.dart';
part 'save_card_request_dto.g.dart';

@freezed
abstract class SaveCardRequestDto with _$SaveCardRequestDto {
  const factory SaveCardRequestDto({
    String? gatewayToken,
    String? gateway,
    String? brand,
    String? last4,
    int? expMonth,
    int? expYear,
    bool? makeDefault,
  }) = _SaveCardRequestDto;

  factory SaveCardRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SaveCardRequestDtoFromJson(json);
}
