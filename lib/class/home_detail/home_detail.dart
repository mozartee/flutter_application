import 'package:flutter/material.dart';
import 'package:ost_digital_application/util/color.dart';

class HomeDetail extends StatelessWidget {
  const HomeDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home Detail",
          style: TextStyle(color: OSTColors.navTitle),
        ),
        backgroundColor: OSTColors.navBackground,
        foregroundColor: OSTColors.navForeground,
        elevation: 1,
      ),
      body: Container(
        color: OSTColors.background,
      ),
    );
  }
}
