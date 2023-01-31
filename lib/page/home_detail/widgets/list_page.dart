import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/common/widget/index.dart';
import 'package:ost_digital_application/page/home_detail/controller.dart';

class HomeDetailListPage extends StatefulWidget {
  const HomeDetailListPage({super.key});

  @override
  State<HomeDetailListPage> createState() => _HomeDetailListPageState();
}

class _HomeDetailListPageState extends State<HomeDetailListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    return const _PageList();
  }

  @override
  bool get wantKeepAlive => true;
}

class _PageList extends GetView<HomeDetailController> {
  const _PageList();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeDetailController>(
        init: HomeDetailController(),
        builder: (child) {
          return controller.obx(
            (state) => _loadPage(),
            onLoading: const LoadPage(),
            onEmpty: const EmptyPage(),
            onError: (_) =>
                ErrorPage(onPressed: () => controller.updateState()),
          );
        });
  }

  EasyRefresh _loadPage() {
    return EasyRefresh(
      onRefresh: () => controller.onRefresh(),
      child: AnimationLimiter(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return AnimationConfiguration.staggeredList(
                    position: index,
                    child: SlideAnimation(
                      child: Card(
                        elevation: 0,
                        margin:
                            EdgeInsets.only(top: 10.h, left: 10.w, right: 10.w),
                        child: ListTile(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          title: Text(
                              controller.homeDetailState.comments[index].name ??
                                  ''),
                          subtitle: Text(
                              controller.homeDetailState.comments[index].body ??
                                  ''),
                          onTap: () {},
                        ),
                      ),
                    ),
                  );
                },
                childCount: controller.homeDetailState.comments.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
