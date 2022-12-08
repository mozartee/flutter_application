import 'package:flustars_flutter3/flustars_flutter3.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Constant {
  /// true: 线上环境
  static const bool isRelease = kReleaseMode;

  /// navgationBar actions icon size
  static double iconSize = 30.0.h;
}

/// SizeBox
class Gap {
  static top({double y = 10.0}) => y.h;


  static Width w = Width();
  static Height h = Height();
  static wh({
    double w = double.infinity,
    double h = double.infinity,
  }) =>
      SizedBox(
        width: w.w,
        height: h.h,
      );
  static whc({
    double w = double.infinity,
    double h = double.infinity,
    Widget? child,
  }) =>
      SizedBox(
        width: w.w,
        height: h.h,
        child: child,
      );
}

class Width {
  final dp4 = SizedBox(width: 4.w);
  final dp6 = SizedBox(width: 6.w);
  final dp8 = SizedBox(width: 8.w);
  final dp10 = SizedBox(width: 10.w);
  final dp16 = SizedBox(width: 16.w);
  final dp20 = SizedBox(width: 20.w);
  final dp24 = SizedBox(width: 24.w);
}

class Height {
  final dp4 = SizedBox(height: 4.h);
  final dp6 = SizedBox(height: 6.h);
  final dp8 = SizedBox(height: 8.h);
  final dp10 = SizedBox(height: 10.h);
  final dp16 = SizedBox(height: 16.h);
  final dp20 = SizedBox(height: 20.h);
  final dp24 = SizedBox(height: 24.h);
}
