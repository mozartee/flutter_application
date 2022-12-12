import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '/common/shared_preference.dart';
import '/common/theme/header.dart';

class ThemeChangeController extends GetxController {
  ThemeChangeController();

  void changeTheme({int index = 0}) {
    if (index == 0) {
      if (Get.isDarkMode == true) {
        _change(themeMode: ThemeMode.light, themeData: ThemeData().light);
      }
    } else if (index == 1) {
      if (Get.isDarkMode == false) {
        _change(themeMode: ThemeMode.dark, themeData: ThemeData().dark);
      }
    }
  }

  void _change({ThemeMode? themeMode, ThemeData? themeData}) {
    if (themeMode != null) {
      SpUtil.putString(AppThemeKey.theme, themeMode.value);
    }
    if (themeData != null) {
      Get.changeTheme(themeData);
    }

    Future.delayed(const Duration(microseconds: 500)).then((value) {
      Get.back();
    });
  }
}
