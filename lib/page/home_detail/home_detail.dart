import 'package:flutter/material.dart';
import 'package:easy_refresh/easy_refresh.dart';
import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../common/help/assets.dart';

class HomeDetail extends StatefulWidget {
  const HomeDetail({Key? key}) : super(key: key);

  @override
  State<HomeDetail> createState() => _HomeDetailState();
}

class _HomeDetailState extends State<HomeDetail>
    with SingleTickerProviderStateMixin {
  int _listCount = 10;
  int _gridCount = 10;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    return Scaffold(
      body: ExtendedNestedScrollView(
        onlyOneScrollInBody: true,
        pinnedHeaderSliverHeightBuilder: () {
          return MediaQuery.of(context).padding.top; //kToolbarHeight;
        },
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              expandedHeight: 150,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  'NextedScrollView',
                  style:
                      TextStyle(color: themeData.textTheme.titleLarge?.color),
                ),
                // centerTitle: false,
                background: Assets.loadImage(
                  'subtract',
                ),
              ),
            )
          ];
        },
        body: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              TabBar(
                labelColor: themeData.colorScheme.primary,
                indicatorColor: themeData.colorScheme.primary,
                tabs: const [
                  Tab(text: 'List'),
                  Tab(text: 'Grid'),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    _listTab(),
                    _gridTab(themeData),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  final List<String> _gridList = [
    'Animal',
    'Git your git',
    'a child is playing',
    'living the life,and you will find the live'
  ];

  ExtendedVisibilityDetector _gridTab(ThemeData themeData) {
    return ExtendedVisibilityDetector(
      uniqueKey: const Key('gridTab'),
      child: EasyRefresh(
        child: Container(
          color: Colors.red,
          child: CustomScrollView(
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 10),
                sliver: SliverToBoxAdapter(
                  child: Container(
                    color: Colors.green,
                    child: AnimationLimiter(
                      child: MasonryGridView.count(
                        crossAxisCount: 4,
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                        itemCount: _gridCount,
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return AnimationConfiguration.staggeredGrid(
                            position: index,
                            columnCount: 4,
                            child: SlideAnimation(
                              child: Container(
                                color: Colors.blue,
                                child: Center(
                                    child:
                                        Text('${_gridList[index % 4]} at $index')),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
              ),
              // SliverPadding(
              //   padding: const EdgeInsets.all(10.0),
              //   sliver:
              //    SliverGrid(
              //     delegate: SliverChildBuilderDelegate(
              //       (context, index) {return Container(
              //         decoration: BoxDecoration(
              //           color: themeData.colorScheme.primary,
              //           borderRadius: BorderRadius.circular(8),
              //         ),
              //         child: ListTile(
              //           title: Text('Grid View at Row $index'),
              //         ),
              //       );},
              //       childCount: _gridCount,
              //     ),
              //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              //       mainAxisSpacing: 10,
              //       crossAxisSpacing: 10,
              //       crossAxisCount: 2,
              //       childAspectRatio: 3 / 4,
              //     ),
              //   ),
              // )
            ],
          ),
        ),
        onRefresh: () {
          if (!mounted) return;
          _gridCount = 10;
          setState(() {});
        },
        onLoad: () {
          if (!mounted) return;
          _gridCount += 10;
          setState(() {});
        },
      ),
    );
  }

  ExtendedVisibilityDetector _listTab() {
    return ExtendedVisibilityDetector(
      uniqueKey: const Key('listTab'),
      child: EasyRefresh(
        footer: const ClassicFooter(position: IndicatorPosition.locator),
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
                          margin: const EdgeInsets.only(
                              top: 8, left: 10, right: 10),
                          child: ListTile(
                            title: Text('A Hero Like Messi at Row $index'),
                          ),
                        ),
                      ),
                    );
                  },
                  childCount: _listCount,
                ),
              ),
              const FooterLocator.sliver(),
            ],
          ),
        ),
        onRefresh: () {
          if (!mounted) return;
          _listCount = 10;
          setState(() {});
        },
        onLoad: () {
          if (!mounted) return;
          _listCount += 10;
          setState(() {});
        },
      ),
    );
  }
}
