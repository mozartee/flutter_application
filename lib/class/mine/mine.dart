import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/util/route.dart';

class Mine extends StatelessWidget {
  const Mine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('我的'),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(RouteGet.setting);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
