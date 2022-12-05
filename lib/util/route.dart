import 'package:get/route_manager.dart';

import '../class/home_detail/home_detail.dart';
import '../class/home/home.dart';
import '../class/login/login.dart';
import '../class/login/signup.dart';
import '../class/mine/mine.dart';
import '../class/mine/setting.dart';

class RouteGet {
  /// 登录
  static const login = '/login';

  /// 注册
  static const signup = '/signup';

  /// 首页
  static const home = "/home";

  /// 首页详情
  static const homeDetail = "/home_detail";

  /// 个人中心
  static const mine = '/mine';

  /// 设置
  static const setting = '/setting';

  /// 主题切换
  static const themeChange = '/theme_change';

  /// 语言切换
  static const languageChange = '/language_change';

// pages map
  static final List<GetPage> getPages = [
    GetPage(name: login, page: () => const Login()),
    GetPage(name: signup, page: () => const SignUp()),
    GetPage(name: home, page: () => Home()),
    GetPage(name: homeDetail, page: () => const HomeDetail()),
    GetPage(name: mine, page: () => const Mine()),
    GetPage(name: setting, page: () => const Setting()),
    GetPage(name: themeChange, page: () => const ThemeChange()),
    GetPage(name: languageChange, page: () => const ChangeLanguage()),
  ];
}
