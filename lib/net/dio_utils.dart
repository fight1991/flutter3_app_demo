import 'dart:async';

import 'package:dio/dio.dart';
import 'package:app_demo/net/response_data.dart';
import 'package:app_demo/net/status_code.dart';
import 'package:app_demo/routes/router_key.dart';
import 'package:app_demo/utils/loading_utils.dart';
import 'package:app_demo/utils/log_utils.dart';
import 'package:app_demo/utils/toast_utils.dart';
import 'package:package_info/package_info.dart';

import 'interceptor/log_interceptor.dart';
import 'interceptor/request_interceptor.dart';
export 'http_helper.dart';

///代码清单
class DioUtils {
  //节流定时器 token异常跳转到登录页,只跳转一次
  Timer? _timer;
  late Dio _dio;

  // 工厂模式
  factory DioUtils() => _getInstance();

  static DioUtils get instance => _getInstance();
  static DioUtils? _instance;

  DioUtils._internal() {
    // 基本配置参数
    BaseOptions options = BaseOptions();
    // 初始化
    _dio = Dio(options);
    // 添加请求拦截器
    _dio.interceptors.add(RequestInterceptors());
    // 添加日志拦截器；
    bool inProduction = bool.fromEnvironment("dart.vm.product");
    if (!inProduction) {
      _dio.interceptors.add(LogsInterceptors());
    }
  }

  static DioUtils _getInstance() {
    _instance ??= DioUtils._internal();
    return _instance!;
  }

  /// post 请求
  ///[url]请求链接
  ///[formDataMap]formData 请求参数
  ///[jsonMap] JSON 格式
  Future<ResponseInfo> postRequest({
    required String url,
    bool withLoading = true,
    bool showToast = true,
    dynamic data,
    FormData? formData,
    Function(int, int)? onSendProgress,
    Function(int, int)? onReceiveProgress,
    Map<String, int>? page,
    CancelToken? cancelTag,
  }) async {
    try {
      if (withLoading) LoadingUtils.show();
      _dio.options = await buildOptions(_dio.options);
      //发起post请求
      Response response = await _dio.post(url,
          data: formData ??
              {"accessType": "android-app", "data": data, "page": page},
          cancelToken: cancelTag,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      if (withLoading) LoadingUtils.dismiss();
      //响应数据
      dynamic responseData = response.data;
      //数据解析
      if (responseData is Map<String, dynamic>) {
        //转换
        Map<String, dynamic> responseMap = responseData;
        String code = responseMap["code"];
        String msg = responseMap["message"];
        Map<String, dynamic>? page = responseMap["page"];
        dynamic data = responseMap["data"];
        // 正常
        if (code == StatusCode.success) {
          return ResponseInfo.success(data: data, page: page);
        }
        // 业务报错
        if (code == StatusCode.other) {
          if (showToast) ToastUtils.showToast(msg);
          return ResponseInfo.other(data: data, message: msg);
        }
        // token失效、异常,跳转到登录页
        if (code == StatusCode.tokenInValid) {
          if (_timer?.isActive ?? false) {
            return ResponseInfo.tokenInvalid(data: data);
          }
          _timer = Timer.periodic(Duration(milliseconds: 300), (timer) {
            RouterKey.navigatorKey.currentState
                ?.pushNamedAndRemoveUntil('/login', (route) => false);
            if (showToast) ToastUtils.showToast(msg);
            timer.cancel();
          });
          return ResponseInfo.tokenInvalid(data: data);
        }
        // 系统异常 9999
        if (showToast) ToastUtils.showToast(msg);
        return ResponseInfo.error();
      }
      if (showToast) ToastUtils.showToast("回参无法识别");
      return ResponseInfo.error();
    } catch (e) {
      if (withLoading) LoadingUtils.dismiss();
      return ResponseInfo.error();
    }
  }

  Future<BaseOptions> buildOptions(BaseOptions options) async {
    //获取当前App的版本信息
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String version = packageInfo.version;
    options.headers["appVersion"] = version;
    //请求时间
    options.connectTimeout = 20000;
    options.receiveTimeout = 15 * 1000;
    options.sendTimeout = 15 * 1000;

    return Future.value(options);
  }
}
