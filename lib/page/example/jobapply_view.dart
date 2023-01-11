import 'dart:ui';

import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:ost_digital_application/page/example/signin_dialog.dart';
import 'jobfind_view.dart';

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
              filter: ImageFilter.blur(sigmaX: 20, sigmaY: 20),
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
                        children: [
                          Text(
                            'Learn design & code',
                            style: GoogleFonts.poppins(
                              fontSize: 60,
                              fontWeight: FontWeight.w700,
                              height: 1.2,
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            "Don’t skip design. Learn design and code, by building real apps with Flutter and Swift. Complete courses about the best tools.",
                            style: GoogleFonts.poppins(),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(flex: 2),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: TextButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith((states) {
                            if (states.contains(MaterialState.pressed)) {
                              return Colors.blue[300];
                            }
                            return Colors.blue;
                          }),
                          shape: MaterialStateProperty.resolveWith((states) {
                            return RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16));
                          }),
                        ),
                        onPressed: () {
                          showLogin = true;
                          setState(() {});
                          showCustomDialog(context, onValue: (result) {
                            showLogin = false;
                            setState(() {});
                            if (result == true) {
                              debugPrint('assdada');
                              Future.delayed(transitionDuration, () {
                                // Get.to(() => const SuperStorePage());
                                Get.to(() => JobFindPage());
                              });
                            }
                          });
                        },
                        child: const Text(
                          'Login',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
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
