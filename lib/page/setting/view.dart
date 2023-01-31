import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../common/routes/index.dart';
import '../../common/langs/index.dart';
import '../../common/utils/index.dart';
import '../../common/widget/list_tile.dart';
import 'index.dart';

class Setting extends GetView<SettingController> {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Languages.setting.tr),
      ),
      body: GetBuilder<SettingController>(
        init: SettingController(),
        builder: (controller) {
          return ListView(
            children: [
              OSTListTile(
                text: Languages.themechange.tr,
                onTap: () => Get.toNamed(Routes.themeChange),
              ),
              OSTListTile(
                text: Languages.languagechange.tr,
                onTap: () => Get.toNamed(Routes.languageChange),
              ),
              // Expanded(
              //   child: Container(
              //     height: Constant.buttonHeight,
              //     margin:
              //         EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
              //     child: ElevatedButton(
              //       onPressed: () => controller.signout(),
              //       child: Text(Languages.signout.tr),
              //     ),
              //     // TextButton(
              //     //   onPressed: () => controller.signout(),
              //     //   child: Text(Languages.signout.tr),
              //     // ),
              //   ),
              // ),
            ],
          );
        },
      ),
    );
  }
}
