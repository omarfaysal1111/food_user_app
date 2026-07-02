import 'package:food_user_app/features/notifications/domain/entities/notification.dart';

class NotificationModel extends AppNotification {
  const NotificationModel({
    required super.id,
    required super.title,
    required super.body,
    required super.isRead,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    // TODO: implement
    throw UnimplementedError();
  }

  Map<String, dynamic> toJson() {
    // TODO: implement
    throw UnimplementedError();
  }
}
