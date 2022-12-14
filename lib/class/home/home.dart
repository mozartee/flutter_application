import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/common/assets.dart';
import 'package:ost_digital_application/widget/loading.dart';

import '../../common/lang/keys.dart';
import '../../common/routes/key.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final count = 0.obs;

  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(context, designSize: designSize);

    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text(Languages.home.tr),
          actions: [
            IconButton(
              onPressed: () {
                Loading.show(
                    'this is a long long long long text,to show anything!');
                // Get.toNamed(
                //   Routes.homeDetail,
                //   arguments: {"name": "Jaxo", "years": 19},
                // );
              },
              icon: const Icon(Icons.next_plan),
            )
          ],
        ),
        body: buildBody(),
      ),
    );
  }

  buildBody() {
    return Center(
      child: Assets.loadImage(
        '01',
        format: ImageFormat.svg,
        width: 300,
        height: 300,
      ),
    );
  }
}
