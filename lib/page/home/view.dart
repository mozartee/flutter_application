import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/langs/keys.dart';
import '../../common/routes/key.dart';
import 'index.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

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
          body: const SafeArea(
            child: HomePageBody(),
          ),
        );
      },
    );
  }
}
