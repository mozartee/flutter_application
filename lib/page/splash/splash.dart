import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ost_digital_application/common/help/assets.dart';

import 'controller.dart';
import 'data.dart';

class SplashPage extends StatelessWidget {
  SplashPage({super.key});

  final TaskSplashController controller =
      Get.put<TaskSplashController>(TaskSplashController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TaskSplashController>(
      init: controller,
      initState: (_) {},
      builder: (_) {
        return Scaffold(
          body: SafeArea(
            child: Column(
              children: [
                _buildPageControl(),
                Expanded(child: _buildPageView()),
              ],
            ),
          ),
        );
      },
    );
  }

  _buildPageView() {
    return PageView.builder(
      controller: controller.pageController,
      itemBuilder: (BuildContext context, int index) {
        Map<String, dynamic> data = taskSplashList[index];
        return _TaskSplashItem(
          data: data,
          onPressed: () => controller.onPressed(index),
          onPressedSkip: () => controller.skip(),
        );
      },
      itemCount: taskSplashList.length,
      onPageChanged: (index) => controller.onPageChanged(index),
    );
  }

  SizedBox _buildPageControl() {
    return SizedBox(
      height: 40,
      child: UnconstrainedBox(
        child: SizedBox(
          height: 4,
          child: ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              bool isCurrentIndex = controller.currentPage == index;
              return GestureDetector(
                onTap: () => controller.onTap(index),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  width: isCurrentIndex ? 40 : 20,
                  decoration: ShapeDecoration(
                    shape: const StadiumBorder(),
                    color: isCurrentIndex ? Colors.black : Colors.grey[300],
                  ),
                ),
              );
            },
            itemCount: taskSplashList.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
          ),
        ),
      ),
    );
  }
}

class _TaskSplashItem extends StatelessWidget {
  const _TaskSplashItem({
    Key? key,
    required this.data,
    this.onPressed,
    this.onPressedSkip,
  }) : super(key: key);

  final Map<String, dynamic> data;
  final VoidCallback? onPressed;
  final VoidCallback? onPressedSkip;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Assets.loadImage(
            data['url'],
            format: ImageFormat.svg,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 80.0),
          child: Text(
            data['title'],
            textAlign: TextAlign.center,
            style: Get.theme.textTheme.titleMedium!.copyWith(
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
          ),
        ),
        const SizedBox(height: 60),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 36),
          height: 50,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16)),
          child: TextButton(
            onPressed: onPressed,
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.resolveWith((states) => Colors.black),
              foregroundColor:
                  MaterialStateProperty.resolveWith((states) => Colors.white),
              shape: MaterialStateProperty.resolveWith((states) =>
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16))),
              padding: MaterialStateProperty.resolveWith(
                  (states) => const EdgeInsets.symmetric(horizontal: 16.0)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Continue',
                  style: GoogleFonts.ubuntu().copyWith(
                    fontSize: 14,
                  ),
                ),
                const Icon(
                  Icons.arrow_circle_right,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),
        Center(
          child: TextButton(
            onPressed: onPressedSkip,
            child: Text(
              'Skip',
              style: GoogleFonts.ubuntu().copyWith(
                color: Colors.grey[700],
              ),
            ),
          ),
        )
      ],
    );
  }
}
