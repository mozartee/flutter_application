import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/common/help/index.dart';
import 'package:ost_digital_application/common/routes/index.dart';

class WelcomeMiddleware extends GetMiddleware {
  WelcomeMiddleware({required this.priority});

  @override
  // ignore: overridden_fields
  int? priority = 0;

  @override
  RouteSettings? redirect(String? route) {
    // 是否是首次打开App
    if (Share.notFirstDisplay == false) {
      return null;
    }
    // 是否登录（此处暂时理解为默认需要登录）
    else if (Share.signin == false) {
      return const RouteSettings(name: Routes.signin);
    }
    // 否则，进入到首页
    else {
      return const RouteSettings(name: Routes.tabbar);
    }
  }
}
