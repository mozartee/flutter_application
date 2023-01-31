import 'keys.dart';
import 'pages.dart';

class AppRoutes {
  static const initial = Routes.splash;
  static const splash = Routes.splash;
  static const tabbar = Routes.tabbar;
  static const signin = Routes.signin;
  static const signup = Routes.signup;
  static const home = Routes.home;
  static const homeDetail = Routes.homeDetail;
  static const mine = Routes.mine;
  static const setting = Routes.setting;
  static const themeChange = Routes.themeChange;
  static const languageChange = Routes.languageChange;

  static final getPages = pages();
}
