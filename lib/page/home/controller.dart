import 'package:easy_refresh/easy_refresh.dart';
import 'package:get/get.dart';
import 'package:ost_digital_application/common/entity/photo.dart';
import 'package:ost_digital_application/common/service/index.dart';

import 'state.dart';

class HomeController extends GetxController with StateMixin<String> {
  HomeController();

  final homeState = HomeState();
  final _size = 20;

  // Getx RxStatus
  void testForChange() async {
    change(null, status: RxStatus.loading());
    Future.delayed(const Duration(seconds: 2)).then((value) {
      change('error', status: RxStatus.error('error'));
    });
  }

  void updateState() async {
    change(null, status: RxStatus.loading());

    dynamic data = await _request();
    _handleData(data);
  }

  _handleData(dynamic data, {bool load = false}) {
    if (data is OSTError) {
      change(data.msg, status: RxStatus.error(data.msg));
      return;
    }

    if (load == true) {
      homeState.photos.addAll(data);
    } else {
      homeState.photos = data;
    }
    change('Success loding!', status: RxStatus.success());
  }

  _setParams([int page = 1]) {
    return {
      'resourceType': '0,2,4',
      'page': homeState.page,
      'size': _size,
      'type': 'json',
    };
  }

  _request([int page = 1]) async {
    final response = await HttpUtil().fetch(
      Api.photos,
      quertParameters: _setParams(page),
    );
    if (response is OSTError) {
      return response;
    }
    List list = response as List;
    List<PhotoEntity> photos =
        list.map((e) => PhotoEntity.fromJson(e)).toList();
    return photos;
  }

  // EasyRefresh
  onRefresh() async {
    homeState.page = 1;
    dynamic data = await _request();
    _handleData(data);
    homeState.refreshController.finishRefresh();
    homeState.refreshController.resetFooter();
    update();
  }

  onLoad() async {
    homeState.page += 1;
    dynamic data = await _request(homeState.page);
    _handleData(data, load: true);
    homeState.refreshController.finishLoad(
        homeState.photos.length < homeState.page * _size
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
    homeState.page = 1;
    homeState.photos = [];
  }

  /// 在 onInit() 之后调用 1 帧。这是进入的理想场所
  @override
  void onReady() {
    // testForChange();
    updateState();
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
