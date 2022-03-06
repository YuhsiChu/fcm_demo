import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'green_controller.dart';

class Green extends GetView<GreenController> {
  const Green({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        title: const Text(
          'Green Page',
        ),
        centerTitle: true,
      ),
    );
  }
}
