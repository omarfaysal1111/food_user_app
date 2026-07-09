import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:food_user_app/features/order/domain/entities/order_tracking.dart';

part 'order_tracking_state.freezed.dart';

@freezed
class OrderTrackingState with _$OrderTrackingState {
  const factory OrderTrackingState.initial() = _Initial;
  const factory OrderTrackingState.loading() = _Loading;
  const factory OrderTrackingState.loaded(OrderTracking tracking) = _Loaded;
  const factory OrderTrackingState.error(String message) = _Error;
}
