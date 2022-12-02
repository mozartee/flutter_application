import 'package:flutter/material.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'package:ost_digital_application/util/color.dart';
import 'package:ost_digital_application/util/route.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final count = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Scaffold(
        appBar: AppBar(
          elevation: 1,
          title: const Text(
            "Home",
            style: TextStyle(color: OSTColors.navTitle),
          ),
          backgroundColor: OSTColors.navBackground,
          foregroundColor: OSTColors.navForeground,
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(
                  RouteGet.homeDetail,
                  arguments: {"name": "Jaxo", "years": 19},
                );
              },
              icon: const Icon(Icons.next_plan),
            )
          ],
        ),
        body: buildBody(),
      ),
    );
  }

  Column buildBody() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                if (count.value <= 0) return;
                count.value--;
              },
              icon: const Icon(Icons.text_decrease),
            ),
            Obx(() => Text("${count.value}")),
            IconButton(
              onPressed: () => count.value++,
              icon: const Icon(Icons.text_increase),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GetBuilder<GetController>(
              init: GetController(),
              builder: (controller) {
                return Text("${controller.count}");
              },
            ),
            IconButton(
              onPressed: () {
                // ignore: unused_local_variable
                GetController controller = Get.find()..increment();
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
      ],
    );
  }
}

class GetController extends GetxController {
  int count = 0;

  void increment() {
    if (count >= 5) {
      Get.snackbar('提示', '超过最大值了',
          animationDuration: const Duration(microseconds: 350));
    } else {
      count++;
    }
    update();
  }
}
