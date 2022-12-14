import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ost_digital_application/common/constant.dart';
import 'package:ost_digital_application/common/font.dart';

import 'color.dart';

String? get _fontFamily => sourceHanFontFamily;

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
    fontFamily: _fontFamily,
  );
  static TextStyle navTitleDark = TextStyle(
    fontSize: 17.sp,
    fontWeight: FontWeight.w600,
    color: OSTColors.navTitleDark,
    fontFamily: _fontFamily,
  );

  static TextStyle text = TextStyle(
    // fontSize: 18,
    color: OSTColors.text,
    textBaseline: TextBaseline.alphabetic,
    fontFamily: _fontFamily,
  );
  static TextStyle textDark = TextStyle(
    // fontSize: 18,
    color: OSTColors.textDark,
    textBaseline: TextBaseline.alphabetic,
    fontFamily: _fontFamily,
  );

  static TextStyle bodyText2 = TextStyle(
    // fontSize: 18,
    color: OSTColors.text,
    textBaseline: TextBaseline.alphabetic,
    fontFamily: _fontFamily,
  );
  static TextStyle bodyText2Dark = TextStyle(
    // fontSize: 18,
    color: OSTColors.textDark,
    textBaseline: TextBaseline.alphabetic,
    fontFamily: _fontFamily,
  );

  static TextStyle subtext1 = TextStyle(
    // fontSize: 14,
    color: OSTColors.subtext1,
    fontFamily: _fontFamily,
  );
  static TextStyle subtext1Dark = TextStyle(
    // fontSize: 14,
    color: OSTColors.subtext1Dark,
    fontFamily: _fontFamily,
  );

  static TextStyle subtext2 = TextStyle(
    // fontSize: 12,
    color: OSTColors.subtext2,
    fontFamily: _fontFamily,
  );
  static TextStyle subtext2Dark = TextStyle(
    // fontSize: 12,
    color: OSTColors.subtext2Dark,
    fontFamily: _fontFamily,
  );
}
