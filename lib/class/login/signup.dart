import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/util/route.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('注册')),
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '输入您的账号',
                style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
              ),
              const OSTTextField(hintText: 'account'),
              const OSTTextField(hintText: 'password'),
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
                      child: const Text('Sign Up')),
                ),
              ),
            ],
          ),
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
