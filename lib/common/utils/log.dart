import 'dart:developer';

import 'index.dart';

debugLog(String message) {
  if (Constant.isRelease == false) {
    log(message);
  }
}
