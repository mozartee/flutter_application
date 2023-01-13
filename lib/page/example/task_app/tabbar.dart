import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import 'add_task/add_task.dart';
import 'home/home.dart';

class TaskTabBarPage extends StatelessWidget {
  const TaskTabBarPage({super.key});

  final List<Tab> _tabs = const [
    Tab(icon: FaIcon(FontAwesomeIcons.houseChimneyWindow)),
    Tab(icon: FaIcon(FontAwesomeIcons.calendarDays)),
    Tab(icon: FaIcon(FontAwesomeIcons.commentDots)),
  ];

  _onPressedAdd() {
    Get.to(() => const TaskAddPage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: _buildTabController(),
      ),
    );
  }

  DefaultTabController _buildTabController() {
    return DefaultTabController(
      length: _tabs.length,
      child: Column(
        children: [
          Expanded(child: _buildTabBarView()),
          _buildTabbar(),
        ],
      ),
    );
  }

  Container _buildTabbar() {
    return Container(
      height: 90,
      margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      padding: const EdgeInsets.only(left: 20),
      decoration: BoxDecoration(
        color: const Color(0xFF212121),
        borderRadius: BorderRadius.circular(36.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Expanded(
            child: TabBar(
              tabs: _tabs,
              indicator: const BoxDecoration(),
              isScrollable: true,
              labelPadding: const EdgeInsets.symmetric(horizontal: 28),
            ),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.01)
              ..rotateX(0)
              ..rotateY(pi / 9),
            child: Container(
              width: 60,
              height: 60,
              margin: const EdgeInsets.only(right: 46),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18.0),
              ),
              child: IconButton(
                icon: const FaIcon(FontAwesomeIcons.plus),
                onPressed: () => _onPressedAdd(),
              ),
            ),
          ),
        ],
      ),
    );
  }

  TabBarView _buildTabBarView() {
    return TabBarView(children: [
      const TaskHomePage(),
      Container(color: Colors.red),
      Container(color: Colors.blue),
    ]);
  }
}
