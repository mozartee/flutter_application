import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

import 'artical.dart';

part 'user.g.dart';

@JsonSerializable(explicitToJson: true)
class User {
  User(this.name, this.age, this.artical);

  String name;
  int age;
  Artical artical;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  String toString(){
    return jsonEncode(this);
  }
}
