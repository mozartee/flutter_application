import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/common/utils/index.dart';

import '../../common/langs/index.dart';
import '../../common/routes/index.dart';
import '../../common/widget/textfield.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  final accountFocusNode = FocusNode();
  final TextEditingController accountController = TextEditingController();
  final pwdFocusNode = FocusNode();
  final TextEditingController pwdController = TextEditingController();

  void verify(context) {
    if (accountController.text.length > 3 && pwdController.text.length > 3) {
      // showDialog(
      //     context: context,
      //     builder: (_) {
      //       // return const AlertDialog(
      //       //   title: Text('Tips'),
      //       // );

      //       // return const CupertinoAlertDialog(
      //       //   title: Text('Tips'),
      //       //   content: Text('Content'),
      //       // );
      //     });

      // showAlert(context, title: 'Alert', content: 'content');

      // Get.defaultDialog(
      //   middleText: 'middleText',
      //   content: const Text('content'),
      //   actions: [
      //     TextButton(
      //       onPressed: () {},
      //       child: Text(
      //         'Cancel',
      //         style: TextStyle(color: Colors.red),
      //       ),
      //     ),
      //     TextButton(
      //       onPressed: () {},
      //       child: Text('Done'),
      //     ),
      //   ],

      //   // textConfirm: 'Done',
      //   // textCancel: 'Cancel',
      // );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(Languages.signup.tr)),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 30.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Languages.signupmessage.tr,
                    style:
                        TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Gap.top()),
                    child: OSTTextField(
                      hintText: Languages.accounthint.tr,
                      focusNode: accountFocusNode,
                      controller: accountController,
                      prefix: const Icon(Icons.account_circle),
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: Gap.top()),
                    child: OSTTextField(
                      hintText: Languages.pwdhint.tr,
                      focusNode: pwdFocusNode,
                      controller: pwdController,
                      obscureText: true,
                      prefix: const Icon(Icons.password),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.h),
                    width: double.infinity,
                    height: Constant.buttonHeight,
                    child: ElevatedButton(
                        onPressed: () {
                          // verify(context);
                          FocusScope.of(context).unfocus();
                          Get.toNamed(Routes.mine);
                        },
                        child: Text(Languages.signup.tr)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
