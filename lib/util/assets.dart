import 'package:flutter/material.dart';

enum ImageFormat { png, jpg, gif, webp }

extension ImageFormatExtension on ImageFormat {
  String get value => ['png', 'jpg', 'gif', 'webp'][index];
}

class Assets {
  static String imagePath(String name, {ImageFormat format = ImageFormat.png}) {
    return 'assets/images/$name.${format.value}';
  }

  static loadImage(
    String name, {
    ImageFormat format = ImageFormat.png,
    double? width = double.infinity,
    double? height = double.infinity,
    BoxFit? fit = BoxFit.cover,
  }) {
    return Image.asset(
      Assets.imagePath(name, format: format),
      width: width,
      height: height,
      fit: fit,
    );
  }
}
