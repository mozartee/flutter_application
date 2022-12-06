import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/util/language.dart';
import 'package:ost_digital_application/util/route.dart';

import '../../util/device.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final count = 0.obs;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: designSize);

    return Center(
      child: Scaffold(
        appBar: AppBar(
          title: Text(LanguageKey.home.tr),
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(
                  RouteGet.homeDetail,
                  arguments: {"name": "Jaxo", "years": 19},
                );
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
    return const Center(
      child: Text('Home'),
    );
  }
}
