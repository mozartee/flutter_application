import 'package:dio/dio.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';

import '../../help/shared_preference.dart';
import '/common/extension/string_extension.dart';

/// 身份验证
class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final String accessToken = SpUtil.getString(TokenKey.accessToken).nullSafe;
    if (accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'token $accessToken';
    }
    super.onRequest(options, handler);
  }
}
