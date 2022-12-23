import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../index.dart';

class WaterflowPage extends StatefulWidget {
  const WaterflowPage({super.key});

  @override
  State<WaterflowPage> createState() => _WaterflowPageState();
}

class _WaterflowPageState extends State<WaterflowPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return EasyRefresh(
        controller: controller.homeState.refreshController,
        onRefresh: () => controller.onRefresh(),
        onLoad: () => controller.onLoad(),
        child: AnimationLimiter(
          child: MasonryGridView.count(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
            crossAxisCount: 2,
            crossAxisSpacing: 6,
            mainAxisSpacing: 6,
            itemCount: controller.homeState.photos.length,
            itemBuilder: (BuildContext context, int index) {
              final imageUrl = controller.homeState.photos[index].url?.p1 ?? '';
              return AnimationConfiguration.staggeredGrid(
                position: index,
                columnCount: 2,
                child: SlideAnimation(
                  child: InkWell(
                    onTap: () {
                      debugPrint('$index');
                      final title = controller.homeState.photos[index].title;
                      Get.to(_DetailPage(url: imageUrl, title: title));
                    },
                    child: Material(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      child: Hero(
                        tag: imageUrl,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(
                              imageUrl,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      );
    });
  }
}

/// Hero demo
class _DetailPage extends StatelessWidget {
  const _DetailPage({this.url, this.title});
  final String? url, title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title ?? 'Detail'),
      ),
      body: Center(
        child: Hero(
          tag: url ?? 'detail',
          child: Image.network(
            url ?? '',
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
