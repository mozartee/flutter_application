import 'dart:ui';

import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:ost_digital_application/page/demo/signin_dialog.dart';

class JobApplyPage extends StatefulWidget {
  const JobApplyPage({super.key});

  @override
  State<JobApplyPage> createState() => _JobApplyPageState();
}

class _JobApplyPageState extends State<JobApplyPage> {
  bool showLogin = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            width: Get.width * 1.7,
            left: 100,
            bottom: 100,
            child: Image.asset('assets/images/Spline.png'),
          ),
          Positioned.fill(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: const SizedBox(),
            ),
          ),
          // const RiveAnimation.asset('assets/RiveAssets/shapes.riv'),
          // Positioned.fill(
          //   child: BackdropFilter(
          //     filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
          //     child: const SizedBox(),
          //   ),
          // ),

          AnimatedPositioned(
            top: showLogin ? -50 : 0,
            width: Get.width,
            height: Get.height,
            duration: const Duration(milliseconds: 250),
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Spacer(),
                    SizedBox(
                      width: 260,
                      child: Column(
                        children: const [
                          Text(
                            'Learn design & code',
                            style: TextStyle(
                              fontSize: 60,
                              fontWeight: FontWeight.w700,
                              height: 1.2,
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            "Don’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    TextButton(
                      onPressed: () {
                        Future.delayed(const Duration(milliseconds: 800))
                            .then((value) {
                          showLogin = true;
                          setState(() {});
                          showCustomDialog(context, onValue: (_) {
                            showLogin = false;
                            setState(() {});
                          });
                        });
                      },
                      child: const Text('Login'),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24),
                      child: Text(
                          "Purchase includes access to 30+ courses, 240+ premium tutorials, 120+ hours of videos, source files and certificates."),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
