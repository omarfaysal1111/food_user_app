import 'package:dio/dio.dart';
import 'package:food_user_app/core/constants/api_endpoints.dart';
import 'package:food_user_app/features/payment/data/models/payment_card_dto.dart';
import 'package:food_user_app/features/payment/data/models/save_card_request_dto.dart';
import 'package:food_user_app/features/payment/data/models/checkout_request_dto.dart';
import 'package:food_user_app/features/payment/data/models/checkout_response_dto.dart';

abstract class PaymentRemoteDataSource {
  Future<List<PaymentCardDto>> getSavedCards();
  Future<PaymentCardDto> saveCard(SaveCardRequestDto request);
  Future<void> deleteCard(String cardId);
  Future<CheckoutResponseDto> checkout(CheckoutRequestDto request);
}

class PaymentRemoteDataSourceImpl implements PaymentRemoteDataSource {
  final Dio dio;

  PaymentRemoteDataSourceImpl(this.dio);

  @override
  Future<List<PaymentCardDto>> getSavedCards() async {
    final response = await dio.get(ApiEndpoints.userCards);
    final List<dynamic> data = response.data;
    return data.map((json) => PaymentCardDto.fromJson(json)).toList();
  }

  @override
  Future<PaymentCardDto> saveCard(SaveCardRequestDto request) async {
    final response = await dio.post(
      ApiEndpoints.userCards,
      data: request.toJson(),
    );
    return PaymentCardDto.fromJson(response.data);
  }

  @override
  Future<void> deleteCard(String cardId) async {
    await dio.delete(ApiEndpoints.userCard(cardId));
  }

  @override
  Future<CheckoutResponseDto> checkout(CheckoutRequestDto request) async {
    final response = await dio.post(
      ApiEndpoints.checkout,
      data: request.toJson(),
    );
    return CheckoutResponseDto.fromJson(response.data);
  }
}
