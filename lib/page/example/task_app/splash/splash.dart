import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ost_digital_application/common/help/assets.dart';
import 'package:ost_digital_application/page/example/task_app/splash/data.dart';

class TaskSplashPage extends StatefulWidget {
  const TaskSplashPage({super.key});

  @override
  State<TaskSplashPage> createState() => _TaskSplashPageState();
}

class _TaskSplashPageState extends State<TaskSplashPage> {
  late PageController controller;
  late int currentPage;
  late double offset;
  late double page;
  late double currentOffset;

  @override
  void initState() {
    controller = PageController(initialPage: 0, keepPage: true)
      ..addListener(() {
        offset = controller.offset;
        page = controller.page!;
        print('$offset , $page , $currentPage');
      });

    currentPage = 0;

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  _onPressed(int index) {
    if (index == taskSplashList.length - 1) {
    } else {
      controller.animateToPage(
        index + 1,
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeInOut,
      );
    }
  }

  _onTap(int index) {
    if (index == currentPage) return;
    controller.animateToPage(
      index,
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
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
  }

  PageView _buildPageView() {
    return PageView.builder(
      controller: controller,
      itemBuilder: (BuildContext context, int index) {
        Map<String, dynamic> data = taskSplashList[index];
        return _TaskSplashItem(
          data: data,
          onPressed: () => _onPressed(index),
        );
      },
      itemCount: taskSplashList.length,
      onPageChanged: (index) {
        currentPage = index;
        setState(() {});
      },
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
              bool isCurrentIndex = currentPage == index;
              return GestureDetector(
                onTap: () => _onTap(index),
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
  }) : super(key: key);

  final Map<String, dynamic> data;
  final VoidCallback? onPressed;

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
          padding: const EdgeInsets.symmetric(horizontal: 90.0),
          child: Text(
            data['title'],
            textAlign: TextAlign.center,
            style: GoogleFonts.ubuntu().copyWith(
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
            onPressed: () {},
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
