import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:ost_digital_application/util/color.dart';
import 'package:ost_digital_application/util/constant.dart';
import 'package:ost_digital_application/util/device.dart';
import 'package:ost_digital_application/util/handle_error.dart';
import 'package:ost_digital_application/util/language.dart';
import 'package:ost_digital_application/util/log.dart';
import 'package:ost_digital_application/util/quick_actions.dart';
import 'package:ost_digital_application/util/route.dart';
import 'package:ost_digital_application/util/shared_preference.dart';
import 'package:ost_digital_application/util/theme.dart';

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

  // 当前是否登录
  String? isLogin() {
    bool? login = SpUtil.getBool(SharedKey.login);
    return (login == false) ? RouteGet.login : RouteGet.home;
  }

  void initLanguage(){
    SpUtil.putString(AppLanguageKey.language, LanguageKey.chinese);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      checkerboardOffscreenLayers: true, // 检查离屏渲染
      // showSemanticsDebugger: true, // 显示语义视图
      // showPerformanceOverlay: true, // 显示性能标签

      initialRoute: isLogin(),
      getPages: RouteGet.getPages,

      themeMode: currentThemeMode(),
      theme: themeData(isDark: false),
      darkTheme: themeData(isDark: true),

      translations: Language(),
      locale: const Locale('zh', 'CN'),// 跟随系统 Get.deviceLocale
      fallbackLocale: const Locale('zh', 'CN'),
    );
  }
}
