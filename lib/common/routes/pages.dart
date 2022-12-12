import 'package:get/get.dart';

import '../../class/home/home.dart';
import '../../class/home/home_detail.dart';
import '../../class/login/login.dart';
import '../../class/login/signup.dart';
import '../../class/mine/mine.dart';
import '../../class/mine/setting.dart';
import '../../class/splash/splash.dart';
import '../../class/tabbar/tabbar.dart';

import '../../class/mine/theme/header.dart';
import '../../class/mine/language/header.dart';
import 'header.dart';

List<GetPage> getPages() => [
      GetPage(name: Routes.splash, page: () => Splash()),
      GetPage(name: Routes.tabbar, page: () => Tabbar()),
      GetPage(name: Routes.login, page: () => const Login()),
      GetPage(name: Routes.signup, page: () => SignUp()),
      GetPage(name: Routes.home, page: () => Home()),
      GetPage(name: Routes.homeDetail, page: () => const HomeDetail()),
      GetPage(name: Routes.mine, page: () => const Mine()),
      GetPage(name: Routes.setting, page: () => const Setting()),
      GetPage(
        name: Routes.themeChange,
        page: () => const ThemeChange(),
        binding: ThemeChangeBindings(),
      ),
      GetPage(
        name: Routes.languageChange,
        page: () => const LanguageChange(),
        binding: LanguageChangeBinding(),
      ),
    ];
