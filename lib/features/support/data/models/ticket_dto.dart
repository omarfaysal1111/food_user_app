import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/support/domain/entities/ticket.dart';

part 'ticket_dto.freezed.dart';
part 'ticket_dto.g.dart';

@freezed
abstract class TicketDto with _$TicketDto {
  const factory TicketDto({
    required String id,
    required String userId,
    required String subject,
    required String status,
    String? assigneeId,
    required DateTime createdAt,
    required DateTime updatedAt,
  }) = _TicketDto;

  factory TicketDto.fromJson(Map<String, dynamic> json) =>
      _$TicketDtoFromJson(json);
}

extension TicketDtoX on TicketDto {
  Ticket toEntity() {
    return Ticket(
      id: id,
      userId: userId,
      subject: subject,
      status: status,
      assigneeId: assigneeId,
      createdAt: createdAt,
      updatedAt: updatedAt,
    );
  }
}
