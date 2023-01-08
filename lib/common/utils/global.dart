import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/material.dart';
import 'package:ost_digital_application/common/widget/refresh.dart';

import '../help/index.dart';
import '../widget/index.dart';

/// 初始化处理
class Global {
  static Future init() async {
    WidgetsFlutterBinding.ensureInitialized();
    await SpUtil.getInstance();
    Log.init();
    Loading();
    initQuickActions();
    Refresh.init();
  }
}
