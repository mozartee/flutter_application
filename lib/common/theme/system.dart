import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'dark.dart';
import 'light.dart';

bool isDark = Get.isDarkMode;

class ThemeDataSysytem {
  static ThemeData get theme => isDark ? ThemeDataDark.theme : ThemeDataLight.theme;
  // ThemeData(
  //       primaryColor: isDark ? OSTColors.primaryDark : OSTColors.primary,
  //       colorScheme: ColorScheme.fromSwatch().copyWith(
  //         brightness: isDark ? Brightness.dark : Brightness.light,
  //         secondary: isDark ? OSTColors.primaryDark : OSTColors.primary,
  //       ),
  //       scaffoldBackgroundColor:
  //           isDark ? OSTColors.navBackgroundDark : OSTColors.background,
  //       // 去除水波纹
  //       splashFactory: NoSplash.splashFactory,
  //       // 隐藏提示语
  //       tooltipTheme: const TooltipThemeData(
  //         triggerMode: TooltipTriggerMode.manual,
  //       ),
  //       appBarTheme: AppBarTheme(
  //         elevation: 0.0,
  //         foregroundColor:
  //             isDark ? OSTColors.navForegroundDark : OSTColors.navForeground,
  //         backgroundColor:
  //             isDark ? OSTColors.navBackgroundDark : OSTColors.navBackground,
  //         titleTextStyle:
  //             isDark ? OSTTextStyle.navTitleDark : OSTTextStyle.navTitle,
  //         actionsIconTheme: IconThemeData(
  //           color:
  //               isDark ? OSTColors.navForegroundDark : OSTColors.navForeground,
  //         ),
  //         systemOverlayStyle:
  //             isDark ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
  //       ),
  //       textButtonTheme: TextButtonThemeData(
  //         style: ButtonStyle(
  //           splashFactory: NoSplash.splashFactory,
  //           foregroundColor: MaterialStateProperty.resolveWith((states) =>
  //               isDark
  //                   ? OSTColors.buttonForegroundDark
  //                   : OSTColors.buttonForeground),
  //           backgroundColor: MaterialStateProperty.resolveWith((states) =>
  //               isDark
  //                   ? OSTColors.buttonForegroundDark
  //                   : OSTColors.buttonBackground),
  //           textStyle: MaterialStateProperty.resolveWith(
  //               (states) => const TextStyle().copyWith(fontSize: 16.sp)),
  //         ),
  //       ),
  //       textTheme: TextTheme(
  //         bodyText1: isDark ? OSTTextStyle.textDark : OSTTextStyle.text,
  //         bodyText2:
  //             isDark ? OSTTextStyle.bodyText2Dark : OSTTextStyle.bodyText2,
  //         subtitle1: isDark ? OSTTextStyle.subtext1Dark : OSTTextStyle.subtext1,
  //         subtitle2: isDark ? OSTTextStyle.subtext2Dark : OSTTextStyle.subtext2,
  //       ),
  //       bottomNavigationBarTheme: BottomNavigationBarThemeData(
  //         elevation: 0.5,
  //         selectedItemColor: isDark ? OSTColors.primaryDark : OSTColors.primary,
  //       ),
  //       errorColor: isDark ? OSTColors.errorDark : OSTColors.error,
  //       indicatorColor: isDark ? OSTColors.primaryDark : OSTColors.primary,
  //       dividerTheme: DividerThemeData(
  //         color: isDark ? OSTColors.dividerDark : OSTColors.divider,
  //       ),
  //       textSelectionTheme: TextSelectionThemeData(
  //         cursorColor: isDark ? OSTColors.primaryDark : OSTColors.primary,
  //         selectionColor: isDark ? OSTColors.primaryDark : OSTColors.primary,
  //       ),
  //     );
}
