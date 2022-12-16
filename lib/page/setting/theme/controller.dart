import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../common/widget/loading.dart';
import '../../../common/help/shared_preference.dart';
import '../../../common/theme/index.dart';

class ThemeChangeController extends GetxController {
  ThemeChangeController();

  void changeTheme({int index = 0}) {
    switch (index) {
      case 0:
        {
          if (currentThemeMode() != ThemeMode.system) {
            _change(themeMode: ThemeMode.system, themeData: ThemeData().system);
          }
        }
        break;
      case 1:
        {
          if (currentThemeMode() != ThemeMode.light) {
            _change(themeMode: ThemeMode.light, themeData: ThemeData().light);
          }
        }
        break;
      case 2:
        {
          if (currentThemeMode() != ThemeMode.dark) {
            _change(themeMode: ThemeMode.dark, themeData: ThemeData().dark);
          }
        }

        break;
      default:
    }
  }

  void _change({ThemeMode? themeMode, ThemeData? themeData}) {
    if (themeMode != null) {
      SpUtil.putString(AppThemeKey.theme, themeMode.value);
      Get.changeThemeMode(themeMode);
    }
    if (themeData != null) {
      Get.changeTheme(themeData);
      // reset loading
      Loading();
    }

    Future.delayed(const Duration(microseconds: 500)).then((value) {
      Get.back();
    });
  }
}
