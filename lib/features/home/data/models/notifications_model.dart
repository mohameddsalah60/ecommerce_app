import 'package:ecommerce_app/features/home/domin/entites/notifications_entity.dart';

class NotificationsModel extends NotificationsEntity {
  NotificationsModel({
    required super.id,
    required super.title,
    required super.message,
  });
  factory NotificationsModel.fromJson({required Map<String, dynamic> data}) {
    return NotificationsModel(
      id: data["id"] ?? 0,
      title: data["title"] ?? "",
      message: data["message"] ?? "",
    );
  }
}
