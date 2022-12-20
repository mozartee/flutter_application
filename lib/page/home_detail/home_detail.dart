import 'package:extended_nested_scroll_view/extended_nested_scroll_view.dart';
import 'package:flutter/material.dart';

import '../../common/help/assets.dart';

class HomeDetail extends StatelessWidget {
  const HomeDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExtendedNestedScrollView(
        // pinnedHeaderSliverHeightBuilder: () => 120,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              floating: true,
              snap: false,
              centerTitle: false,
              // title: Text('App Bar'),
              expandedHeight: 150,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('App Bar'),
                background: Assets.loadImage('subtract',),
              ),
            )
          ];
        },
        body: ListView(
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                'A Watch Dog is watching you,Stay At Home!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Assets.loadImage('02', height: 400, format: ImageFormat.svg),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 30),
              child: Text(
                '''1、没加Scaffold，这个其实并不常见(自相矛盾草)，不过可以检查一下，一般总是会有Scaffold的
      2、真正常见的：指定了controller，如果自己创建了一个Controller丢给ScrollView，那必然是会失效的。但是使用controller又是一个很常见且重要的需求，怎么办呢？也很简单，就是不要自己创建新的ScrollController，而是直接取PrimaryScrollController.of(context)这个controller，对其进行自己要做的操作。
      3、相对不太常见且需要分析具体代码的：多个Scaffold导致的冲突。
      注意到其实flutter里的这个点击状态栏并不是真的点击了状态栏，而是点击了“Scaffold提供的位于状态栏的可点击区域”，也就是说，如果有多个Scaffold就会有多个这样的区域。实际情况是，只有最内部的Scaffold的状态栏会有响应，而如果ScrollView所处位置取到的和点击的Scaffold不一致，自然也就不会有滚动到顶部的feature
      ''',
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
