import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_user_app/core/errors/failures.dart';
import 'package:food_user_app/core/usecases/usecase.dart';
import 'package:food_user_app/features/payment/data/models/save_card_request_dto.dart';
import 'package:food_user_app/features/payment/domain/entities/payment_card.dart';
import 'package:food_user_app/features/payment/domain/repositories/payment_repository.dart';

class SaveCardUseCase implements UseCase<PaymentCard, SaveCardParams> {
  final PaymentRepository repository;

  SaveCardUseCase(this.repository);

  @override
  Future<Either<Failure, PaymentCard>> call(SaveCardParams params) {
    return repository.saveCard(params.request);
  }
}

class SaveCardParams extends Equatable {
  final SaveCardRequestDto request;

  const SaveCardParams({required this.request});

  @override
  List<Object?> get props => [request];
}
