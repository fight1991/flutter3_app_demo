import 'package:dio/dio.dart';
import 'package:app_demo/net/dio_utils.dart';
import 'package:app_demo/net/response_data.dart';
import 'package:app_demo/utils/loading_utils.dart';
import 'package:app_demo/utils/log_utils.dart';

/// 一般post请求
/// [url]请求地址
/// [data]入参
/// [widthLoading]是否添加loading
/// [showToast]非0000是否弹框
/// 文件上传
/// [uploadProgress]监听上传进度
class Fetch {
  // 一般post请求
  static Future<ResponseInfo> post(
      {required String url,
      dynamic data,
      bool? showToast,
      Map<String, int>? page,
      bool withLoading = true}) {
    return DioUtils.instance.postRequest(
      url: url,
      data: data,
      page: page,
      withLoading: withLoading,
    );
  }

  // 文件上传请求
  static Future<ResponseInfo> upload({
    required String url,
    bool withLoading = true,
    bool? showToast,
    FormData? data,
    Function(int, int)? uploadProgress,
  }) {
    return DioUtils.instance.postRequest(
      url: url,
      formData: data,
      onSendProgress: uploadProgress,
      withLoading: withLoading,
    );
  }

  // 批量请求
  static Future<bool> all<T>(
    Iterable<Future<T>> futures, {
    bool widthLoading = true,
  }) async {
    if (widthLoading) LoadingUtils.show();
    var res = await Future.wait(futures);
    if (widthLoading) LoadingUtils.dismiss();
    return !res.contains(false);
  }
}
