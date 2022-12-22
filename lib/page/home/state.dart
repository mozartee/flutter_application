import 'package:easy_refresh/easy_refresh.dart';

import '../../common/entity/index.dart';

class HomeState {
  late EasyRefreshController refreshController;
  late int itemCount;
  late List<CommentEntity> comments;
}
