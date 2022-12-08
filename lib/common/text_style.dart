import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ost_digital_application/common/font.dart';

import 'color.dart';

class OSTTextStyle {
  static TextStyle ts12 = TextStyle(fontSize: FontSize.sp12);
  static TextStyle textSize16 = TextStyle(fontSize: FontSize.sp16);
  static TextStyle textBold14 =
      TextStyle(fontSize: FontSize.sp14, fontWeight: FontWeight.bold);
  static TextStyle textBold16 =
      TextStyle(fontSize: FontSize.sp16, fontWeight: FontWeight.bold);
  static TextStyle textBold18 =
      TextStyle(fontSize: FontSize.sp18, fontWeight: FontWeight.bold);
  static TextStyle textBold24 =
      TextStyle(fontSize: FontSize.sp24, fontWeight: FontWeight.bold);

  static TextStyle navTitle = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.w600,
    color: OSTColors.navTitle,
  );
  static TextStyle navTitleDark = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.w600,
    color: OSTColors.navTitleDark,
  );

  static TextStyle text = const TextStyle(
    // fontSize: 18,
    color: OSTColors.text,
    textBaseline: TextBaseline.alphabetic,
  );
  static TextStyle textDark = const TextStyle(
    // fontSize: 18,
    color: OSTColors.textDark,
    textBaseline: TextBaseline.alphabetic,
  );

  static TextStyle bodyText2 = const TextStyle(
    // fontSize: 18,
    color: OSTColors.text,
    textBaseline: TextBaseline.alphabetic,
  );
  static TextStyle bodyText2Dark = const TextStyle(
    // fontSize: 18,
    color: OSTColors.textDark,
    textBaseline: TextBaseline.alphabetic,
  );

  static TextStyle subtext1 = const TextStyle(
    // fontSize: 14,
    color: OSTColors.subtext1,
  );
  static TextStyle subtext1Dark = const TextStyle(
    // fontSize: 14,
    color: OSTColors.subtext1Dark,
  );

  static TextStyle subtext2 = const TextStyle(
    // fontSize: 12,
    color: OSTColors.subtext2,
  );
  static TextStyle subtext2Dark = const TextStyle(
    // fontSize: 12,
    color: OSTColors.subtext2Dark,
  );
}
