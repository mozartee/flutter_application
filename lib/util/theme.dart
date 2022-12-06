import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:ost_digital_application/util/shared_preference.dart';
import 'package:ost_digital_application/util/text_style.dart';

import 'color.dart';

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

ThemeData themeData({bool isDark = false}) => ThemeData(
      // 去除水波纹
      splashFactory: NoSplash.splashFactory,
      // 隐藏长按显示提示语
      tooltipTheme:
          const TooltipThemeData(triggerMode: TooltipTriggerMode.manual),
      appBarTheme: _appBarThemeData(isDark),
      textButtonTheme: _textButtonThemeData(isDark),
      textTheme: _appTextTheme(isDark),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0.5,
        selectedItemColor: isDark ? OSTColors.primaryDark : OSTColors.primary,
      ),

      primarySwatch: isDark ? Colors.yellow : Colors.green,
      errorColor: isDark ? OSTColors.errorDark : OSTColors.error,
      primaryColor: isDark ? OSTColors.primaryDark : OSTColors.primary,
      colorScheme: ColorScheme.fromSwatch().copyWith(
          brightness: isDark ? Brightness.dark : Brightness.light,
          secondary: isDark ? OSTColors.primaryDark : OSTColors.primary),
      indicatorColor: isDark ? OSTColors.primaryDark : OSTColors.primary,
      scaffoldBackgroundColor:
          isDark ? OSTColors.backgroundDark : OSTColors.background,
      dividerTheme: DividerThemeData(
          color: isDark ? OSTColors.dividerDark : OSTColors.divider),
      textSelectionTheme: TextSelectionThemeData(
          cursorColor: isDark ? OSTColors.primaryDark : OSTColors.primary,
          selectionColor: isDark ? OSTColors.primaryDark : OSTColors.primary),
    );

TextTheme _appTextTheme(bool isDark) => TextTheme(
      bodyText1: isDark ? OSTTextStyle.textDark : OSTTextStyle.text,
      bodyText2: isDark ? OSTTextStyle.bodyText2Dark : OSTTextStyle.bodyText2,
      subtitle1: isDark ? OSTTextStyle.subtext1Dark : OSTTextStyle.subtext1,
      subtitle2: isDark ? OSTTextStyle.subtext2Dark : OSTTextStyle.subtext2,
    );

AppBarTheme _appBarThemeData(bool isDark) => AppBarTheme(
      elevation: 0.5,
      foregroundColor:
          isDark ? OSTColors.navForegroundDark : OSTColors.navForeground,
      backgroundColor:
          isDark ? OSTColors.navBackgroundDark : OSTColors.navBackground,
      titleTextStyle:
          isDark ? OSTTextStyle.navTitleDark : OSTTextStyle.navTitle,
      actionsIconTheme: _navActionIconThemeData(isDark),
      systemOverlayStyle:
          isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
    );

IconThemeData _navActionIconThemeData(bool isDark) => IconThemeData(
      color: isDark ? OSTColors.navForegroundDark : OSTColors.navForeground,
    );

TextButtonThemeData _textButtonThemeData(bool isDark) => TextButtonThemeData(
      style: ButtonStyle(
        splashFactory: NoSplash.splashFactory,
        foregroundColor: MaterialStateProperty.resolveWith((states) => isDark
            ? OSTColors.buttonForegroundDark
            : OSTColors.buttonForeground),
        backgroundColor: MaterialStateProperty.resolveWith((states) => isDark
            ? OSTColors.buttonBackgroundDark
            : OSTColors.buttonBackground),
        textStyle: MaterialStateProperty.resolveWith(
          (states) => const TextStyle().copyWith(
            fontSize: 16,
          ),
        ),
      ),
    );
