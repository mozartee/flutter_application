import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:ost_digital_application/common/utils/index.dart';
import 'package:ost_digital_application/page/setting/controller.dart';

import '../../common/routes/index.dart';
import '../../common/langs/index.dart';
import '../../common/widget/list_tile.dart';

class Setting extends GetView<SettingController> {
  // Setting({Key? key}) : super(key: key);
  Setting() {
    _controller = controller;
  }
  late SettingController _controller;

  void _onPressed() {
    controller.signout();
  }

  final List<Widget> _list = [
    OSTListTile(
      text: Languages.themechange.tr,
      onTap: () => Get.toNamed(Routes.themeChange),
    ),
    OSTListTile(
      text: Languages.languagechange.tr,
      onTap: () => Get.toNamed(Routes.languageChange),
    ),
    Container(
      height: Constant.buttonHeight,
      margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 60.h),
      child: TextButton(
        onPressed: () {
          // _controller.signout();
        },
        child: Text(Languages.signout.tr),
      ),
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Languages.setting.tr),
      ),
      body: GetBuilder(
        init: SettingController(),
        builder: (controller) {
          return ListView.builder(
            itemCount: _list.length,
            itemBuilder: (context, index) => _list[index],
          );
        },
      ),
      // ListView.separated(
      //   itemCount: _list.length,
      //   separatorBuilder: (context, index) => Divider(
      //     height: 0.5,
      //     indent: 15.w,
      //     endIndent: 15.w,
      //   ),
      //   itemBuilder: (context, index) {
      //     return _list[index];
      //   },
      // ),
    );
  }
}
