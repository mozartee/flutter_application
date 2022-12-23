import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/page/home/widgets/success_page.dart';

import '../../../common/widget/index.dart';
import '../index.dart';

class HomePageBody extends GetView<HomeController> {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => _successWidget(state),
      onLoading: _loadWidget(),
      onEmpty: _emptyWidget(),
      onError: (error) => _errorWidget(error),
    );
  }

  _successWidget(String? text) => const WaterflowPage();
  _loadWidget() => const LoadPage();
  _emptyWidget() => EmptyPage(
        onPressed: () => controller.updateState(),
      );
  _errorWidget(error) => ErrorPage(
        text: error,
        onPressed: () => controller.updateState(),
      );
}
