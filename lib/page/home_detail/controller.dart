import 'package:easy_refresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/page/home_detail/state.dart';

import '../../common/entity/index.dart';
import '../../common/service/index.dart';

class HomeDetailController extends GetxController with StateMixin<String> {
  HomeDetailController();

  final HomeDetailState homeDetailState = HomeDetailState();

  void testForChange() async {
    change(null, status: RxStatus.loading());
    Future.delayed(const Duration(seconds: 2)).then((value) {
      change('error', status: RxStatus.error('error'));
    });
  }

  void updateState() async {
    change(null, status: RxStatus.loading());

    homeDetailState.comments = await _request();
    change('Success loding!', status: RxStatus.success());
  }

  Future<List<CommentEntity>> _request() async {
    final response = await HttpUtil().fetch(Api.comments);
    List list = response;
    List<CommentEntity> comments =
        list.map((e) => CommentEntity.fromJson(e)).toList();
    return comments;
  }

  onRefresh() async {
    homeDetailState.comments = await _request();
    homeDetailState.refreshController.finishRefresh();
    homeDetailState.refreshController.resetFooter();
    update();
  }

  // onLoad() async {
  //   await Future.delayed(const Duration(seconds: 2));
  //   homeDetailState.itemCount += 10;
  //   homeDetailState.refreshController.finishLoad(homeDetailState.itemCount >= 30
  //       ? IndicatorResult.noMore
  //       : IndicatorResult.success);
  //   update();
  // }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();

    homeDetailState.refreshController = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
    homeDetailState.comments = [];
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    testForChange();
    super.onReady();
  }
}
