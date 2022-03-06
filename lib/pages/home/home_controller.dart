import 'package:fcm_demo/firebase/firebase_manager.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  String greeting = 'Hello world!';

  @override
  void onInit() async{
    super.onInit();
    FirebaseManager.init();

    // 取得 FCM Token
    String? fcmToken = await FirebaseMessaging.instance.getToken();
    print('token: $fcmToken');

    FirebaseMessaging.instance.subscribeToTopic('meow'); // 訂閱指定主題
//    FirebaseMessaging.instance.unsubscribeFromTopic('meow'); // 退訂指定主題
  }
}
