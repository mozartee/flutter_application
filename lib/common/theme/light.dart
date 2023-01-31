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
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            elevation: 0,
            primary: Colors.white,
            shadowColor: const Color.fromARGB(0, 53, 29, 29),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
        ),
        cardTheme: CardTheme(
          elevation: 0,
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        splashFactory: NoSplash.splashFactory,
        tooltipTheme: const TooltipThemeData(
          triggerMode: TooltipTriggerMode.manual,
        ),
        extensions: [
          ListTileColor.light(),
        ],
      );
}
