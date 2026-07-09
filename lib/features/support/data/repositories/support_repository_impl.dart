import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:food_user_app/core/errors/exceptions.dart';
import 'package:food_user_app/core/errors/failures.dart';
import 'package:food_user_app/core/network/dio_error_mapper.dart';
import 'package:food_user_app/features/support/data/datasources/support_remote_data_source.dart';
import 'package:food_user_app/features/support/data/models/create_ticket_request.dart';
import 'package:food_user_app/features/support/data/models/support_message_dto.dart';
import 'package:food_user_app/features/support/data/models/ticket_dto.dart';
import 'package:food_user_app/features/support/domain/entities/support_message.dart';
import 'package:food_user_app/features/support/domain/entities/ticket.dart';
import 'package:food_user_app/features/support/domain/repositories/support_repository.dart';

class SupportRepositoryImpl implements SupportRepository {
  final SupportRemoteDataSource remoteDataSource;

  SupportRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, Ticket>> createTicket({
    required String subject,
    required String message,
  }) async {
    try {
      final dto = await remoteDataSource.createTicket(
        CreateTicketRequest(subject: subject, message: message),
      );
      return Right(dto.toEntity());
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, List<SupportMessage>>> getMessages(
    String ticketId,
  ) async {
    try {
      final dtos = await remoteDataSource.getMessages(ticketId);
      return Right(dtos.map((dto) => dto.toEntity()).toList());
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  @override
  Future<Either<Failure, SupportMessage>> sendMessage({
    required String ticketId,
    required String content,
  }) async {
    try {
      final dto = await remoteDataSource.sendMessage(
        ticketId: ticketId,
        content: content,
      );
      return Right(dto.toEntity());
    } catch (e) {
      return Left(_mapExceptionToFailure(e));
    }
  }

  Failure _mapExceptionToFailure(Object error) {
    if (error is DioException) {
      return _mapExceptionToFailure(DioErrorMapper.map(error));
    }
    if (error is ServerException) return ServerFailure(error.message);
    if (error is NetworkException) return NetworkFailure(error.message);
    if (error is TimeoutException) return TimeoutFailure(error.message);
    if (error is UnauthorizedException) {
      return UnauthorizedFailure(error.message);
    }
    if (error is ValidationException) {
      return ValidationFailure(error.message, errors: error.errors);
    }
    if (error is UnknownException) return UnknownFailure(error.message);
    return UnknownFailure(error.toString());
  }
}
