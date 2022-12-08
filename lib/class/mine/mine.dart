import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/common/routes/route.dart';

import '../../common/lang/keys.dart';

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
      body: Container(),
    );
  }
}
