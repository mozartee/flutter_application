import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/util/device.dart';
import 'package:ost_digital_application/util/language.dart';
import 'package:ost_digital_application/util/route.dart';

class Login extends StatelessWidget {
  const Login({Key? key, this.appStart = true}) : super(key: key);

  /// 是否是app直接进入登录页面
  final bool appStart;

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: designSize);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: double.infinity,
              height: 490.h,
              child: Image.asset(
                'assets/images/subtract.png',
                fit: BoxFit.cover,
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(15.w, 30.h, 15.w, 20.h),
              width: double.infinity,
              alignment: AlignmentDirectional.center,
              child: Text(
                LanguageKey.signinmessage.tr,
                style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.w, right: 15.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: 40.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(24.h),
                      child: TextButton(
                        onPressed: () {
                          if (appStart == true) {
                            Get.offNamed(RouteGet.tabbar);
                          } else {
                            Get.toNamed(RouteGet.tabbar);
                          }
                        },
                        child: Text(LanguageKey.signin.tr),
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  RichText(
                    text: TextSpan(
                      text: LanguageKey.signinnoaccount.tr,
                      style: Theme.of(context).textTheme.subtitle1,
                      children: [
                        const TextSpan(text: '  '),
                        TextSpan(
                          text: LanguageKey.signup.tr,
                          style: TextStyle(color: Colors.red.shade300),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(RouteGet.signup);
                            },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
