import 'package:dartz/dartz.dart';
import 'package:food_user_app/core/errors/failures.dart';
import 'package:food_user_app/core/usecases/usecase.dart';
import 'package:food_user_app/features/payment/domain/entities/payment_card.dart';
import 'package:food_user_app/features/payment/domain/repositories/payment_repository.dart';

class GetSavedCardsUseCase implements UseCase<List<PaymentCard>, NoParams> {
  final PaymentRepository repository;

  GetSavedCardsUseCase(this.repository);

  @override
  Future<Either<Failure, List<PaymentCard>>> call(NoParams params) {
    return repository.getSavedCards();
  }
}
