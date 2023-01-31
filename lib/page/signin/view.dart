import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../common/utils/index.dart';
import '../../common/langs/index.dart';
import '../../common/widget/index.dart';
import 'index.dart';

class Signin extends GetView<SigninController> {
  const Signin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<SigninController>(
        init: SigninController(),
        builder: (_) {
          return SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildImage(),
                _buildText(),
                _buildButton(context),
              ],
            ),
          );
        },
      ),
    );
  }

  Container _buildButton(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16.w, right: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          OSTTextField(
            height: 50,
            hintText: Languages.accounthint.tr,
            textInputAction: TextInputAction.done,
          ),
          Gap.h.dp10,
          SizedBox(
            height: 50,
            width: double.infinity,
            child: TextButton(
              onPressed: () => controller.tapSignin(context),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.pressed)) {
                    return Colors.blue[300];
                  }
                  return Colors.blue;
                }),
                shape: MaterialStateProperty.resolveWith((states) {
                  return RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10));
                }),
              ),
              child: Shimmer.fromColors(
                baseColor: Colors.white,
                highlightColor: Colors.red,
                child: Text(Languages.signin.tr),
              ),
            ),
          ),
          Gap.h.dp4,
          RichText(
            text: TextSpan(
              text: Languages.signinnoaccount.tr,
              style: Theme.of(context).textTheme.subtitle1,
              children: [
                const TextSpan(text: '  '),
                TextSpan(
                  text: Languages.signup.tr,
                  style: TextStyle(color: Colors.red.shade300),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () => controller.toSignup(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Container _buildText() {
    return Container(
      margin: EdgeInsets.fromLTRB(15.w, 20.h, 15.w, 20.h),
      width: double.infinity,
      alignment: AlignmentDirectional.center,
      child: Text(
        Languages.signinmessage.tr,
        style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
      ),
    );
  }

  SizedBox _buildImage() {
    return SizedBox(
      width: double.infinity,
      height: 450.h,
      child: Image.asset(
        'assets/images/subtract.png',
        fit: BoxFit.cover,
      ),
    );
  }
}
