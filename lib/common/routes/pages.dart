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
import 'app_routes.dart';

List<GetPage> pages() => [
      GetPage(
        name: AppRoutes.splash,
        page: () => SplashPage(),
        middlewares: [WelcomeMiddleware(priority: 1)],
      ),
      GetPage(
        name: AppRoutes.tabbar,
        page: () => TabbarPage(),
        middlewares: [AuthMiddleware(priority: 1)],
      ),
      GetPage(
        name: AppRoutes.signin,
        page: () => Signin(),
        binding: SigninBingding(),
      ),
      GetPage(
        name: AppRoutes.signup,
        page: () => SignUp(),
      ),
      GetPage(
        name: AppRoutes.home,
        page: () => const HomePage(),
        binding: HomeBinding(),
      ),
      GetPage(
        name: AppRoutes.homeDetail,
        page: () => HomeDetail(),
      ),
      GetPage(
        name: AppRoutes.mine,
        page: () => Mine(),
        binding: MineBinding(),
      ),
      GetPage(
        name: AppRoutes.setting,
        page: () => Setting(),
        binding: SettingBinding(),
      ),
      GetPage(
        name: AppRoutes.themeChange,
        page: () => ThemeChange(),
        binding: ThemeChangeBindings(),
      ),
      GetPage(
        name: AppRoutes.languageChange,
        page: () => LanguageChange(),
        binding: LanguageChangeBinding(),
      ),
    ];
