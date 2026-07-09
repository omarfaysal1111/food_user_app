import 'package:dio/dio.dart';
import 'package:food_user_app/features/support/data/models/create_ticket_request.dart';
import 'package:food_user_app/features/support/data/models/support_message_dto.dart';
import 'package:food_user_app/features/support/data/models/ticket_dto.dart';

abstract class SupportRemoteDataSource {
  Future<TicketDto> createTicket(CreateTicketRequest request);
  Future<List<SupportMessageDto>> getMessages(String ticketId);
  Future<SupportMessageDto> sendMessage({
    required String ticketId,
    required String content,
  });
}

class SupportRemoteDataSourceImpl implements SupportRemoteDataSource {
  final Dio _dio;

  SupportRemoteDataSourceImpl({required Dio dio}) : _dio = dio;

  @override
  Future<TicketDto> createTicket(CreateTicketRequest request) async {
    final response = await _dio.post(
      '/support/tickets',
      data: request.toJson(),
    );
    return TicketDto.fromJson(response.data);
  }

  @override
  Future<List<SupportMessageDto>> getMessages(String ticketId) async {
    final response = await _dio.get('/support/tickets/$ticketId/messages');
    final data = response.data;
    if (data is Map<String, dynamic> && data['content'] != null) {
      return (data['content'] as List)
          .map((json) => SupportMessageDto.fromJson(json))
          .toList();
    } else if (data is List) {
      return data.map((json) => SupportMessageDto.fromJson(json)).toList();
    }
    return [];
  }

  @override
  Future<SupportMessageDto> sendMessage({
    required String ticketId,
    required String content,
  }) async {
    final response = await _dio.post(
      '/support/tickets/$ticketId/messages',
      data: {'content': content},
    );
    return SupportMessageDto.fromJson(response.data);
  }
}
