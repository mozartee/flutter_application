import 'package:flutter/material.dart';

/// 使用 ThemeExtension 扩展自定义颜色值
class ListTileColor extends ThemeExtension<ListTileColor> {
  factory ListTileColor.light() =>
      const ListTileColor(backgroundColor: Color(0xFFF4F7FD));
  factory ListTileColor.dark() =>
      const ListTileColor(backgroundColor: Color(0xFF121212));

  const ListTileColor({required this.backgroundColor});
  final Color? backgroundColor;

  @override
  ThemeExtension<ListTileColor> copyWith({Color? backgroundColor}) {
    return ListTileColor(
        backgroundColor: backgroundColor ?? this.backgroundColor);
  }

  @override
  ThemeExtension<ListTileColor> lerp(
      ThemeExtension<ListTileColor>? other, double t) {
    if (other is! ListTileColor) {
      return this;
    }
    return ListTileColor(
        backgroundColor: Color.lerp(backgroundColor, other.backgroundColor, t));
  }

  @override
  String toString() {
    return "ListTileColor('backgroundColor:$backgroundColor')";
  }
}
