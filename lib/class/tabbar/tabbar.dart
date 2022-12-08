import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/class/home/home.dart';
import 'package:ost_digital_application/class/mine/mine.dart';

import '../../common/lang/keys.dart';

class Tabbar extends StatelessWidget {
  Tabbar({Key? key}) : super(key: key);

  final List<Widget> _controllers = [Home(), const Mine()];
  final List<String> _labels = [
    Languages.tabbarhome.tr,
    Languages.tabbarmine.tr,
  ];
  final List<IconData> _icons = [Icons.home_max, Icons.people_outline];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabBarGetxController>(
      init: TabBarGetxController(),
      builder: (controller) {
        return Scaffold(
          body: IndexedStack(
            index: controller.index,
            children: _controllers,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            items: _controllers.map((e) {
              int index = _controllers.indexOf(e);
              String label = _labels[index];
              IconData icon = _icons[index];
              return BottomNavigationBarItem(icon: Icon(icon), label: label);
            }).toList(),
            currentIndex: controller.index,
            onTap: (index) {
              // ignore: unused_local_variable
              TabBarGetxController controller = Get.find()..onTap(index);
            },
          ),
        );
      },
    );
  }
}

class TabBarGetxController extends GetxController {
  int index = 0;

  void onTap(int selectedIndex) {
    index = selectedIndex;
    update();
  }
}
