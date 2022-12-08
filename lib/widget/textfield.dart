import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ost_digital_application/common/color.dart';

class OSTTextField extends StatelessWidget {
  const OSTTextField({
    Key? key,
    this.controller,
    this.focusNode,
    this.text,
    this.autoFocus = false,
    this.obscureText = false,
    this.maxLines,
    this.maxLength,
    this.inputFormatters,
    this.hintText,
    this.keyboradType = TextInputType.text,
    this.prefix,
    this.suffix,
    this.enabled = true,
    this.onChanged,
    this.onEditingComplete,
    this.onSubmitted,
  }) : super(key: key);

  final TextEditingController? controller;
  final FocusNode? focusNode;
  final String? text;
  final bool autoFocus;
  final bool obscureText;

  /// maxLines 属性设置，会直接显示高度，如果设置null则会自适应高度
  final int? maxLines;
  /// maxLength 属性设置，会在右下角显示余数，如果不希望显示，可以设置inputFormatter:LengthLimitingText...
  final int? maxLength;
  final List<TextInputFormatter>? inputFormatters;

  final String? hintText;
  final TextInputType keyboradType;
  final Widget? prefix;
  final Widget? suffix;
  final bool enabled;

  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final void Function(String)? onSubmitted;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      // 填充最高 80
      constraints: BoxConstraints(maxHeight: 80.h),
      // height: 40.h,
      child: TextField(
        decoration: _inputDecoration(),
        controller: controller,
        focusNode: focusNode,
        autofocus: autoFocus,
        maxLines: maxLines ?? (obscureText ? 1 : null),
        maxLength: maxLength,
        obscureText: obscureText,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        onSubmitted: onSubmitted,
        inputFormatters: inputFormatters,
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      border: _outlineInpitBorder(),
      enabledBorder: _enabledOutlineInputBorder(),
      focusedBorder: _focusOutlineInputBorder(),
      hintText: hintText,
      hintStyle: _hintStyle(),
      prefixIcon: prefix,
      suffixIcon: suffix,
      enabled: enabled,
    );
  }

  TextStyle _hintStyle() {
    return const TextStyle(
      fontWeight: FontWeight.w400,
      color: CupertinoColors.placeholderText,
    );
  }

  OutlineInputBorder _focusOutlineInputBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: OSTColors.primary),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );
  }

  OutlineInputBorder _enabledOutlineInputBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey, width: 0.5),
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );
  }

  OutlineInputBorder _outlineInpitBorder() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    );
  }
}
