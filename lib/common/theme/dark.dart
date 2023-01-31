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
}
