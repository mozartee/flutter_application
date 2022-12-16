import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/common/theme/index.dart';

import '../../../common/widget/list_tile.dart';
import '../../../common/langs/index.dart';

import 'controller.dart';

class ThemeChange extends GetView<ThemeChangeController> {
  const ThemeChange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ThemeChangeController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(Languages.themechange.tr),
        ),
        body: ListView(
          children: [
            // OSTListTile(
            //   text: Languages.themechangesys.tr,
            //   leading: const Icon(Icons.phone_iphone),
            //   trailing: currentThemeMode() == ThemeMode.system
            //       ? const Icon(Icons.check)
            //       : null,
            //   onTap: () => controller.changeTheme(),
            // ),
            // OSTListTile(
            //   text: Languages.themechangelight.tr,
            //   leading: const Icon(Icons.light_mode),
            //   trailing: currentThemeMode() == ThemeMode.light
            //       ? const Icon(Icons.check)
            //       : null,
            //   onTap: () => controller.changeTheme(),
            // ),
            _listTile(0),
            _listTile(1),
            _listTile(2),
          ],
        ),
      ),
    );
  }

  OSTListTile _listTile(int index) {
    return OSTListTile(
      text: index == 0
          ? Languages.themechangesys.tr
          : index == 1
              ? Languages.themechangelight.tr
              : Languages.themechangedark.tr,
      leading: index == 0
          ? const Icon(Icons.phone_iphone)
          : index == 1
              ? const Icon(Icons.light_mode)
              : const Icon(Icons.dark_mode),
      trailing: _trailing(index),
      onTap: () => controller.changeTheme(index: index),
    );
  }

  Icon? _trailing(int index) {
    if (index == 0) {
      return currentThemeMode() == ThemeMode.system
          ? const Icon(Icons.check)
          : null;
    } else if (index == 1) {
      return currentThemeMode() == ThemeMode.light
          ? const Icon(Icons.check)
          : null;
    }
    return currentThemeMode() == ThemeMode.dark
        ? const Icon(Icons.check)
        : null;
  }
}
