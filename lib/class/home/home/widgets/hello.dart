import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/assets.dart';
import '../index.dart';
import '../../../../common/extension/string_extension.dart';

/// hello
class HelloWidget extends GetView<HomeController> {
  const HelloWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => successWidget(state),
      onLoading: loadingWidget(),
      onEmpty: emptyWidget(),
      onError: (error) => errorWidget(),
    );
  }

  Center errorWidget() => const Center(
        child: Text('出错了~'),
      );

  Center emptyWidget() {
    return const Center(
      child: Text('暂无数据'),
    );
  }

  Center loadingWidget() {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.black,
      ),
    );
  }

  Center successWidget(String? text) {
    return Center(
      child: text == 'success'
          ? Assets.loadImage(
              '01',
              format: ImageFormat.svg,
              width: 300,
              height: 300,
            )
          : Text(text.nullSafe),
    );
  }
}
