import 'package:dartz/dartz.dart';
import 'package:food_user_app/core/errors/failures.dart';
import 'package:food_user_app/features/support/domain/entities/support_message.dart';
import 'package:food_user_app/features/support/domain/entities/ticket.dart';

abstract class SupportRepository {
  Future<Either<Failure, Ticket>> createTicket({
    required String subject,
    required String message,
  });

  Future<Either<Failure, List<SupportMessage>>> getMessages(String ticketId);

  Future<Either<Failure, SupportMessage>> sendMessage({
    required String ticketId,
    required String content,
  });
}
