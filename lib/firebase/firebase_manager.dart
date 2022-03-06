import 'dart:io';

import 'package:fcm_demo/firebase/local_notification_service.dart';
import 'package:fcm_demo/pages/green/green.dart';
import 'package:fcm_demo/pages/home/home.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

/// Firebase管理工具
class FirebaseManager {
  static void init() async {
    // 設定 IOS 權限
    if (Platform.isIOS) {
      await FirebaseMessaging.instance
          .setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
    }

    /// 從 App 關閉的狀態打開
    FirebaseMessaging.instance.getInitialMessage().then((RemoteMessage? msg) {
      print('getInitialMessage');
      if (msg != null) {
        print(msg.notification!.title);
        print(msg.notification!.body);
      }
      Get.to(() => const Home());
    });

    // 接收推播通知的 listener (前景)
    FirebaseMessaging.onMessage.listen((RemoteMessage msg) {
      print('onMessage');
      if (msg.notification != null) {
        print(msg.notification!.title);
        print(msg.notification!.body);
      }

      // 由於 Android 在前景時不會顯示推播通知，所以自製一個(但依舊可以拿到 RemoteMessage)
      LocalNotificationService.display(msg);
    });

    // 點擊打開推播通知的 listener
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage msg) {
      print('onMessageOpenedApp');
      if (msg.notification != null) {
        print(msg.notification!.title);
        print(msg.notification!.body);
      }
      Get.to(() => const Green());
    });

    //  接收推播通知的 listener (背景)
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);
  }

  static Future<void> _backgroundHandler(RemoteMessage msg) async {
    // 背景收到推播時要做的事
  }
}
