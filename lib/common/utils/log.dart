import 'dart:developer';

import 'package:ost_digital_application/common/utils/index.dart';

debugLog(String message) {
  if (Constant.isRelease == false) {
    log(message);
  }
}
