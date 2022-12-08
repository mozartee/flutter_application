import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color.dart';
import '../text_style.dart';

class ThemeDataDark {
  static ThemeData get theme => ThemeData.dark().copyWith(
        primaryColor: OSTColors.primaryDark,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          brightness: Brightness.dark,
          secondary: OSTColors.primaryDark,
        ),

        // 去除水波纹
        splashFactory: NoSplash.splashFactory,
        // 隐藏提示语
        tooltipTheme: const TooltipThemeData(
          triggerMode: TooltipTriggerMode.manual,
        ),
        appBarTheme: AppBarTheme(
          elevation: 0.0,
          foregroundColor: OSTColors.navForegroundDark,
          backgroundColor: OSTColors.navBackgroundDark,
          titleTextStyle: OSTTextStyle.navTitleDark,
          actionsIconTheme:
              const IconThemeData(color: OSTColors.navForegroundDark),
          systemOverlayStyle: SystemUiOverlayStyle.light,
        ),
        textButtonTheme: TextButtonThemeData(
          style: ButtonStyle(
            splashFactory: NoSplash.splashFactory,
            foregroundColor: MaterialStateProperty.resolveWith(
                (states) => OSTColors.buttonForegroundDark),
            backgroundColor: MaterialStateProperty.resolveWith(
                (states) => OSTColors.buttonBackgroundDark),
            textStyle: MaterialStateProperty.resolveWith(
                (states) => const TextStyle().copyWith(fontSize: 16.sp)),
          ),
        ),
        textTheme: TextTheme(
          bodyText1: OSTTextStyle.textDark,
          bodyText2: OSTTextStyle.bodyText2Dark,
          subtitle1: OSTTextStyle.subtext1Dark,
          subtitle2: OSTTextStyle.subtext2Dark,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          elevation: 0.5,
          selectedItemColor: OSTColors.primaryDark,
        ),
        errorColor: OSTColors.errorDark,
        indicatorColor: OSTColors.primaryDark,
        scaffoldBackgroundColor: OSTColors.backgroundDark,
        dividerTheme: const DividerThemeData(
          color: OSTColors.dividerDark,
        ),
        textSelectionTheme: const TextSelectionThemeData(
          cursorColor: OSTColors.primaryDark,
          selectionColor: OSTColors.primaryDark,
        ),
      );
}
