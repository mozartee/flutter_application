import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../common/routes/header.dart';
import '../../common/lang/header.dart';
import '../../widget/list_tile.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Languages.setting.tr),
      ),
      body: ListView(
        children: [
          OSTListTile(
            text: Languages.themechange.tr,
            onTap: () => Get.toNamed(Routes.themeChange),
          ),
          OSTListTile(
            text: Languages.languagechange.tr,
            onTap: () => Get.toNamed(Routes.languageChange),
          ),
        ],
      ),
    );
  }
}
