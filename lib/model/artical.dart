import 'package:json_annotation/json_annotation.dart';

part 'artical.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Artical {
  Artical(this.id, this.name);
  String id;
  String? name;

  factory Artical.fromJson(Map<String, dynamic> json) =>
      _$ArticalFromJson(json);
  Map<String, dynamic> toJson() => _$ArticalToJson(this);
}
