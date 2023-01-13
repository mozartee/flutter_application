import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/common/entity/job.dart';
import 'package:ost_digital_application/common/theme/theme_extensions.dart';
import 'package:ost_digital_application/common/utils/index.dart';

import 'controller.dart';

class JobSearchPage extends GetView<DemoController> {
  const JobSearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put<DemoController>(DemoController());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Explore Jobs'),
        actions: [
          IconButton(
            onPressed: () => _showFilter(context),
            icon: const FaIcon(FontAwesomeIcons.filter, size: 18),
          )
        ],
      ),
      body: _buildBody(context),
    );
  }

  _showFilter(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      constraints:
          BoxConstraints(maxHeight: Get.height - Get.mediaQuery.padding.top),
      isScrollControlled: true,
      builder: (context) {
        return Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            title: const Text('Filter'),
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: const Icon(Icons.close),
              ),
            ],
          ),
          body: Material(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: ListView.separated(
              itemBuilder: (_, index) {
                JobEntity entity = controller.jobList[index];

                return ListTile(
                  title: Text(entity.title ?? ''),
                  subtitle: Text("${entity.time ?? ''} • ${entity.address}"),
                  onTap: () {},
                );
              },
              separatorBuilder: (_, index) {
                return const Divider(
                  indent: 16,
                  height: 1,
                );
              },
              itemCount: controller.jobList.length,
            ),
          ),
        );
      },
    );
  }

  _buildBody(BuildContext context) {
    return GetBuilder<DemoController>(
      builder: (_) {
        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: _buildSearchBar(context)),
                SliverToBoxAdapter(child: _buildTitleBar()),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      JobEntity entity = controller.jobList[index];
                      return JobCard(
                        entity: entity,
                        onTap: () => controller.onTapTile(index),
                        onTapBookmark: () => controller.onTapBookmark(index),
                      );
                    },
                    childCount: controller.jobList.length,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  _buildTitleBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Text(
        '26 Jobs Opportunity',
        style: Get.theme.textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  _buildSearchBar(BuildContext context) {
    var listTileColor = Theme.of(context).extension<ListTileColor>();

    return Container(
      margin: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: listTileColor?.backgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: TextField(
        decoration: InputDecoration(
          border: InputBorder.none,
          fillColor: listTileColor?.backgroundColor,
          prefixIcon: const Icon(Icons.search),
          hintText: 'Design',
        ),
      ),
    );
  }
}

class JobCard extends StatelessWidget {
  const JobCard({
    Key? key,
    required this.entity,
    this.onTap,
    this.onTapBookmark,
  }) : super(key: key);

  final JobEntity entity;
  final VoidCallback? onTap, onTapBookmark;

  @override
  Widget build(BuildContext context) {
    var listTileColor = Theme.of(context).extension<ListTileColor>();

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Material(
        borderRadius: BorderRadius.circular(12),
        color: entity.choosed == true
            ? const Color(0xFFF9DFD4)
            : listTileColor?.backgroundColor,
        child: ListTile(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          onTap: onTap,
          leading: Icon(entity.logo),
          title: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Transform.translate(
              offset: const Offset(-20, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    entity.title ?? '',
                    style: Get.theme.textTheme.labelLarge!
                        .copyWith(fontWeight: FontWeight.w600),
                  ),
                  Text(
                    "${entity.time ?? ''} • ${entity.address}",
                    style: Get.theme.textTheme.labelSmall,
                  ),
                ],
              ),
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: onTapBookmark,
                child: entity.choosed == true
                    ? const FaIcon(
                        FontAwesomeIcons.solidBookmark,
                        color: Color(0xFFFF804B),
                        size: 18,
                      )
                    : const FaIcon(
                        FontAwesomeIcons.bookmark,
                        color: Color(0xFFFF804B),
                        size: 18,
                      ),
              ),
              Gap.h.dp6,
              Text(
                entity.price ?? '',
                style: Get.theme.textTheme.labelMedium!
                    .copyWith(fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
