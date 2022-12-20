import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:get/get.dart';

import '../index.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return EasyRefresh(
        controller: controller.refreshController,
        child: ListView.builder(
          padding: const EdgeInsets.only(top: 10),
          itemCount: controller.itemCount,
          itemBuilder: (context, index) {
            return Card(
              elevation: 0,
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                title: Text('Row $index'),
                onTap: () {},
              ),
            );
          },
        ),
        onRefresh: () => controller.onRefresh(),
        onLoad: () => controller.onLoad(),
      );
    });
  }
}
