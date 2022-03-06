import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'red_controller.dart';

class Red extends GetView<RedController> {
  const Red({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
        title: const Text(
          'Red Page',
        ),
        centerTitle: true,
      ),
    );
  }
}
