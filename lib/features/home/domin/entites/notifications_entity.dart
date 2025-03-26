import 'package:ecommerce_app/core/helper_functions/get_status_order_color.dart';
import 'package:flutter/material.dart';

class NotificationsEntity {
  final int id;
  final String title, message;

  NotificationsEntity({
    required this.id,
    required this.title,
    required this.message,
  });

  String extractOrderId(String text) {
    if (title == 'تم تحديث حالة الطلب' || title == 'Order status updated') {
      RegExp regExp = RegExp(r'\d+');
      Match match = regExp.firstMatch(text)!;
      return match.group(0)!;
    } else {
      return message;
    }
  }

  String? extractOrderStatus(String text) {
    if (title == 'تم تحديث حالة الطلب' || title == 'Order status updated') {
      RegExp regExp = RegExp(r'updated to (.+)');
      Match match = regExp.firstMatch(text)!;
      return match.group(1);
    } else {
      return null;
    }
  }

  Color getColorsStatus(String text) {
    String? status = extractOrderStatus(text);
    Color color = getStatusColor(status!);
    return color;
  }
}
