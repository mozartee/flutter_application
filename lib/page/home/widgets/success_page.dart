import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        controller: controller.homeState.refreshController,
        child: ListView.builder(
          padding: EdgeInsets.only(top: 10.w, left: 10.w, right: 10.w),
          itemCount: controller.homeState.comments.length,
          itemBuilder: (context, index) {
            return Card(
              elevation: 0,
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0)),
                title: Text(
                    '${controller.homeState.comments[index].name ?? ''} @${controller.homeState.comments[index].email ?? ''}'),
                subtitle: Text(controller.homeState.comments[index].body ?? ''),
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
