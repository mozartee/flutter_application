import 'package:easy_refresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/common/entity/comment.dart';
import 'package:ost_digital_application/common/service/index.dart';

import 'state.dart';

class HomeController extends GetxController with StateMixin<String> {
  HomeController();

  final homeState = HomeState();

  // Getx RxStatus
  void testForChange() async {
    change(null, status: RxStatus.loading());
    Future.delayed(const Duration(seconds: 2)).then((value) {
      change('error', status: RxStatus.error('error'));
    });
  }

  void updateState() async {
    change(null, status: RxStatus.loading());

    homeState.comments = await _request();
    // await _formData();
    change('Success loding!', status: RxStatus.success());
  }

  Future _formData() async {
    await HttpUtil().postForm(
      'https://t.duodian.api.cheng1hu.com/v1/index/recommendDoctor',
      data: {
        "channel": "ios",
        "version": '1.0.0',
        'sign': 'test',
      },
    );
  }

  Future<List<CommentEntity>> _request() async {
    final response = await HttpUtil().fetch(Api.comments);
    List list = response;
    List<CommentEntity> comments =
        list.map((e) => CommentEntity.fromJson(e)).toList();
    return comments;
  }

  // EasyRefresh
  onRefresh() async {
    homeState.comments = await _request();
    homeState.refreshController.finishRefresh();
    homeState.refreshController.resetFooter();
    update();
  }

  onLoad() async {
    await Future.delayed(const Duration(seconds: 2));
    homeState.itemCount += 10;
    homeState.refreshController.finishLoad(homeState.itemCount >= 30
        ? IndicatorResult.noMore
        : IndicatorResult.success);
    update();
  }

  /// 在 widget 内存中分配后立即调用。
  @override
  void onInit() {
    super.onInit();

    homeState.refreshController = EasyRefreshController(
      controlFinishRefresh: true,
      controlFinishLoad: true,
    );
    homeState.itemCount = 10;
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    testForChange();
    super.onReady();
  }

  /// 在 [onDelete] 方法之前调用。
  @override
  void onClose() {
    super.onClose();
  }

  /// dispose 释放内存
  @override
  void dispose() {
    super.dispose();
  }
}
