import 'dart:async';

import 'package:flutter/material.dart';

import '../common/constant.dart';

/// 捕获全局异常，统一处理
void handleError(void Function() body) {
// 重写Flutter 异常回调
  FlutterError.onError = (FlutterErrorDetails details) {
    if (!Constant.isRelease) {
      // debug 直接打印信息
      FlutterError.dumpErrorToConsole(details);
    } else {
      // release ，由zone统一管理
      Zone.current.handleUncaughtError(details.exception, details.stack!);
    }
  };

// 使用runZonedGuarded捕获Flutter未捕获的异常
  runZonedGuarded(body, (Object error, StackTrace stackTrace) async {
    await _reportError(error, stackTrace);
  });
}

Future<void> _reportError(Object error, StackTrace stackTrace) async {
  if (!Constant.isRelease) {
    debugPrintStack(
      stackTrace: stackTrace,
      label: error.toString(),
      maxFrames: 100,
    );
  } else {
    // 将异常信息收集并上传到服务器。可以直接使用类似`flutter_bugly`插件处理异常上报。

  }
}
