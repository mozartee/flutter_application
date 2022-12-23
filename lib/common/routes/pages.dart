// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';

import '../../page/home/index.dart';
import '../../page/home_detail/view.dart';
import '../../page/mine/index.dart';
import '../../page/setting/index.dart';
import '../../page/signin/index.dart';
import '../../page/signup/index.dart';
import '../../page/splash/splash.dart';
import '../../page/tabbar/tabbar.dart';
import '../middlewares/index.dart';
import 'index.dart';

List<GetPage> getPages() => [
      GetPage(
        name: Routes.splash,
        page: () => Splash(),
        middlewares: [WelcomeMiddleware(priority: 1)],
      ),
      GetPage(
        name: Routes.tabbar,
        page: () => TabbarPage(),
        middlewares: [AuthMiddleware(priority: 1)],
      ),
      GetPage(
        name: Routes.signin,
        page: () => Signin(),
        binding: SigninBingding(),
      ),
      GetPage(name: Routes.signup, page: () => SignUp()),
      GetPage(
        name: Routes.home,
        page: () => const HomePage(),
        binding: HomeBinding(),
      ),
      GetPage(name: Routes.homeDetail, page: () => HomeDetail()),
      GetPage(name: Routes.mine, page: () => Mine()),
      GetPage(
        name: Routes.setting,
        page: () => Setting(),
        binding: SettingBinding(),
      ),
      GetPage(
        name: Routes.themeChange,
        page: () => ThemeChange(),
        binding: ThemeChangeBindings(),
      ),
      GetPage(
        name: Routes.languageChange,
        page: () => LanguageChange(),
        binding: LanguageChangeBinding(),
      ),
    ];
