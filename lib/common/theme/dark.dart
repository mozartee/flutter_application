import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../help/index.dart';
import 'theme_extensions.dart';

class ThemeDataDark {
  static ThemeData get theme => ThemeData(
        brightness: Brightness.dark,
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          brightness: Brightness.dark,
          seedColor: OSTColors.primaryDark,
          surface: const Color(0xFF303030),
        ),
        appBarTheme: const AppBarTheme(
          // 列表滑动appBar背景阴影不显示
          scrolledUnderElevation: 0,
          // 正常状态下appBar背景阴影不显示
          elevation: 0,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(
            ThemeData(brightness: Brightness.dark).textTheme),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            onPrimary: ColorScheme.fromSwatch().onPrimary,
            primary: ColorScheme.fromSwatch().primary,
            elevation: 0,
            shadowColor: Colors.transparent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          ),
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
        // 去除水波纹
        splashFactory: NoSplash.splashFactory,
        tooltipTheme: const TooltipThemeData(
          triggerMode: TooltipTriggerMode.manual,
        ),
        extensions: [
          ListTileColor.dark(),
        ],
      );
  //  ThemeData.dark().copyWith(
  //       primaryColor: OSTColors.primaryDark,
  //       colorScheme: ColorScheme.fromSwatch().copyWith(
  //         brightness: Brightness.dark,
  //         secondary: OSTColors.primaryDark,
  //       ),
  //       scaffoldBackgroundColor: OSTColors.backgroundDark,
  //       // 去除水波纹
  //       splashFactory: NoSplash.splashFactory,
  //       // 隐藏提示语
  //       tooltipTheme: const TooltipThemeData(
  //         triggerMode: TooltipTriggerMode.manual,
  //       ),
  //       appBarTheme: AppBarTheme(
  //         elevation: 0.0,
  //         foregroundColor: OSTColors.navForegroundDark,
  //         backgroundColor: OSTColors.navBackgroundDark,
  //         titleTextStyle: OSTTextStyle.navTitleDark,
  //         actionsIconTheme:
  //             const IconThemeData(color: OSTColors.navForegroundDark),
  //         systemOverlayStyle: SystemUiOverlayStyle.light,
  //       ),
  //       textButtonTheme: TextButtonThemeData(
  //         style: ButtonStyle(
  //           splashFactory: NoSplash.splashFactory,
  //           foregroundColor: MaterialStateProperty.resolveWith(
  //               (states) => OSTColors.buttonForegroundDark),
  //           backgroundColor: MaterialStateProperty.resolveWith(
  //               (states) => OSTColors.buttonBackgroundDark),
  //           textStyle: MaterialStateProperty.resolveWith(
  //               (states) => const TextStyle().copyWith(fontSize: 16.sp)),
  //         ),
  //       ),
  //       textTheme: TextTheme(
  //         bodyText1: OSTTextStyle.textDark,
  //         bodyText2: OSTTextStyle.bodyText2Dark,
  //         subtitle1: OSTTextStyle.subtext1Dark,
  //         subtitle2: OSTTextStyle.subtext2Dark,
  //       ),
  //       bottomNavigationBarTheme: const BottomNavigationBarThemeData(
  //         elevation: 0.5,
  //         selectedItemColor: OSTColors.primaryDark,
  //       ),
  //       errorColor: OSTColors.errorDark,
  //       indicatorColor: OSTColors.primaryDark,
  //       dividerTheme: const DividerThemeData(
  //         color: OSTColors.dividerDark,
  //       ),
  //       textSelectionTheme: const TextSelectionThemeData(
  //         cursorColor: OSTColors.primaryDark,
  //         selectionColor: OSTColors.primaryDark,
  //       ),
  //     );
}
