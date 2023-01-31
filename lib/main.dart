import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'common/help/index.dart';
import 'common/langs/index.dart';
import 'common/routes/index.dart';
import 'common/theme/index.dart';
import 'common/utils/index.dart';

Future<void> main() async {
  await Global.init();

  // 异常处理
  handleError(() => runApp(const MyApp()));

  // // 启动页、导航页，隐藏状态栏，之后显示
  // SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  //     overlays: [SystemUiOverlay.bottom]);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: designSize,
      builder: (context, child) {
        return GetMaterialApp(
          // checkerboardOffscreenLayers: true, // 检查离屏渲染
          // showSemanticsDebugger: true, // 显示语义视图(残障人士)
          // showPerformanceOverlay: true, // 显示性能标签
          debugShowCheckedModeBanner: false,
          initialRoute: AppRoutes.initial,
          getPages: AppRoutes.getPages,
          themeMode: APPTheme.themeMode,
          theme: APPTheme.light,
          darkTheme: APPTheme.dark,
          translations: AppLanguage.transitions,
          locale: AppLanguage.locale,
          fallbackLocale: AppLanguage.fallbackLocale,
          builder: EasyLoading.init(),
        );
      },
    );
  }
}
