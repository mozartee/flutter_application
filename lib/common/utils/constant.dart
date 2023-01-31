import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const sourceHanFontFamily = 'Source_Han_Serif_CN_VF_Regular';

class Constant {
  /// true: 线上环境
  static const bool isRelease = kReleaseMode;

  /// navgationBar actions icon size
  static double iconSize = 30.0.h;

  /// button height
  static double buttonHeight = 40.h;

  /// http connect time
  static const httpConnectTime = 10000;

  /// http receive time
  static const httpReceiveTime = 5000;
}
