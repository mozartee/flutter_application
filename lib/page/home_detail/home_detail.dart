import 'package:flutter/material.dart';

import '../../common/help/assets.dart';

class HomeDetail extends StatelessWidget {
  const HomeDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Detail"),
      ),
      body: Center(
        child: Assets.loadImage(
          '02',
          format: ImageFormat.svg,
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}
