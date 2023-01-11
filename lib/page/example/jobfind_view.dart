import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/common/entity/job.dart';

import 'controller.dart';

class JobFindPage extends StatelessWidget {
  JobFindPage({super.key});

  final DemoController controller = Get.put<DemoController>(DemoController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DemoController>(
      init: DemoController(),
      // tag: chooseJobControllerTag,
      builder: (controller) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFF9DFD4),
                Color(0xFFFFFFFF),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            children: [
              _buildHeader(),
              Expanded(child: _buildGrid()),
              _buildBottom()
            ],
          ),
        );
      },
    );
  }

  SafeArea _buildHeader() {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 56),
        child: Column(
          children: [
            Text(
              'Tell us what kind of jobs you are looking for',
              textAlign: TextAlign.center,
              style: Get.theme.textTheme.headline5!.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  GridView _buildGrid() {
    return GridView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: controller.typeList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (_, index) {
        return GridItem(
          controller: controller,
          index: index,
        );
      },
    );
  }

  _buildBottom() {
    return Material(
      color: controller.choosedType
          ? const Color(0xFFFF804B)
          : const Color(0xFFF4F7FD),
      child: InkWell(
        onTap: () => controller.findJob(),
        child: SizedBox(
          height: 70,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Find Jobs',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color:
                        controller.choosedType ? Colors.white : Colors.blueGrey,
                  ),
                ),
                Icon(
                  Icons.arrow_forward,
                  color:
                      controller.choosedType ? Colors.white : Colors.blueGrey,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class GridItem extends StatelessWidget {
  const GridItem({
    Key? key,
    required this.controller,
    required this.index,
  }) : super(key: key);

  final DemoController controller;
  final int index;

  @override
  Widget build(BuildContext context) {
    JobEntity entity = controller.typeList[index];
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: entity.choosed == true
          ? const Color(0xFF013E5D)
          : const Color(0xFFF4F7FD),
      child: InkWell(
        splashFactory: InkSparkle.splashFactory,
        borderRadius: BorderRadius.circular(12),
        onTap: () => controller.changeBoxChoosed(index),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                transitionBuilder: (child, animation) {
                  Tween<double> tween = Tween(begin: -pi / 12, end: 0);
                  return RotationTransition(
                      turns: tween.animate(animation), child: child);
                },
                child: entity.choosed == true
                    ? Icon(
                        key: ValueKey<bool>(entity.choosed!),
                        Icons.check_box_rounded,
                        color: const Color(0xFFF4F7FD),
                      )
                    : Icon(
                        key: ValueKey<bool>(entity.choosed!),
                        Icons.check_box_outline_blank_rounded,
                        color: const Color(0xFF013E5D),
                      ),
              ),
              Expanded(
                  child: Center(
                child: FractionallySizedBox(
                    widthFactor: 0.75,
                    heightFactor: 1,
                    child: Image.network(
                      entity.url!,
                      fit: BoxFit.cover,
                    )),
              )),
              Center(
                heightFactor: 1.5,
                child: Text(
                  entity.title ?? '',
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: entity.choosed == true ? Colors.white : Colors.black,
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
