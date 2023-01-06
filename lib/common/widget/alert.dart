import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../help/index.dart';
import '../langs/index.dart';

bool isIOS = Device.isIOS || Device.isMacOS;
BuildContext context = Get.context!;

_buildActions({
  String? cancelTitle,
  String? doneTitle,
  VoidCallback? onCancel,
  VoidCallback? onDone,
}) {
  List<Widget> actions = [];
  if (cancelTitle != null && onCancel != null) {
    actions.add(CupertinoActionSheetAction(
      onPressed: onCancel,
      child: Text(cancelTitle),
    ));
  }
  if (doneTitle != null && onDone != null) {
    actions.add(CupertinoActionSheetAction(
      onPressed: onDone,
      child: Text(doneTitle),
    ));
  }

  return actions;
}

/// 展示普通样式 ALERT，显示标题和文本，以及取消和确定按钮
Future showDefaultAlert({
  String? title,
  String? content,
  String? cancelTitle,
  String? doneTitle,
  VoidCallback? onCancel,
  VoidCallback? onDone,
}) {
  return showAlert(
    title: title,
    content: content,
    actions: _buildActions(
      cancelTitle: cancelTitle ?? Languages.cancel.tr,
      doneTitle: doneTitle ?? Languages.done.tr,
      onCancel: () {
        Get.back();
        if (onCancel != null) {
          onCancel();
        }
      },
      onDone: () {
        if (onDone == null) {
          Get.back();
        } else {
          onDone();
        }
      },
    ),
  );
}

/// 展示一个按钮样式 ALERT，点击消失
Future showSingleAlert({
  String? title,
  String? content,
  String? doneTitle,
  VoidCallback? onDone,
}) {
  return showAlert(
    title: title,
    content: content,
    actions: _buildActions(
      doneTitle: doneTitle ?? Languages.done.tr,
      onDone: () {
        Get.back();
        if (onDone == null) {
        } else {
          onDone();
        }
      },
    ),
  );
}

/// 展示纯文本样式 ALERT，点击弹窗消失
Future showTextAlert({
  String? title,
  String? content,
  VoidCallback? onDone,
}) {
  return showAlert(
    title: title,
    content: content,
    barrierDismissible: true,
  );
}

Future showAlert({
  String? title,
  String? content,
  bool barrierDismissible = false,
  List<Widget>? actions,
}) {
  if (isIOS) {
    return showCupertinoDialog(
        context: context,
        barrierDismissible: barrierDismissible,
        builder: (_) {
          return CupertinoAlertDialog(
            title: title != null ? Text(title) : null,
            content: content != null ? Text(content) : null,
            actions: actions ?? [],
          );
        });
  }
  return showDialog(
    context: context,
    builder: (ctx) {
      return AlertDialog(
        title: title != null ? Text(title) : null,
        content: content != null ? Text(content) : null,
        actions: actions ?? [],
      );
    },
  );
}
