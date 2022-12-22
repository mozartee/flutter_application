import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/page/home/widgets/success_page.dart';

import '../../../common/widget/load.dart';
import '../../../common/widget/page_load_status/empty.dart';
import '../../../common/widget/page_load_status/error.dart';
import '../index.dart';

class HomePageBody extends GetView<HomeController> {
  const HomePageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) => _successWidget(state),
      onLoading: _loadWidget(),
      onEmpty: _emptyWidget(),
      onError: (error) => _errorWidget(),
    );
  }

  _loadWidget() => const LoadPage();

  _successWidget(String? text) => const ListPage();

  _errorWidget() => ErrorPage(
        onPressed: () => controller.updateState(),
      );

  _emptyWidget() => EmptyPage(
        onPressed: () => controller.updateState(),
      );
}
