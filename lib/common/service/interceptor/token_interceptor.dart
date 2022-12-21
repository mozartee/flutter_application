import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flustars_flutter3/flustars_flutter3.dart';

import '../../../common/extension/index.dart';
import '../../help/index.dart';
import '../index.dart';

/// refresh token
class TokenInterceptor extends Interceptor {
  Dio? _tokenDio;

  Future<String?> getToken() async {
    final Map<String, String> params = <String, String>{};
    params['refresh_token'] = SpUtil.getString(TokenKey.refreshToken).nullSafe;
    try {
      _tokenDio ??= Dio();
      _tokenDio!.options = HttpUtil.dio.options;
      final Response<dynamic> response =
          await _tokenDio!.post<dynamic>('login/refresh', data: params);
      if (response.statusCode == HttpError.success) {
        return (json.decode(response.data.toString())
            as Map<String, dynamic>)['access_token'] as String;
      }
    } catch (error) {
      Log.e('刷新token失败');
    }
    return null;
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    //401代表token过期
    if (response.statusCode == HttpError.unauthorized) {
      Log.d('-----------自动刷新Token------------');
      final String? accessToken = await getToken();
      Log.e('-----------NewToken: $accessToken ------------');
      SpUtil.putString(TokenKey.accessToken, accessToken.nullSafe);

      if (accessToken != null) {
        // 重新请求失败接口
        final RequestOptions requestOptions = response.requestOptions;
        requestOptions.headers['Authorization'] = 'Bearer $accessToken';

        final Options options = Options(
          headers: requestOptions.headers,
          method: requestOptions.method,
        );

        try {
          Log.e('----------- 重新请求接口 ------------');

          /// 避免重复执行拦截器，使用tokenDio
          final Response<dynamic> response = await _tokenDio!.request<dynamic>(
            requestOptions.path,
            data: requestOptions.data,
            queryParameters: requestOptions.queryParameters,
            cancelToken: requestOptions.cancelToken,
            options: options,
            onReceiveProgress: requestOptions.onReceiveProgress,
          );
          return handler.next(response);
        } on DioError catch (error) {
          return handler.reject(error);
        }
      }
    }

    super.onResponse(response, handler);
  }
}
