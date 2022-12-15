import 'package:get/get.dart';
import 'controller.dart';

class LanguageChangeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LanguageController>(() => LanguageController());
  }
}
