import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/route_manager.dart';
import 'package:ost_digital_application/util/constant.dart';
import 'package:ost_digital_application/util/device.dart';
import 'package:ost_digital_application/util/handle_error.dart';
import 'package:ost_digital_application/util/log.dart';
import 'package:ost_digital_application/util/quick_actions.dart';
import 'package:ost_digital_application/util/route.dart';
import 'package:quick_actions/quick_actions.dart';

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
  }

  void initDio() {
    if (!Constant.isRelease) {}
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteGet.home,
      getPages: RouteGet.getPages,
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
