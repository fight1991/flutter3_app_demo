import 'package:dio/dio.dart';
import 'package:flutter_car_live/common/global.dart';
import 'package:flutter_car_live/utils/log_utils.dart';
import 'package:flutter_car_live/utils/toast_utils.dart';

/*
 * 页面说明：dio 拦截
 * 功能性修改记录：
 */
class RequestInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    //请求header的配置
    options.headers["token"] = Global.profile.token;
    return handler.next(options);
  }

  @override
  onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

  @override
  onError(DioError e, ErrorInterceptorHandler handler) {
    DioError dioError = e;
    String msg;
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
        msg = "连接超时";
        break;
      case DioErrorType.sendTimeout:
        msg = "请求超时";
        break;
      case DioErrorType.receiveTimeout:
        msg = "响应超时";
        break;
      case DioErrorType.response:
        // 响应错误
        msg = "响应错误";
        break;
      case DioErrorType.cancel:
        // 取消操作
        msg = "请求已取消";
        break;
      case DioErrorType.other:
        // 默认自定义其他异常
        msg = "网络异常,请查看网络";
        break;
      default:
        msg = "未知错误";
    }
    ToastUtils.showToast(msg);
    LogUtils.e('dio捕获异常如下>>>>>>>>>>>>>>>>>>>>>>>>');
    print(e);
    return handler.next(e);
  }
}
