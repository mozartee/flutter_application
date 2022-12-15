import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/common/routes/index.dart';

import '../../common/help/assets.dart';
import '../../common/langs/index.dart';

class Mine extends StatelessWidget {
  const Mine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Languages.mine.tr),
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.setting);
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
      body: Center(
        child: Assets.loadImage(
          '03',
          format: ImageFormat.svg,
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}
