import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_easyloading/src/widgets/container.dart';
import 'package:flutter_easyloading/src/widgets/indicator.dart';
import 'package:get/get.dart';

import '../../langs/index.dart';

class LoadPage extends StatelessWidget {
  const LoadPage({Key? key, this.status}) : super(key: key);

  final String? status;

  @override
  Widget build(BuildContext context) {
    // return const SpinKitThreeBounce(color: Colors.white);
    // 套用 flutter_easyloading 内部实现的 Container
    return EasyLoadingContainer(
      status: status ?? Languages.loadingDefaultStatus.tr,
      indicator: const LoadingIndicator(),
      toastPosition: EasyLoadingToastPosition.center,
    );
  }
}
