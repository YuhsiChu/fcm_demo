import 'package:fcm_demo/app_config/bindings.dart';
import 'package:fcm_demo/app_config/routes.dart';
import 'package:fcm_demo/firebase/local_notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService.init();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'fcm demo',
      theme: ThemeData(
        primarySwatch: Colors.yellow,
      ),
      initialRoute: AppRoutes.home,
      initialBinding: AppBindings(),
      getPages: AppRoutes.pages,
    );
  }
}