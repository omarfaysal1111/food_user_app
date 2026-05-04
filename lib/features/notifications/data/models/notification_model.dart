import 'package:food_user_app/features/notifications/domain/entities/notification.dart';


class NotificationModel extends AppNotification {
  const NotificationModel({
    required String id,
    required String title,
    required String body,
    required bool isRead,
  }) : super(id: id, title: title, body: body, isRead: isRead);

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    // TODO: implement
    throw UnimplementedError();
  }

  Map<String, dynamic> toJson() {
    // TODO: implement
    throw UnimplementedError();
  }
}
