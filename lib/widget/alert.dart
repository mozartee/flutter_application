import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:ost_digital_application/common/device.dart';

Future showAlert(BuildContext context,
    {String? title, String? content, List<Widget>? actions}) async {
  await showDialog(
    context: context,
    builder: (ctx) {
      if (Device.isIOS || Device.isMacOS) {
        return CupertinoAlertDialog(
          title: title == null ? null : Text(title),
          content: content == null ? null : Text(content),
          actions: actions ??
              [
                CupertinoActionSheetAction(
                  onPressed: () {},
                  child: Text('Done'),
                ),
                CupertinoActionSheetAction(
                  onPressed: () {},
                  child: Text('Cancel'),
                )
              ],
        );
      } else {
        return AlertDialog(
          title: title == null ? null : Text(title),
          content: content == null ? null : Text(content),
          actions: actions ?? [],
        );
      }
    },
  );
}
