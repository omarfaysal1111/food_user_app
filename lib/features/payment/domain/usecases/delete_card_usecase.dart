import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_user_app/core/errors/failures.dart';
import 'package:food_user_app/core/usecases/usecase.dart';
import 'package:food_user_app/features/payment/domain/repositories/payment_repository.dart';

class DeleteCardUseCase implements UseCase<void, DeleteCardParams> {
  final PaymentRepository repository;

  DeleteCardUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(DeleteCardParams params) {
    return repository.deleteCard(params.cardId);
  }
}

class DeleteCardParams extends Equatable {
  final String cardId;

  const DeleteCardParams({required this.cardId});

  @override
  List<Object?> get props => [cardId];
}
