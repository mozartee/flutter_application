import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/lang/route.dart';
import '../../../common/shared_preference.dart';

class LanguageController extends GetxController {
  late String? currentLanguage;

  // 切换语言
  void changeLanguage({int index = 0}) {
    late Locale locale;
    late String language;
    if (index == 0) {
      locale = const Locale('zh', 'CN');
      language = Languages.chinese;
    } else if (index == 1) {
      locale = const Locale('en', 'US');
      language = Languages.english;
    }

    // 切换语言
    Get.updateLocale(locale);
    // 保存语言
    SpUtil.putString(AppLanguageKey.language, language);
    // 延迟返回
    Future.delayed(const Duration(microseconds: 500))
        .then((value) => Get.back());
  }

  @override
  onInit() {
    debugPrint('初始化');

    Locale? locale = LanguageTranslations.locale;
    String? languageCode = locale?.languageCode;
    if (languageCode != null) {
      String? language;
      if (languageCode == 'zh') {
        debugPrint('设备是中文');
        language = Languages.chinese;
      } else if (languageCode == 'en') {
        debugPrint('设备是英文');
        language = Languages.english;
      }

      if (language != null) {
        currentLanguage = language;
        SpUtil.putString(AppLanguageKey.language, language);

        update();
      }
    }
    super.onInit();
  }
}
