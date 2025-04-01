import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:ecommerce_app/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class AwesomeNotificationsService {
  static final AwesomeNotificationsService _instance =
      AwesomeNotificationsService._internal();

  factory AwesomeNotificationsService() => _instance;

  AwesomeNotificationsService._internal();

  Future<void> initialize() async {
    await AwesomeNotifications().initialize(
      'resource://mipmap/launcher_icon',
      [
        NotificationChannel(
          channelKey: 'ecommerce_app_channel',
          channelName: 'Ecommerce App Notifications',
          channelDescription:
              'Notifications related to orders, offers, and updates from the app.',
          defaultColor: AppColors.primaryColor,
          ledColor: Colors.white,
          importance: NotificationImportance.High,
          enableVibration: true,
        ),
      ],
    );
  }

  Future<bool> requestPermission() async {
    return await AwesomeNotifications().requestPermissionToSendNotifications();
  }

  Future<void> showNotification(
      {required String title, required String body, required int id}) async {
    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: id,
        channelKey: 'ecommerce_app_channel',
        title: title,
        body: body,
        notificationLayout: NotificationLayout.Default,
      ),
    );
  }

  Future<void> cancelNotification(int id) async {
    await AwesomeNotifications().cancel(id);
  }

  Future<void> cancelAllNotifications() async {
    await AwesomeNotifications().cancelAll();
  }
}
