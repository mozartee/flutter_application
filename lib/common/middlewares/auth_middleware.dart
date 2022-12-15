import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/common/routes/index.dart';

/// 登录拦截
class AuthMiddleware extends GetMiddleware {
  AuthMiddleware({required this.priority});

  // priority值 越小优先级越高
  @override
  // ignore: overridden_fields
  int? priority = 0;

  @override
  RouteSettings? redirect(String? route) {
    // 检查是否登录，或者是否处于相关登录页面
    if (route == Routes.signin ||
        route == Routes.signup ||
        route == Routes.splash ||
        route == Routes.tabbar) {
      return null;
    } else {
      // 登录过期，重新登录
      return const RouteSettings(name: Routes.signin);
    }
  }
}
