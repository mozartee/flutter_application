import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../common/langs/index.dart';
import '../../page/home/index.dart';
import '../../page/mine/index.dart';
import 'controller.dart';

class TabbarPage extends StatelessWidget {
  TabbarPage({Key? key}) : super(key: key);

  final List<Widget> _pages = const [HomePage(), Mine()];
  final List<BottomNavigationBarItem> _items = [
    BottomNavigationBarItem(
      icon: const  Icon(Icons.whatsapp),
      label: Languages.tabbarhome.tr,
    ),
    BottomNavigationBarItem(
      icon: const FaIcon(FontAwesomeIcons.theRedYeti),
      label: Languages.tabbarmine.tr,
    ),
  ];

  final TabBarController _controller =
      Get.put<TabBarController>(TabBarController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TabBarController>(
      builder: (controller) {
        return Scaffold(
          body: PageView(
            controller: _controller.pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: _pages,
            onPageChanged: (index) => _controller.onPageChanged(index),
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 14,
            unselectedFontSize: 14,
            items: _items,
            currentIndex: controller.pageIndex,
            onTap: (index) => _controller.onBottomNavigationBarTap(index),
          ),
        );
      },
    );
  }
}
