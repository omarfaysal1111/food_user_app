import 'package:equatable/equatable.dart';

class SupportMessage extends Equatable {
  final String id;
  final String senderId;
  final String senderRole;
  final String content;
  final DateTime sentAt;

  const SupportMessage({
    required this.id,
    required this.senderId,
    required this.senderRole,
    required this.content,
    required this.sentAt,
  });

  @override
  List<Object?> get props => [id, senderId, senderRole, content, sentAt];
}
