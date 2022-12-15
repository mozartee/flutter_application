import 'package:ost_digital_application/common/help/shared_preference.dart';

class BaseEntity<T> {
  BaseEntity(this.code, this.message, this.data);

  int? code;
  late String? message;
  T? data;

  BaseEntity.fromJson(Map<String, dynamic> json) {
    code = json[ResponseKey.code] as int?;
    message = json[ResponseKey.message] as String?;
    if (json.containsKey(ResponseKey.data)) {
      data = _generateObject(json[ResponseKey.data] as Object);
    }
  }

  T? _generateObject(Object json) {
    if (T.toString() == 'String') {
      return json.toString() as T;
    } else {}
  }
}
