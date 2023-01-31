import 'package:flutter/material.dart';

import 'app_theme_mode.dart';
import 'dark.dart';
import 'light.dart';
import 'system.dart';

class APPTheme {
  static get themeMode => AppThemeDataMode.themeMode;
  static get light => ThemeData().light;
  static get dark => ThemeData().dark;
  static get system => ThemeData().system;
}

extension ThemeDataExtension on ThemeData {
  ThemeData get light => ThemeDataLight.theme;
  ThemeData get dark => ThemeDataDark.theme;
  ThemeData get system => ThemeDataSysytem.theme;
}
