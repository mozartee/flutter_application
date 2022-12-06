import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/util/language.dart';
import 'package:ost_digital_application/util/route.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LanguageKey.signup.tr)),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              LanguageKey.signupmessage.tr,
              style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
            ),
            OSTTextField(hintText: LanguageKey.accounthint.tr),
            OSTTextField(hintText: LanguageKey.pwdhint.tr),
            Container(
              padding: EdgeInsets.only(top: 20.h),
              width: double.infinity,
              height: 60.h,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24.h),
                child: TextButton(
                    onPressed: () {
                      FocusScope.of(context).requestFocus();
                      Get.toNamed(RouteGet.mine);
                    },
                    child: Text(LanguageKey.signup.tr)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OSTTextField extends StatelessWidget {
  const OSTTextField({
    Key? key,
    this.text,
    this.hintText,
  }) : super(key: key);

  final String? text;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      padding: EdgeInsets.only(top: 10.h),
      child: TextField(
        decoration: InputDecoration(
          hintText: hintText,
          labelText: text,
          border: const OutlineInputBorder(
            // borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
      ),
    );
  }
}
