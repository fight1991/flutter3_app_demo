import 'package:app_demo/net/status_code.dart';

class ResponseInfo {
  bool success = false;
  String code;
  String? message;
  dynamic data;
  Map<String, dynamic>? page;
  ResponseInfo.success({
    this.success = true,
    this.code = StatusCode.success,
    this.data,
    this.page,
    this.message = "请求成功",
  });
  ResponseInfo.error({
    this.data,
    this.code = StatusCode.error,
    this.message,
  });
  ResponseInfo.other({
    this.data,
    this.code = StatusCode.other,
    this.message,
  });
  ResponseInfo.tokenInvalid({
    this.data,
    this.code = StatusCode.tokenInValid,
    this.message,
  });
}
