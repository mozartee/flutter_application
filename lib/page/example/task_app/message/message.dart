import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/common/help/assets.dart';

class TaskMessagePage extends StatelessWidget {
  const TaskMessagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Message',
              style: Get.theme.textTheme.headline5!
                  .copyWith(fontWeight: FontWeight.w900),
            ),
            Expanded(
              child: Center(
                child: Assets.loadImage('no_message', format: ImageFormat.svg),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
