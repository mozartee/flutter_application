import 'dart:io';

import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/util/language.dart';
import 'package:ost_digital_application/util/route.dart';
import 'package:ost_digital_application/util/shared_preference.dart';
import 'package:ost_digital_application/util/theme.dart';

import '../../widget/list_tile.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageKey.setting.tr),
      ),
      body: ListView(
        children: [
          OSTListTile(
            text: LanguageKey.themechange.tr,
            onTap: () => Get.toNamed(RouteGet.themeChange),
          ),
          OSTListTile(
            text: LanguageKey.languagechange.tr,
            onTap: () => Get.toNamed(RouteGet.languageChange),
          ),
        ],
      ),
    );
  }
}

/// 切换主题
class ThemeChange extends StatelessWidget {
  const ThemeChange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageKey.themechange.tr),
      ),
      body: ListView(
        children: [
          OSTListTile(
            text: LanguageKey.themechangelight.tr,
            trailing: Get.isDarkMode == false ? const Icon(Icons.check) : null,
            onTap: () => _changeTheme(index: 0),
          ),
          OSTListTile(
            text: LanguageKey.themechangedark.tr,
            trailing: Get.isDarkMode == true ? const Icon(Icons.check) : null,
            onTap: () => _changeTheme(index: 1),
          ),
        ],
      ),
    );
  }

  void _changeTheme({int index = 0}) {
    if (index == 0) {
      if (Get.isDarkMode == true) {
        SpUtil.putString(AppThemeKey.theme, ThemeMode.light.value);
        Get.changeTheme(ThemeData.light());

        Future.delayed(const Duration(seconds: 1)).then((value) {
          // Get.forceAppUpdate();
          Get.back();
        });
      }
    } else if (index == 1) {
      if (Get.isDarkMode == false) {
        SpUtil.putString(AppThemeKey.theme, ThemeMode.dark.value);
        Get.changeTheme(ThemeData.dark());

        Future.delayed(const Duration(seconds: 1)).then((value) {
          // Get.forceAppUpdate();
          Get.back();
        });
      }
    }
  }
}

/// 语言
class ChangeLanguage extends StatelessWidget {
  const ChangeLanguage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isCN =
        SpUtil.getString(AppLanguageKey.language) == LanguageKey.chinese;
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageKey.languagechange.tr),
      ),
      body: ListView(
        children: [
          OSTListTile(
            text: LanguageKey.languagechangecn.tr,
            trailing: isCN == true ? const Icon(Icons.check) : null,
            onTap: () => _changeLanguage(index: 0),
          ),
          OSTListTile(
            text: LanguageKey.languagechangeen.tr,
            trailing: isCN == false ? const Icon(Icons.check) : null,
            onTap: () => _changeLanguage(index: 1),
          ),
        ],
      ),
    );
  }

  void _changeLanguage({int index = 0}) {
    late Locale locale;
    late String language;
    if (index == 0) {
      locale = const Locale('zh', 'CN');
      language = LanguageKey.chinese;
    } else if (index == 1) {
      locale = const Locale('en', 'US');
      language = LanguageKey.english;
    }

    // 切换语言
    Get.updateLocale(locale);
    // 保存语言
    SpUtil.putString(AppLanguageKey.language, language);

    Future.delayed(const Duration(seconds: 1)).then((value) => Get.back());
  }
}
