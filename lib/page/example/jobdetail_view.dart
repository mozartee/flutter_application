import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/common/entity/job.dart';
import 'package:ost_digital_application/common/help/assets.dart';
import 'package:ost_digital_application/common/utils/index.dart';

import 'data.dart';

class JobDetailPage extends StatelessWidget {
  JobDetailPage({super.key});

  late JobEntity entity;
  @override
  Widget build(BuildContext context) {
    entity = Get.arguments;

    return Scaffold(
      body: _buildBody(context),
    );
  }

  final List<Tab> _tabs = [
    const Tab(text: 'Description'),
    const Tab(text: 'Company'),
    const Tab(text: 'Benefits'),
  ];

  _buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ExtendedNestedScrollView(
            onlyOneScrollInBody: true,
            pinnedHeaderSliverHeightBuilder: () {
              return MediaQuery.of(context).padding.top;
            },
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return _headerSliverBuilder;
            },
            body: _tabbar,
          ),
        ),
        _bottomBar(context),
      ],
    );
  }

  List<Widget> get _headerSliverBuilder {
    return [
      SliverAppBar(
        backgroundColor: ColorsJob.jobBlue,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {},
            icon: entity.choosed == true
                ? const FaIcon(
                    FontAwesomeIcons.solidBookmark,
                    color: ColorsJob.jobOrangle,
                  )
                : const FaIcon(
                    FontAwesomeIcons.bookmark,
                    color: ColorsJob.jobOrangle,
                  ),
          ),
        ],
        expandedHeight: 150,
        flexibleSpace: FlexibleSpaceBar(
          title: _buildSpaceBar(),
        ),
      ),
      SliverToBoxAdapter(
        child: Container(
          color: ColorsJob.jobBlue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Senior UX Designer',
                style: Get.theme.textTheme.headline5!.copyWith(
                  color: Colors.white,
                ),
              ),
              Gap.h.dp6,
              Text(
                entity.address ?? '',
                style: Get.theme.textTheme.labelLarge!.copyWith(
                  color: Colors.white30,
                ),
              ),
              Gap.h.dp16,
              Text(
                "${entity.time} · ${entity.price}",
                style: Get.theme.textTheme.bodyLarge!.copyWith(
                  color: Colors.white,
                ),
              ),
              Gap.h.dp20,
            ],
          ),
        ),
      )
    ];
  }

  Container _buildSpaceBar() {
    return Container(
      height: 50,
      width: 50,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: FaIcon(
          entity.logo,
          size: 40,
          color: ColorsJob.jobgreen,
        ),
      ),
    );
  }

  DefaultTabController get _tabbar {
    return DefaultTabController(
      length: _tabs.length,
      child: Column(
        children: [
          TabBar(
            tabs: _tabs,
            isScrollable: true,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            indicatorColor: ColorsJob.jobOrangle,
            indicatorSize: TabBarIndicatorSize.label,
          ),
          Expanded(
            child: _buildTabbarView(),
          )
        ],
      ),
    );
  }

  _buildTabbarView() {
    return TabBarView(
      children: [
        ExtendedVisibilityDetector(
          uniqueKey: Key(_tabs[0].text ?? '0'),
          child: Center(
            child: Assets.loadImage('01', format: ImageFormat.svg),
          ),
        ),
        ExtendedVisibilityDetector(
          uniqueKey: Key(_tabs[1].text ?? '1'),
          child: Center(
            child: Assets.loadImage('02', format: ImageFormat.svg),
          ),
        ),
        ExtendedVisibilityDetector(
          uniqueKey: Key(_tabs[1].text ?? '1'),
          child: Center(
            child: Assets.loadImage('03', format: ImageFormat.svg),
          ),
        ),
      ],
    );
  }

  _bottomBar(BuildContext context) => Container(
        margin: EdgeInsets.fromLTRB(
            20, 10, 20, MediaQuery.of(context).padding.bottom + 10),
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorsJob.jobOrangle,
          borderRadius: BorderRadius.circular(25),
        ),
        child: TextButton(
          onPressed: () {
            // Get.to(const JobApplyPage());
          },
          child: Text(
            'Apply Jobs',
            style: Get.theme.textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      );
}
