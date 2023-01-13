import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/page/example/task_app/home/goal.dart';
import 'package:ost_digital_application/page/example/task_app/home/project.dart';

class TaskHomePage extends StatelessWidget {
  const TaskHomePage({super.key});

  final List<Tab> _tabs = const [
    Tab(text: 'Projects'),
    Tab(text: 'Goals'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _buildTabController(),
    );
  }

  DefaultTabController _buildTabController() {
    return DefaultTabController(
      length: _tabs.length,
      child: Column(
        children: [
          _buildTabbar(),
          Expanded(child: _buildTabBarView()),
        ],
      ),
    );
  }

  _buildTabbar() {
    return Align(
      alignment: Alignment.centerLeft,
      child: TabBar(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        tabs: _tabs,
        labelStyle: Get.theme.textTheme.headline4!
            .copyWith(fontWeight: FontWeight.w900),
        unselectedLabelStyle: Get.theme.textTheme.headline4!
            .copyWith(fontWeight: FontWeight.w900),
        labelColor: const Color(0xFF212121),
        unselectedLabelColor: const Color(0xFF999999),
        indicator: const BoxDecoration(),
        isScrollable: true,
      ),
    );
  }

  TabBarView _buildTabBarView() {
    return const TabBarView(children: [
      TaskProjectPage(),
      TaksGoalPage(),
    ]);
  }
}
