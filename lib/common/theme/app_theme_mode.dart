import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';

import '../help/index.dart';

class AppThemeDataMode {
  static get themeMode => currentThemeMode();
}

extension ThemeModeExtension on ThemeMode {
  String get value => <String>['System', 'Light', 'Dark'][index];
}

ThemeMode currentThemeMode() {
  final String theme = SpUtil.getString(AppThemeKey.theme) ?? '';
  switch (theme) {
    case 'Dark':
      return ThemeMode.dark;
    case 'Light':
      return ThemeMode.light;
    default:
      return ThemeMode.system;
  }
}
