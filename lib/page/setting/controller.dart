import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:get/get.dart';

import '../../common/help/index.dart';
import '../../common/routes/index.dart';
import '../../common/widget/index.dart';

class SettingController extends GetxController {
  void signout() async {
    Loading.show();
    await Future.delayed(const Duration(seconds: 2));
    Loading.dismiss();
    SpUtil.putBool(PageKey.signin, false);
    Get.offAllNamed(Routes.signin);
  }
}
