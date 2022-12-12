import 'package:flutter/material.dart';

import 'package:flustars_flutter3/flustars_flutter3.dart';

import '/common/shared_preference.dart';
import 'header.dart';

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

class ThemeDataMode {
  static get current => currentThemeMode();
}

extension ThemeDataExtension on ThemeData {
  ThemeData get light => ThemeDataLight.theme;
  ThemeData get dark => ThemeDataDark.theme;
}
