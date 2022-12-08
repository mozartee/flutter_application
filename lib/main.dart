import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:ost_digital_application/common/constant.dart';
import 'package:ost_digital_application/common/handle_error.dart';
import 'package:ost_digital_application/common/lang/translation.dart';
import 'package:ost_digital_application/common/log.dart';
import 'package:ost_digital_application/common/quick_actions.dart';
import 'package:ost_digital_application/common/routes/route.dart';
import 'package:ost_digital_application/common/shared_preference.dart';

import 'package:flustars_flutter3/flustars_flutter3.dart' show SpUtil;
import 'package:get/route_manager.dart';

import 'common/device.dart';
import 'common/lang/keys.dart';
import 'common/theme/route.dart';

Future<void> main() async {
  // 确保初始化完成
  WidgetsFlutterBinding.ensureInitialized();

  // sharedPreferences
  await SpUtil.getInstance();

  // 异常处理
  handleError(() => runApp(MyApp()));

  // // 启动页、导航页，隐藏状态栏，之后显示
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //     overlays: [SystemUiOverlay.bottom]);
}

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    Log.init();
    initDio();
    initQuickActions();
    initLanguage();
  }

  void initDio() {
    if (!Constant.isRelease) {}
  }

  String? initialRoute() {
    return Share.notFirstDisplay() == false
        ? Routes.splash
        : Share.login() == false
            ? Routes.login
            : Routes.tabbar;
  }

  void initLanguage() {
    SpUtil.putString(AppLanguageKey.language, Languages.chinese);
    // set splash for test.
    // SpUtil.putBool(SharedKey.splash, false);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: designSize,
      builder: (context, child) {
        return GetMaterialApp(
          title: 'Flutter',
          debugShowCheckedModeBanner: false,
          // checkerboardOffscreenLayers: true, // 检查离屏渲染
          // showSemanticsDebugger: true, // 显示语义视图(残障人士)
          // showPerformanceOverlay: true, // 显示性能标签

          initialRoute: initialRoute(),
          getPages: getPages(),
          themeMode: currentThemeMode(), //ThemeDataMode.current,
          theme: ThemeData().light,
          darkTheme: ThemeData().dark,
          translations: LanguageTranslations(),
          locale: LanguageTranslations.locale,
          fallbackLocale: LanguageTranslations.fallbackLocale,
        );
      },
    );

    // return GetMaterialApp(
    //   title: 'Flutter',
    //   debugShowCheckedModeBanner: false,
    //   // checkerboardOffscreenLayers: true, // 检查离屏渲染
    //   // showSemanticsDebugger: true, // 显示语义视图(残障人士)
    //   // showPerformanceOverlay: true, // 显示性能标签

    //   initialRoute: initialRoute(),
    //   getPages: AppPages.getPages,
    //   themeMode: currentThemeMode(), //ThemeDataMode.current,
    //   theme: ThemeData().light,
    //   darkTheme: ThemeData().dark,
    //   translations: LanguageTranslations(),
    //   locale: LanguageTranslations.locale,
    //   fallbackLocale: LanguageTranslations.fallbackLocale,
    // );
  }
}
