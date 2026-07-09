import 'package:dartz/dartz.dart' hide Order;
import 'package:food_user_app/core/errors/failures.dart';
import 'package:food_user_app/features/order/data/models/place_order_request.dart';
import 'package:food_user_app/features/order/domain/entities/order.dart';
import 'package:food_user_app/features/order/domain/entities/order_tracking.dart';

abstract class OrderRepository {
  Future<Either<Failure, Order>> placeOrder(PlaceOrderRequest request);
  Future<Either<Failure, List<Order>>> getOrderHistory();
  Future<Either<Failure, Order>> getOrderDetails(String orderId);
  Future<Either<Failure, OrderTracking>> trackOrder(String orderId);
}
