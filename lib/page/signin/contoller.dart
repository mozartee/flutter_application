import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/common/help/index.dart';
import 'package:ost_digital_application/common/routes/index.dart';

import '../../common/widget/index.dart';

class SigninController extends GetxController {
  SigninController();

  void tapSignin(BuildContext context) {
    FocusScope.of(context).unfocus();
    SpUtil.putBool(PageKey.signin, true);
    Loading.show();
    Future.delayed(const Duration(milliseconds: 2000)).then((value) {
      Loading.dismiss();
      Get.offNamed(Routes.tabbar);
    });
  }

  void toSignup() {
    Get.toNamed(Routes.signup);
  }
}
