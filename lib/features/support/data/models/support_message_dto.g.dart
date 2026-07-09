// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_message_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SupportMessageDto _$SupportMessageDtoFromJson(Map<String, dynamic> json) =>
    _SupportMessageDto(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      senderRole: json['senderRole'] as String,
      content: json['content'] as String,
      sentAt: DateTime.parse(json['sentAt'] as String),
    );

Map<String, dynamic> _$SupportMessageDtoToJson(_SupportMessageDto instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'senderRole': instance.senderRole,
      'content': instance.content,
      'sentAt': instance.sentAt.toIso8601String(),
    };
