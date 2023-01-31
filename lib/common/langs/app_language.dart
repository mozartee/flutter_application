import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../help/shared_preference.dart';
import 'keys.dart';
import 'en_US.dart';
import 'zh_CN.dart';

class AppLanguage {
  static final transitions = _LanguageTranslation();
  static final locale = _LanguageTranslation.locale;
  static const fallbackLocale = _LanguageTranslation.fallbackLocale;
}

class _LanguageTranslation extends Translations {
  static const _chineseLocale = Locale('zh', 'CN');
  static const _englishLocale = Locale('en', 'US');

  // 默认，若locale不存在，则显示这个
  static const fallbackLocale = _chineseLocale;

  static Locale? get locale {
    String? language = SpUtil.getString(AppLanguageKey.language);
    if (language != null && language.isNotEmpty) {
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

  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': en_US,
        'zh_CN': zh_CN,
      };
}
