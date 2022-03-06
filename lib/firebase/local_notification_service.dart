import 'package:fcm_demo/pages/red/red.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void init() {
    const InitializationSettings initializationSettings =
        InitializationSettings(
            android: AndroidInitializationSettings(
                '@mipmap/ic_launcher')); // 推播 Icon 可以自訂

    _notificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) async {
      // 點擊自製推播通知時要做的事
      Get.to(() => const Red());
    });
  }

  static void display(RemoteMessage msg) async {
    try {
      final id = DateTime.now().millisecondsSinceEpoch ~/ 1000;

      // 設定要用的通知管道
      const NotificationDetails notificationDetails = NotificationDetails(
          android: AndroidNotificationDetails("demo_channel_id", "demo_channel_name",
              importance: Importance.max, priority: Priority.high));

      await _notificationsPlugin.show(id, msg.notification!.title,
          msg.notification!.body, notificationDetails,
          payload: msg.data['route']); // 傳給點擊自製推播通知當參數
    } on Exception catch (e) {
      print(e);
    }
  }
}
