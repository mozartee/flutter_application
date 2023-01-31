import 'package:flustars_flutter3/flustars_flutter3.dart' show SpUtil;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/help/index.dart';
import '../../../../common/routes/index.dart';
import 'data.dart';

class TaskSplashController extends GetxController {
  late PageController pageController;
  late int currentPage;
  late double offset;
  late double page;
  late double currentOffset;

  @override
  void onInit() {
    pageController = PageController(initialPage: 0, keepPage: true)
      ..addListener(() {
        offset = pageController.offset;
        page = pageController.page!;
        currentOffset = offset - Get.width * page.truncate();
        debugPrint('$offset , $currentOffset , $page , $currentPage');
      });

    currentPage = 0;

    super.onInit();
  }

  @override
  void onClose() {
    pageController.dispose();
    super.onClose();
  }

  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  onPressed(int index) {
    if (index == taskSplashList.length - 1) {
      skip();
    } else {
      pageController.animateToPage(
        index + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    }
  }

  onTap(int index) {
    if (index == currentPage) return;
    pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  skip() {
    Get.offNamed(AppRoutes.signin);
    SpUtil.putBool(PageKey.splash, true);
  }
}
