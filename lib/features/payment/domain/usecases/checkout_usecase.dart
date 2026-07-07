import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_user_app/core/errors/failures.dart';
import 'package:food_user_app/core/usecases/usecase.dart';
import 'package:food_user_app/features/payment/data/models/checkout_request_dto.dart';
import 'package:food_user_app/features/payment/domain/entities/checkout_result.dart';
import 'package:food_user_app/features/payment/domain/repositories/payment_repository.dart';

class CheckoutUseCase implements UseCase<CheckoutResult, CheckoutParams> {
  final PaymentRepository repository;

  CheckoutUseCase(this.repository);

  @override
  Future<Either<Failure, CheckoutResult>> call(CheckoutParams params) {
    return repository.checkout(params.request);
  }
}

class CheckoutParams extends Equatable {
  final CheckoutRequestDto request;

  const CheckoutParams({required this.request});

  @override
  List<Object?> get props => [request];
}
