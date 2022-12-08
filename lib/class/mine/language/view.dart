import 'package:flutter/material.dart';

import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/class/mine/language/controller.dart';

import '../../../common/lang/route.dart';
import '../../../common/shared_preference.dart';
import '../../../widget/list_tile.dart';

class LanguageChange extends GetView<LanguageController> {
  const LanguageChange({Key? key}) : super(key: key);

  // final controller = Get.put(LanguageController());

  @override
  Widget build(BuildContext context) {
    final bool isCN =
        SpUtil.getString(AppLanguageKey.language) == Languages.chinese;

    return GetBuilder<LanguageController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(Languages.languagechange.tr),
        ),
        body: ListView(
          children: [
            OSTListTile(
              text: Languages.languagechangecn.tr,
              trailing: isCN == true ? const Icon(Icons.check) : null,
              onTap: () => controller.changeLanguage(),
            ),
            OSTListTile(
              text: Languages.languagechangeen.tr,
              trailing: isCN == false ? const Icon(Icons.check) : null,
              onTap: () => controller.changeLanguage(index: 1),
            ),
          ],
        ),
      ),
    );
  }
}
