import 'package:get/get.dart';

import 'index.dart';

class SigninBingding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SigninController>(() => SigninController());
  }
}
