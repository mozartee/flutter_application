import 'package:easy_refresh/easy_refresh.dart';
import 'package:get/get.dart';

import '../langs/index.dart';

class Refresh {
  Refresh();

  static void init() {
    EasyRefresh.defaultHeaderBuilder = () => header();
    EasyRefresh.defaultFooterBuilder = () => footer();
  }

  static header({bool safeArea = false}) => ClassicHeader(
        showMessage: false,
        dragText: Languages.dragText.tr,
        armedText: Languages.armedText.tr,
        readyText: Languages.readyText.tr,
        processingText: Languages.processingText.tr,
        processedText: Languages.processedText.tr,
        failedText: Languages.failedText.tr,
        noMoreText: Languages.noMoreText.tr,
        safeArea: safeArea,
      );

  static footer({bool safeArea = true}) => ClassicFooter(
        showMessage: false,
        dragText: Languages.dragTextLoad.tr,
        armedText: Languages.dragTextLoad.tr,
        readyText: Languages.dragTextLoad.tr,
        processingText: Languages.dragTextLoad.tr,
        processedText: Languages.dragTextLoad.tr,
        failedText: Languages.dragTextLoad.tr,
        noMoreText: Languages.dragTextLoad.tr,
        safeArea: safeArea,
      );
}
