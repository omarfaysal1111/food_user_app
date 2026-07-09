// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticket_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TicketDto _$TicketDtoFromJson(Map<String, dynamic> json) => _TicketDto(
  id: json['id'] as String,
  userId: json['userId'] as String,
  subject: json['subject'] as String,
  status: json['status'] as String,
  assigneeId: json['assigneeId'] as String?,
  createdAt: DateTime.parse(json['createdAt'] as String),
  updatedAt: DateTime.parse(json['updatedAt'] as String),
);

Map<String, dynamic> _$TicketDtoToJson(_TicketDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'subject': instance.subject,
      'status': instance.status,
      'assigneeId': instance.assigneeId,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
    };
