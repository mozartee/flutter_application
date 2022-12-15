import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

import '../langs/index.dart';
import '../theme/index.dart';

class Loading {
  Loading() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.threeBounce
      ..radius = 10.0
      ..loadingStyle = currentThemeMode() == ThemeMode.dark
          ? EasyLoadingStyle.light
          : EasyLoadingStyle.dark;
  }

  static void show([String? status]) {
    EasyLoading.instance.userInteractions = false;
    EasyLoading.show(status: status ?? Languages.loadingDefaultStatus.tr);
  }

  static void showSuccess(String status) {
    EasyLoading.instance.userInteractions = false;
    EasyLoading.showSuccess(status);
  }

  static void showError(String status) {
    EasyLoading.instance.userInteractions = false;
    EasyLoading.showError(status);
  }

  static void showInfo(String status) {
    EasyLoading.instance.userInteractions = false;
    EasyLoading.showInfo(status);
  }

  static void showProgress(double value, [String? status]) {
    EasyLoading.instance.userInteractions = false;
    EasyLoading.showProgress(value, status: status);
  }

  static void toast(String status) {
    EasyLoading.showToast(status);
  }

  static void dismiss() {
    EasyLoading.instance.userInteractions = true;
    EasyLoading.dismiss();
  }
}
