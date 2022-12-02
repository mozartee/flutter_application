import 'package:get/get.dart';
import 'package:ost_digital_application/util/route.dart';
import 'package:quick_actions/quick_actions.dart';

import 'device.dart';

///
/// 这里做一些 QuickActions 的操作
///

// App图标长按进入快捷方式功能
void initQuickActions() {
  const firstCutType = 'first cut';
  const secondCutType = 'second cut';
  if (Device.isMobile) {
    const QuickActions quickActions = QuickActions();
    quickActions.initialize((String shortcutType) async {
      switch (shortcutType) {
        case firstCutType:
          {
            Get.toNamed(RouteGet.home);
          }
          break;
        case secondCutType:
          {
            Get.toNamed(RouteGet.homeDetail);
          }
          break;
        default:
          break;
      }
    });

    quickActions.setShortcutItems(<ShortcutItem>[
      // icon 需要分别进入Android 和 iOS 中配置 图片
      const ShortcutItem(
        type: 'first cut',
        localizedTitle: '首页',
      ),
      const ShortcutItem(
        type: 'second cut',
        localizedTitle: '发现',
      ),
    ]);
  }
}
