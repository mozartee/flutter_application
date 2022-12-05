import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';
import 'package:ost_digital_application/util/shared_preference.dart';

import 'color.dart';
import 'device.dart';

extension ThemeModeExtension on ThemeMode {
  String get value => <String>['System', 'Light', 'Dark'][index];
}

ThemeMode currentThemeMode() {
  final String theme = SpUtil.getString(AppThemeKey.theme) ?? '';
  switch (theme) {
    case 'dark':
      return ThemeMode.dark;
    case 'light':
      return ThemeMode.light;
    default:
      return ThemeMode.system;
  }
}

ThemeData themeData({bool isDark = false}) => ThemeData(
      // primarySwatch: Colors.blue,
      // Color primaryColor, // 应用程序主要部分的背景颜色(toolbars、tab bars 等)
      // primaryColorLight: const Color(0xffffffff),
      // primaryColorDark: const Color(0xff303030),

      // appBar
      appBarTheme: _appBarThemeData(isDark: isDark),

      // 全局textbutton效果
      textButtonTheme: _textButtonThemeData(),
    );

TextButtonThemeData _textButtonThemeData({bool isDark = false}) {
  return TextButtonThemeData(
    style: ButtonStyle(
      // 全局去除button水波纹效果
      splashFactory: NoSplash.splashFactory,
      foregroundColor: MaterialStateProperty.resolveWith((states) =>
          isDark ? OSTColors.buttonForegroundDark : OSTColors.buttonForeground),
      backgroundColor: MaterialStateProperty.resolveWith((states) =>
          isDark ? OSTColors.buttonBackgroundDark : OSTColors.buttonBackground),
    ),
  );
}

AppBarTheme _appBarThemeData({bool isDark = false}) => AppBarTheme(
      elevation: 0.5,
      foregroundColor:
          isDark ? OSTColors.navForegroundDark : OSTColors.navForeground,
      backgroundColor:
          isDark ? OSTColors.navBackgroundDark : OSTColors.navBackground,
      titleTextStyle: _navTitleTextStyle(isDark: isDark),
      actionsIconTheme: _navActionIconThemeData(isDark: isDark),
    );

TextStyle _navTitleTextStyle({bool isDark = false}) => TextStyle(
      fontSize: 17,
      fontWeight: FontWeight.w600,
      color: isDark ? OSTColors.navTitleDark : OSTColors.navTitle,
    );

IconThemeData _navActionIconThemeData({bool isDark = false}) => IconThemeData(
      color: isDark ? OSTColors.navForegroundDark : OSTColors.navForeground,
      size: navActionIconSize,
    );
