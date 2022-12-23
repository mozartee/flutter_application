import 'package:easy_refresh/easy_refresh.dart';
import 'package:ost_digital_application/common/entity/photo.dart';

class HomeState {
  late EasyRefreshController refreshController;
  late int page;
  late List<PhotoEntity> photos;
}
