import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/common/routes/index.dart';
import 'package:ost_digital_application/page/mine/controller.dart';
import 'package:ost_digital_application/page/mine/widgets/body.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../../common/help/assets.dart';

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
            leading: Tooltip(
              message: 'Show web view in Chorme/Safari',
              triggerMode: TooltipTriggerMode.longPress,
              child: IconButton(
                icon: const Icon(Icons.web_rounded),
                onPressed: () async {
                  const urlString = 'https://www.baidu.com';
                  if (await canLaunchUrlString(urlString)) {
                    await launchUrlString(urlString);
                  }
                },
              ),
            ),
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
        ],
      );
}
