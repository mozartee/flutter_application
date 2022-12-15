import 'package:get/get.dart';
import 'controller.dart';

class ThemeChangeBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ThemeChangeController>(() => ThemeChangeController());
  }
}
