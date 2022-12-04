import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ost_digital_application/util/color.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 1136));
    return Scaffold(
      // appBar: AppBar(
      //   elevation: 0,
      //   title: const Text(
      //     "Login",
      //     style: TextStyle(color: OSTColors.navTitle),
      //   ),
      //   backgroundColor: OSTColors.navBackground,
      //   foregroundColor: OSTColors.navForeground,
      // ),
      body: Container(
        color: OSTColors.background,
        child: SingleChildScrollView(
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
                margin: EdgeInsets.fromLTRB(15.w, 33.h, 15.w, 33.h),
                width: double.infinity,
                color: Colors.red,
                alignment: AlignmentDirectional.center,
                child: const Text(
                  'We are here to make your holiday easier',
                  style: TextStyle(
                    backgroundColor: Colors.blueAccent,
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                margin: EdgeInsets.fromLTRB(15.w, 0.h, 15.w, 30.w),
                height: 58.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.h),
                  color: const Color(0xff7c73c3),
                ),
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    'Get Started',
                    style: TextStyle(
                      color: const Color(0xfffefefe),
                      fontSize: 18.sp,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
