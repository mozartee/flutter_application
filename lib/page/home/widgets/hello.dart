import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common/extension/string_extension.dart';
import '../../../common/help/assets.dart';
import '../../../common/widget/empty.dart';
import '../../../common/widget/error.dart';
import '../index.dart';

/// hello
class HelloWidget extends GetView<HomeController> {
  const HelloWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => _successWidget(state),
      onEmpty: _emptyWidget(),
      onError: (error) => _errorWidget(),
    );
  }

  _errorWidget() => ErrorPage(
        onPressed: () => controller.updateState(),
      );

  _emptyWidget() => EmptyPage(
        onPressed: () => controller.updateState(),
      );

  _successWidget(String? text) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(text.nullSafe),
          Assets.loadImage(
            '01',
            format: ImageFormat.svg,
            width: 300,
            height: 300,
          )
        ],
      ),
    );
  }
}
