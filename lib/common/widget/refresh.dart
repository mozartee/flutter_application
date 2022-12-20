import 'package:easy_refresh/easy_refresh.dart';

class Refresh {
  Refresh();

  static void init() {
    EasyRefresh.defaultHeaderBuilder = () => const ClassicHeader(
          showMessage: false,
          dragText: '下拉开始刷新',
          armedText: '松开刷新',
          readyText: '正在刷新',
          processingText: '正在刷新',
          processedText: '刷新完成',
          failedText: '刷新失败',
          noMoreText: '已显示全部数据',
        );

    EasyRefresh.defaultFooterBuilder = () => const ClassicFooter(
          showMessage: false,
          dragText: '上拉加载更多',
          armedText: '松开加载',
          readyText: '正在加载',
          processingText: '正在加载',
          processedText: '加载完成',
          failedText: '加载失败',
          noMoreText: '已显示全部数据',
        );
  }
}
