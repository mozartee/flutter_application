import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../help/index.dart';
import '../../langs/index.dart';
import '../../utils/index.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    this.showErrorImage = true,
    this.showText = true,
    this.showButton = true,
    this.errorImagePath,
    this.text,
    this.buttonText,
    this.errorImage,
    this.onPressed,
  });

  final bool? showErrorImage, showText, showButton;
  final String? errorImagePath, text, buttonText;

  final Widget? errorImage;

  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _errorImage,
            Gap.h.dp6,
            _text,
            Gap.h.dp6,
            _button,
          ],
        ),
      ),
    );
  }

  Widget get _errorImage =>
      showErrorImage == true ? errorImage ?? _loadImage : Container();

  Widget get _loadImage => Assets.loadImage(
        errorImagePath ?? 'error',
        format: ImageFormat.svg,
        width: 300,
        height: 300,
      );
  Widget get _text =>
      showText == true ? Text(text ?? Languages.loadingError.tr) : Container();

  Widget get _button => showButton == true
      ? TextButton(
          onPressed: onPressed,
          style: ButtonStyle(
            foregroundColor: MaterialStateProperty.resolveWith(
                (states) => Get.theme.colorScheme.primary),
          ),
          child: Text(buttonText ?? Languages.loadingRetry.tr),
        )
      : Container();
}
