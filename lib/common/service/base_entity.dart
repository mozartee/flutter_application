import 'package:ost_digital_application/common/entity/user.dart';
import 'package:ost_digital_application/common/help/shared_preference.dart';

import '../help/index.dart';

class BaseEntity<T> {
  BaseEntity(this.code, this.message, this.data);

  int? code;
  late String? message;
  T? data;

  BaseEntity.fromJson(Map<String, dynamic> json) {
    code = json[ResponseKey.code] as int?;
    message = json[ResponseKey.message] as String?;
    if (json.containsKey(ResponseKey.data)) {
      data = _generateObject(json[ResponseKey.data]);
    }
  }

  T? _generateObject(dynamic json) {
    if (json == null) return null;

    if (json is String) {
      return json.toString() as T;
    } else if (json is List) {
      return _getListChildType<T>(json);
    } else {
      return _fromJsonSingle<T>(json);
    }
  }

  T? _getListChildType<T>(List<dynamic> json) {
    // 此处对 Entity 进行匹配
    if ([User] is T) {
      return json.map((e) => User.fromJson(e)).toList() as T;
    }

    Log.d('${json.toString()} is not found');
    return null;
  }

  T? _fromJsonSingle<T>(Map<String, dynamic> json) {
    // 此处对 Entity 进行匹配
    final String type = json.toString();
    if (type == (User).toString()) {
      return User.fromJson(json) as T;
    }

    Log.d('$type is not found');
    return null;
  }
}
