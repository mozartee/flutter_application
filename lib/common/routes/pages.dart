import 'package:get/get.dart';

import '../../class/home/home/index.dart';
import '../../class/home/home_detail.dart';
import '../../class/login/login.dart';
import '../../class/login/signup.dart';
import '../../class/mine/language/header.dart';
import '../../class/mine/mine.dart';
import '../../class/mine/setting.dart';
import '../../class/mine/theme/header.dart';
import '../../class/splash/splash.dart';
import '../../class/tabbar/tabbar.dart';

import 'header.dart';

List<GetPage> getPages() => [
      GetPage(name: Routes.splash, page: () => Splash()),
      GetPage(name: Routes.tabbar, page: () => Tabbar()),
      GetPage(name: Routes.login, page: () => const Login()),
      GetPage(name: Routes.signup, page: () => SignUp()),
      GetPage(
        name: Routes.home,
        page: () => const HomePage(),
        binding: HomeBinding(),
      ),
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
