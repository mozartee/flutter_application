import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/help/index.dart';
import '../../common/routes/key.dart';
import '../../common/widget/index.dart';

import '../example/jobapply_view.dart';

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
    update();
  }

  onTapNotifications() async {
    // await Future.delayed(const Duration(seconds: 2));

    showTextAlert(
      title: 'Get The Alert',
      content: 'Push your face to your name',
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
