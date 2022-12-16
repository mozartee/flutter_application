import 'package:get/get.dart';

import 'index.dart';

class HomeController extends GetxController with StateMixin<String> {
  HomeController();

  // final state = HomeState();

  void testForChange() async {
    change(null, status: RxStatus.loading());
    Future.delayed(const Duration(seconds: 2)).then((value) {
      change('error', status: RxStatus.error('error'));
    });
  }

  void updateState() {
    change(null, status: RxStatus.loading());
    Future.delayed(const Duration(seconds: 2)).then((value) {
      change('Success loding!', status: RxStatus.success());
    });
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    testForChange();
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
