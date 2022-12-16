import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../help/index.dart';

class ThemeDataLight {
  static ThemeData get theme => ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        // colorSchemeSeed: Colors.blue, //OSTColors.primary,
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: ColorScheme.fromSwatch().onPrimary,
            primary: ColorScheme.fromSwatch().primary,
            elevation: 0,
            shadowColor: Colors.transparent,
          ),
        ),
        // 去除水波纹
        splashFactory: NoSplash.splashFactory,
        tooltipTheme: const TooltipThemeData(
          triggerMode: TooltipTriggerMode.manual,
        ),
      );
  // ThemeData.light().copyWith(
  //       primaryColor: OSTColors.primary,
  //       colorScheme: ColorScheme.fromSwatch().copyWith(
  //         brightness: Brightness.light,
  //         secondary: OSTColors.primary,
  //       ),
  //       scaffoldBackgroundColor: OSTColors.background,
  //       // 去除水波纹
  //       splashFactory: NoSplash.splashFactory,
  //       // 隐藏提示语
  //       tooltipTheme: const TooltipThemeData(
  //         triggerMode: TooltipTriggerMode.manual,
  //       ),
  //       appBarTheme: AppBarTheme(
  //         elevation: 0.0,
  //         foregroundColor: OSTColors.navForeground,
  //         backgroundColor: OSTColors.navBackground,
  //         titleTextStyle: OSTTextStyle.navTitle,
  //         actionsIconTheme: const IconThemeData(color: OSTColors.navForeground),
  //         systemOverlayStyle: SystemUiOverlayStyle.dark,
  //       ),
  //       textButtonTheme: TextButtonThemeData(
  //         style: ButtonStyle(
  //           splashFactory: NoSplash.splashFactory,
  //           foregroundColor: MaterialStateProperty.resolveWith(
  //               (states) => OSTColors.buttonForeground),
  //           backgroundColor: MaterialStateProperty.resolveWith(
  //               (states) => OSTColors.buttonBackground),
  //           textStyle: MaterialStateProperty.resolveWith(
  //               (states) => const TextStyle().copyWith(fontSize: 16.sp)),
  //         ),
  //       ),
  //       textTheme: TextTheme(
  //         bodyText1: OSTTextStyle.text,
  //         bodyText2: OSTTextStyle.bodyText2,
  //         subtitle1: OSTTextStyle.subtext1,
  //         subtitle2: OSTTextStyle.subtext2,
  //       ),
  //       bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  //         elevation: 0.5,
  //         selectedItemColor: OSTColors.primary,
  //       ),
  //       errorColor: OSTColors.error,
  //       indicatorColor: OSTColors.primary,
  //       dividerTheme: const DividerThemeData(
  //         color: OSTColors.divider,
  //       ),
  //       textSelectionTheme: const TextSelectionThemeData(
  //         cursorColor: OSTColors.primary,
  //         selectionColor: OSTColors.primary,
  //       ),
  //     );
}
