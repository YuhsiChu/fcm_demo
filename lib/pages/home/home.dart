import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_controller.dart';

class Home extends GetView<HomeController> {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'fcm_demo',
          style: TextStyle(color: Colors.green),
        ),
        centerTitle: true,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Text(
            controller.greeting,
            style: const TextStyle(fontSize: 34),
          ),
        ),
      ),
    );
  }
}
