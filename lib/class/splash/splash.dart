import 'package:flutter/material.dart';

import 'package:flustars_flutter3/flustars_flutter3.dart' show SpUtil;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_swiper_null_safety_flutter3/flutter_swiper_null_safety_flutter3.dart';
import 'package:get/get.dart';

import '/common/assets.dart';
import '/common/device.dart';
import '/common/routes/header.dart';
import '../../common/lang/keys.dart';
import '../../common/shared_preference.dart';

class Splash extends StatelessWidget {
  Splash({Key? key}) : super(key: key);

  final List<String> _guideList = ['app_start_1', 'app_start_2', 'app_start_3'];

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: designSize);

    return Swiper(
      key: const Key('swiper'),
      loop: false,
      itemCount: _guideList.length,
      itemBuilder: (_, index) => _buildWidget(index),
    );
  }

  Widget _buildWidget(int index) => index != _guideList.length - 1
      ? Assets.loadImage(_guideList[index], format: ImageFormat.webp)
      : Stack(
          children: [
            Assets.loadImage(_guideList[index], format: ImageFormat.webp),
            Align(
              alignment: Alignment(0, 0.59.h),
              child: SizedBox(
                width: 120.w,
                height: 40.h,
                child: TextButton(
                  child: Text(Languages.splashbutton.tr),
                  onPressed: () {
                    Get.offNamed(
                        Share.login() == true ? Routes.tabbar : Routes.login);
                    SpUtil.putBool(SharedKey.splash, true);
                  },
                ),
              ),
            ),
          ],
        );
}
