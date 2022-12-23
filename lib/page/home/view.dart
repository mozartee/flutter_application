import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            leading: _loadLeading(),
            title: Image.network(
              'https://cdn-uat.500px.me/images/logo-500px.png',
              width: 72,
              height: 23,
            ), //Text(Languages.home.tr),
            actions: _loadActions,
          ),
          body: const HomePageBody(),
        );
      },
    );
  }

  List<Widget> get _loadActions {
    return [
      IconButton(
        onPressed: () {
          Get.toNamed(
            Routes.homeDetail,
            arguments: {"name": "Jaxo", "years": 19},
          );
        },
        icon: const Icon(Icons.more_horiz),
      ),
    ];
  }

  IconButton _loadLeading() {
    return IconButton(
      icon: const Icon(Icons.local_laundry_service_outlined),
      onPressed: () {
        Get.snackbar(
          "Youtube",
          "This's a snack bar with show somthing you want to know",
          // backgroundGradient:
          //     const LinearGradient(colors: [Colors.blue, Colors.green]),
          backgroundColor: Colors.white,
          boxShadows: [
            const BoxShadow(color: Color(0xFFEEEEEE), blurRadius: 15)
          ],
          animationDuration: const Duration(milliseconds: 350),
          forwardAnimationCurve: Curves.easeInOut,
          reverseAnimationCurve: Curves.easeInOut,
          onTap: (_) {},
        );
      },
    );
  }
}
