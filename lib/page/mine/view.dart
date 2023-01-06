import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/common/routes/index.dart';
import 'package:ost_digital_application/page/mine/controller.dart';
import 'package:ost_digital_application/page/mine/widgets/body.dart';

import '../../common/help/assets.dart';
import '../../common/langs/index.dart';

class Mine extends GetView<MineController> {
  const Mine({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MineController>(
      init: MineController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: controller.showInfoOnBar ? _title : null,
            actions: [
              IconButton(
                onPressed: () {
                  Get.toNamed(Routes.setting);
                },
                icon: const Icon(Icons.more_horiz_outlined),
              ),
            ],
          ),
          body: const BodyView(),
        );
      },
    );
  }

  Widget? get _title => Row(
    mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 41,
                height: 41,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.black45),
                ),
              ),
              SizedBox(
                width: 34,
                height: 34,
                child: ClipOval(child: Assets.loadImage('GuLu-01')),
              ),
            ],
          ),
          // const Padding(padding: EdgeInsets.only(top: 16)),
          // Text(
          //   'Raffialdo Bay',
          //   style: Get.theme.textTheme.bodySmall,
          // ),
        ],
      );
}
