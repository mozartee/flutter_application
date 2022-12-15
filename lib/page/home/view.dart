import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/langs/keys.dart';
import '../../common/routes/key.dart';
import 'index.dart';
import 'widgets/widgets.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  // 主视图
  Widget _buildView() {
    return const HelloWidget();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: Text(Languages.home.tr),
            actions: [
              IconButton(
                onPressed: () {
                  Get.toNamed(
                    Routes.homeDetail,
                    arguments: {"name": "Jaxo", "years": 19},
                  );
                },
                icon: const Icon(Icons.next_plan),
              ),
            ],
          ),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
