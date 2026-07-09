import 'package:dartz/dartz.dart';
import 'package:food_user_app/core/errors/failures.dart';
import 'package:food_user_app/core/usecases/usecase.dart';
import 'package:food_user_app/features/support/domain/entities/support_message.dart';
import 'package:food_user_app/features/support/domain/repositories/support_repository.dart';

class GetMessagesUseCase implements UseCase<List<SupportMessage>, String> {
  final SupportRepository repository;

  GetMessagesUseCase(this.repository);

  @override
  Future<Either<Failure, List<SupportMessage>>> call(String ticketId) async {
    return await repository.getMessages(ticketId);
  }
}
