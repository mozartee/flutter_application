import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';

import '../../common/help/index.dart';
import '../../common/routes/keys.dart';
import '../../common/widget/index.dart';
import '../example/job_app/jobapply_view.dart';
import '../example/task_app/tabbar.dart';

class MineController extends GetxController {
  bool profileCompleted = false;
  bool showInfoOnBar = false;
  late double _scrollOffset;
  late ScrollController scrollController;

  onChangeEditProfile() async {
    // await Future.delayed(const Duration(seconds: 2));
    profileCompleted = !profileCompleted;
    update();
  }

  onChangeEditSport() async {
    // await Future.delayed(const Duration(seconds: 2));

    Get.to(() => const JobApplyPage());
    update();
  }

  onTapApplications() async {
    // await Future.delayed(const Duration(seconds: 2));

    // showSingleAlert(title: 'This is a single action alert');
    Get.to(() => const TaskTabBarPage());
    update();
  }

  onTapNotifications() async {
    // await Future.delayed(const Duration(seconds: 2));

    showTextAlert(
      title: 'Alert',
      content: 'Click anywhere to dismiss',
    );
    update();
  }

  logout() {
    showDefaultAlert(
      title: 'Alert',
      content: 'Are you sure to logout?',
      onDone: () async {
        Get.back();
        Loading.show('Loging out...');
        await Future.delayed(const Duration(seconds: 2));
        Loading.dismiss();
        SpUtil.putBool(PageKey.signin, false);
        Get.offAllNamed(Routes.signin);
        update();
      },
    );
  }

  @override
  void onInit() {
    scrollController = ScrollController();
    scrollController.addListener(() {
      _scrollOffset = scrollController.offset;
      double maxOffset = 71.0; // more to show the info on navigation bar
      showInfoOnBar = _scrollOffset > maxOffset;
      update();
    });

    super.onInit();
  }
}
