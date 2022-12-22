import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:ost_digital_application/common/utils/log.dart';

import '../utils/index.dart';
import 'index.dart';

List<Interceptor> interceptors = [
  AuthInterceptor(),
  TokenInterceptor(),
  LoggingInterceptor(requestBody: true, responseBody: true)
];

class HttpUtil {
  static final HttpUtil _instance = HttpUtil._();
  factory HttpUtil() => _instance;

  static late Dio _dio;
  Dio get dio => _dio;

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

    _dio = Dio(options);

    _dio.interceptors.addAll(interceptors);
  }

  /// 任意请求
  /// 请求成功之后手动匹配 modal
  Future fetch(
    String url, {
    Method method = Method.get,
    Object? data,
    Map<String, dynamic>? quertParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    final Response response = await _dio.request(url,
        data: data,
        queryParameters: quertParameters,
        cancelToken: cancelToken,
        options: _options(
          method.value,
          options,
        ));

    try {
      return response.data;
    } catch (e) {
      return e;
    }
  }

  /// get请求，封装response
  Future<BaseResponseEntity<T>> get<T>(
    String url, {
    Map<String, dynamic>? quertParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    BaseResponseEntity<T> response = await _request(
      url,
      method: Method.get.value,
      quertParameters: quertParameters,
      cancelToken: cancelToken,
      options: options,
    );
    return response;
  }

  /// post请求，封装response
  Future<BaseResponseEntity<T>> post<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? quertParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    BaseResponseEntity<T> response = await _request(
      url,
      method: Method.post.value,
      data: data,
      quertParameters: quertParameters,
      cancelToken: cancelToken,
      options: options,
    );
    return response;
  }

  /// put请求，封装response
  Future<BaseResponseEntity<T>> put<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? quertParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    BaseResponseEntity<T> response = await _request(
      method: Method.put.value,
      url,
      quertParameters: quertParameters,
      cancelToken: cancelToken,
      options: options,
    );
    return response;
  }

  /// delete请求，封装response
  Future<BaseResponseEntity<T>> delete<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? quertParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    BaseResponseEntity<T> response = await _request(
      url,
      method: Method.delete.value,
      quertParameters: quertParameters,
      cancelToken: cancelToken,
      options: options,
    );
    return response;
  }

  /// patch请求，封装response
  Future<BaseResponseEntity<T>> patch<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? quertParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    BaseResponseEntity<T> response = await _request(
      url,
      method: Method.patch.value,
      quertParameters: quertParameters,
      cancelToken: cancelToken,
      options: options,
    );
    return response;
  }

  /// post Formdata 表单请求，封装response
  /// 上传多个文件：
  /// var formData = FormData.fromMap({
  ///   'name': '',
  ///   'file': await MultipartFile.fromFile('./text.txt', filename: 'upload.txt'),
  ///   'files': [
  ///     await MultipartFile.fromFile('./text1.txt', filename: 'text1.txt'),
  ///     await MultipartFile.fromFile('./text2.txt', filename: 'text2.txt'),
  ///   ]
  /// });
  Future<BaseResponseEntity<T>> postForm<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? quertParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    BaseResponseEntity<T> response = await _postRequest(
      url,
      data: FormData.fromMap(data),
      quertParameters: quertParameters,
      cancelToken: cancelToken,
    );
    return response;
  }

  /// 二进制流数据上传
  Future<BaseResponseEntity<T>> postStream<T>(
    String url, {
    dynamic data,
    Map<String, dynamic>? quertParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    List streams = [];
    if (data is List) {
      streams = data;
    } else {
      streams = [data];
    }
    BaseResponseEntity<T> response = await _postRequest(
      url,
      data: Stream.fromIterable(streams.map((e) => [e])),
      quertParameters: quertParameters,
      cancelToken: cancelToken,
      options: options ??
          Options(headers: {Headers.contentLengthHeader: streams.length}),
    );
    return response;
  }

  Future<BaseResponseEntity<T>> _postRequest<T>(
    String url, {
    Object? data,
    Map<String, dynamic>? quertParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    final Response<String> response = await _dio.post<String>(
      url,
      data: data,
      queryParameters: quertParameters,
      cancelToken: cancelToken,
      options: options ?? Options(),
    );

    try {
      final String data = response.data.toString();
      final Map<String, dynamic> map =
          json.decode(data) as Map<String, dynamic>;
      return BaseResponseEntity<T>.fromJson(map);
    } catch (e) {
      debugLog(e.toString());
      return BaseResponseEntity<T>(HttpError.parseError, '数据解析错误！', null);
    }
  }

  Future<BaseResponseEntity<T>> _request<T>(
    String url, {
    required String method,
    Object? data,
    Map<String, dynamic>? quertParameters,
    CancelToken? cancelToken,
    Options? options,
  }) async {
    final Response<String> response = await _dio.request<String>(
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
      return BaseResponseEntity<T>.fromJson(map);
    } catch (e) {
      debugLog(e.toString());
      return BaseResponseEntity<T>(HttpError.parseError, '数据解析错误！', null);
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
