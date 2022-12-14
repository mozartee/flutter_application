import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

enum ImageFormat { png, jpg, gif, webp, svg }

extension ImageFormatExtension on ImageFormat {
  String get value => ['png', 'jpg', 'gif', 'webp', 'svg'][index];
}

class Assets {
  static String imagePath(String name, {ImageFormat format = ImageFormat.png}) {
    return 'assets/images/$name.${format.value}';
  }

  static Widget loadImage(
    String name, {
    ImageFormat format = ImageFormat.png,
    double? width = double.infinity,
    double? height = double.infinity,
    BoxFit? fit = BoxFit.cover,
    Color? color, // only used in svg picture
    String? semanticsLabel,
  }) {
    if (format == ImageFormat.svg) {
      return SvgPicture.asset(
        Assets.imagePath(name, format: format),
        width: width,
        height: height,
        color: color,
        semanticsLabel: semanticsLabel,
      );
    }
    return Image.asset(
      Assets.imagePath(name, format: format),
      width: width,
      height: height,
      fit: fit,
      semanticLabel: semanticsLabel,
    );
  }
}
