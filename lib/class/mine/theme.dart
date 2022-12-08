import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/lang/route.dart';
import '../../common/shared_preference.dart';
import '../../widget/list_tile.dart';
import '../../common/theme/route.dart';

class ThemeChange extends StatelessWidget {
  const ThemeChange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Languages.themechange.tr),
      ),
      body: ListView(
        children: [
          OSTListTile(
            text: Languages.themechangelight.tr,
            trailing: Get.isDarkMode == false ? const Icon(Icons.check) : null,
            onTap: () => _changeTheme(index: 0),
          ),
          OSTListTile(
            text: Languages.themechangedark.tr,
            trailing: Get.isDarkMode == true ? const Icon(Icons.check) : null,
            onTap: () => _changeTheme(index: 1),
          ),
        ],
      ),
    );
  }

  void _changeTheme({int index = 0}) {
    if (index == 0) {
      if (Get.isDarkMode == true) {
        SpUtil.putString(AppThemeKey.theme, ThemeMode.light.value);
        // Get.changeTheme(ThemeData.light());
        Get.changeTheme(ThemeData().light);

        Future.delayed(const Duration(microseconds: 500)).then((value) {
          // Get.forceAppUpdate();
          Get.back();
        });
      }
    } else if (index == 1) {
      if (Get.isDarkMode == false) {
        SpUtil.putString(AppThemeKey.theme, ThemeMode.dark.value);
        // Get.changeTheme(ThemeData.dark());
        Get.changeTheme(ThemeData().dark);

        Future.delayed(const Duration(microseconds: 500)).then((value) {
          // Get.forceAppUpdate();
          Get.back();
        });
      }
    }
  }
}