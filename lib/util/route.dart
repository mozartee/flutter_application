import 'package:get/route_manager.dart';

import '../class/home_detail/home_detail.dart';
import '../class/home/home.dart';

class RouteGet {
  // 首页
  static const home = "/home";
  // 首页详情
  static const homeDetail = "/home_detail";

// pages map
  static final List<GetPage> getPages = [
    GetPage(name: home, page: () => Home()),
    GetPage(name: homeDetail, page: () => const HomeDetail()),
  ];
}
