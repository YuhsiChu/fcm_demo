import 'package:fcm_demo/pages/green/green.dart';
import 'package:fcm_demo/pages/home/home.dart';
import 'package:fcm_demo/pages/red/red.dart';
import 'package:get/get.dart';

class AppRoutes {
  static const home = '/';
  static const red = '/red';
  static const green = '/green';

  static final pages = [
    GetPage(name: home, page: () => const Home()),
    GetPage(name: red, page: () => const Red()),
    GetPage(name: green, page: () => const Green()),
  ];
}
