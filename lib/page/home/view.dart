import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/routes/keys.dart';
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

  //value [0,1]
  double saturation = 1;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (_) {
        // 黑白化（通过设置饱和度为0实现）
        return ColorFiltered(
          colorFilter: ColorFilter.matrix(_saturation(saturation)),
          child: _buildScaffold(),
        );
      },
    );
  }

  // default matrix
  List<double> get _matrix => [
        1, 0, 0, 0, 0, //R
        0, 1, 0, 0, 0, //G
        0, 0, 1, 0, 0, //B
        0, 0, 0, 1, 0, //A
      ];

  // Generate a matrix of specified saturation
  // [sat] A value of 0 maps the color to gray-scale. 1 is identity.
  List<double> _saturation(double sat) {
    final m = _matrix;
    final double invSat = 1 - sat;
    final double R = 0.213 * invSat;
    final double G = 0.715 * invSat;
    final double B = 0.072 * invSat;
    m[0] = R + sat;
    m[1] = G;
    m[2] = B;
    m[5] = R;
    m[6] = G + sat;
    m[7] = B;
    m[10] = R;
    m[11] = G;
    m[12] = B + sat;
    return m;
  }

  Scaffold _buildScaffold() {
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
        icon: const Icon(Icons.details),
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
