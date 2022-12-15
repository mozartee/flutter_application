import 'package:get/get.dart';
import 'package:ost_digital_application/page/setting/controller.dart';

class SettingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingController>(() => SettingController());
  }
}
