import 'dart:convert';

import 'package:dio/dio.dart';

import '../help/index.dart';
import '../utils/index.dart';
import 'index.dart';

List<Interceptor> interceptors = [
  AuthInterceptor(),
  TokenInterceptor(),
  LogInterceptor()
];

typedef successCallback<T> = Function(T data);
typedef failureCallback = Function(Error);

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._();
  factory HttpUtil() => _instance;

  late Dio dio;

  HttpUtil._() {
    // BaseOptions、Options、RequestOptions 都可以配置参数，优先级别依次递增，且可以根据优先级别覆盖参数
    BaseOptions options = BaseOptions(
      baseUrl: Api.baseUrl,
      connectTimeout: Constant.httpConnectTime, // 单位是毫秒
      receiveTimeout: Constant.httpReceiveTime, // 响应流上前后两次接受到数据的间隔，单位为毫秒。
      headers: {},

      /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
      /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
      /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]
      /// 就会自动编码请求体.
      contentType: Headers.jsonContentType,

      /// 默认值是 `JSON`, 当响应头中content-type为"application/json"时，dio 会自动将响应内容转化为json对象。
      /// 如果想以二进制方式接受响应数据，如下载一个二进制文件，那么可以使用 `STREAM`.
      /// 如果想以文本(字符串)格式接收响应数据，请使用 `PLAIN`.
      responseType: ResponseType.json,
    );

    dio = Dio(options);

    // 拦截器
    dio.interceptors.addAll(interceptors);
  }

  // Future<BaseEntity<T>> request<T>(){}

  Future<BaseEntity<T>> _request<T>(
    String method,
    String url, {
    Object? data,
    Map<String, dynamic>? quertParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    final Response<String> response = await dio.request<String>(
      url,
      data: data,
      queryParameters: quertParameters,
      cancelToken: cancelToken,
      options: _options(method, options),
    );

    try {
      final String data = response.data.toString();
      final Map<String, dynamic> map =
          json.decode(data) as Map<String, dynamic>;
      return BaseEntity<T>.fromJson(map);
    } catch (e) {
      Log.d(e.toString());
      return BaseEntity<T>(HttpError.parseError, '数据解析错误！', null);
    }
  }

  Options _options(String method, Options? options) {
    options ??= Options();
    options.method = method;
    return options;
  }
}

enum Method { get, post, put, delete, patch, head }

extension MethodExtension on Method {
  String get value => ['GET', 'POST', 'PUT', 'DELETE', 'PATCH', 'HEAD'][index];
}
