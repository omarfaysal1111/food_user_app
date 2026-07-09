import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/support/domain/entities/support_message.dart';

part 'support_message_dto.freezed.dart';
part 'support_message_dto.g.dart';

@freezed
abstract class SupportMessageDto with _$SupportMessageDto {
  const factory SupportMessageDto({
    required String id,
    required String senderId,
    required String senderRole,
    required String content,
    required DateTime sentAt,
  }) = _SupportMessageDto;

  factory SupportMessageDto.fromJson(Map<String, dynamic> json) =>
      _$SupportMessageDtoFromJson(json);
}

extension SupportMessageDtoX on SupportMessageDto {
  SupportMessage toEntity() {
    return SupportMessage(
      id: id,
      senderId: senderId,
      senderRole: senderRole,
      content: content,
      sentAt: sentAt,
    );
  }
}
