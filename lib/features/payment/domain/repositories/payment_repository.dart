import 'package:dartz/dartz.dart';
import 'package:food_user_app/core/errors/failures.dart';
import 'package:food_user_app/features/payment/data/models/save_card_request_dto.dart';
import 'package:food_user_app/features/payment/data/models/checkout_request_dto.dart';
import 'package:food_user_app/features/payment/domain/entities/payment_card.dart';
import 'package:food_user_app/features/payment/domain/entities/checkout_result.dart';

abstract class PaymentRepository {
  Future<Either<Failure, List<PaymentCard>>> getSavedCards();
  Future<Either<Failure, PaymentCard>> saveCard(SaveCardRequestDto request);
  Future<Either<Failure, void>> deleteCard(String cardId);
  Future<Either<Failure, CheckoutResult>> checkout(CheckoutRequestDto request);
}
