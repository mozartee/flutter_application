import 'package:get/instance_manager.dart';
import 'package:ost_digital_application/page/home/index.dart';
import 'package:ost_digital_application/page/mine/controller.dart';

class MineBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MineController>(() => MineController());
  }
}
