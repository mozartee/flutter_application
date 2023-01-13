import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../help/index.dart';
import 'theme_extensions.dart';

class ThemeDataLight {
  static ThemeData get theme => ThemeData(
        brightness: Brightness.light,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: OSTColors.primary,
          surface: Colors.white,
        ),
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          // 列表滑动appBar背景阴影不显示
          scrolledUnderElevation: 0,
          // 正常状态下appBar背景阴影不显示
          elevation: 0,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
              elevation: 0,
              primary: Colors.black,
              onPrimary: ColorScheme.fromSwatch().onPrimary,
              shadowColor: const Color.fromARGB(0, 53, 29, 29),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16))),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            elevation: 0,
            primary: const Color.fromARGB(0, 53, 29, 29),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
        ),
        cardTheme: CardTheme(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        ),
        splashFactory: NoSplash.splashFactory,
        tooltipTheme: const TooltipThemeData(
          triggerMode: TooltipTriggerMode.manual,
        ),
        extensions: [
          ListTileColor.light(),
        ],
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
