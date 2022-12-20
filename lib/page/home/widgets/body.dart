import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/page/home/widgets/success_page.dart';

import '../../../../common/extension/string_extension.dart';
import '../../../common/help/assets.dart';
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

  _errorWidget() => ErrorPage(
        onPressed: () => controller.updateState(),
      );

  _emptyWidget() => EmptyPage(
        onPressed: () => controller.updateState(),
      );

  _successWidget(String? text) {
    return ListPage();
    // return Center(
    //   child: Column(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: [
    //       Text(text.nullSafe),
    //       Assets.loadImage(
    //         '01',
    //         format: ImageFormat.svg,
    //         width: 300,
    //         height: 300,
    //       )
    //     ],
    //   ),
    // );
  }
}
