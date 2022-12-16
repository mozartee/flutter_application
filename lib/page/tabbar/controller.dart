import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabBarController extends GetxController {
  late PageController pageController;
  int pageIndex = 0;

  void onBottomNavigationBarTap(int index) {
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    update();
  }

  void onPageChanged(index) {
    pageIndex = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }
}
