import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/common/help/index.dart';
import 'package:ost_digital_application/common/routes/index.dart';
import 'package:ost_digital_application/common/widget/index.dart';

class SettingController extends GetxController {
  void signout() async {
    Loading.show();
    await Future.delayed(const Duration(seconds: 2));
    SpUtil.putBool(PageKey.signin, false);
    Get.offAllNamed(Routes.tabbar);
  }
}
