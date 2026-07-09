part of 'support_ticket_cubit.dart';

@freezed
class SupportTicketState with _$SupportTicketState {
  const factory SupportTicketState.initial() = _Initial;
  const factory SupportTicketState.loading() = _Loading;
  const factory SupportTicketState.success(Ticket ticket) = _Success;
  const factory SupportTicketState.error(String message) = _Error;
}
