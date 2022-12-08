import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../shared_preference.dart';
import 'route.dart';

class LanguageTranslations extends Translations {
  static Locale? get locale {
    String? language = SpUtil.getString(AppLanguageKey.language);
    if (language != null) {
      if (language == Languages.chinese) return _chineseLocale;
      return _englishLocale;
    } else {
      Locale? locale = Get.deviceLocale;
      String? languageCode = locale?.languageCode;
      if (languageCode != null) {
        String? language;
        if (languageCode == 'zh') {
          language = Languages.chinese;
        } else if (languageCode == 'en') {
          language = Languages.english;
        }

        if (language != null) {
          SpUtil.putString(AppLanguageKey.language, language);
        }
        return locale;
      }
      // 默认是中文
      SpUtil.putString(AppLanguageKey.language, Languages.chinese);
      return _chineseLocale;
    }
  }

  //=> Get.deviceLocale; //Locale('zh', 'CN');
  static const fallbackLocale = Locale('zh', 'CN');

  static const _chineseLocale = Locale('zh', 'CN');
  static const _englishLocale = Locale('en', 'US');

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'zh_CN': zh_CN,
      };
}
