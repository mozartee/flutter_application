import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'dark.dart';
import 'light.dart';

bool isDark = Get.isDarkMode;

class ThemeDataSysytem {
  static ThemeData get theme =>
      isDark ? ThemeDataDark.theme : ThemeDataLight.theme;
}
