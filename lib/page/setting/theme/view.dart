import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/widget/list_tile.dart';
import '../../../common/langs/index.dart';

import 'controller.dart';

class ThemeChange extends GetView<ThemeChangeController> {
  const ThemeChange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeChangeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(Languages.themechange.tr),
        ),
        body: ListView(
          children: [
            OSTListTile(
              text: Languages.themechangelight.tr,
              trailing:
                  Get.isDarkMode == false ? const Icon(Icons.check) : null,
              onTap: () => controller.changeTheme(),
            ),
            OSTListTile(
              text: Languages.themechangedark.tr,
              trailing: Get.isDarkMode == true ? const Icon(Icons.check) : null,
              onTap: () => controller.changeTheme(index: 1),
            ),
          ],
        ),
      ),
    );
  }
}
