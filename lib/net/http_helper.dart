///代码清单
class HttpHelper {
  // ignore: constant_identifier_names
  static const String BASE_HOST = "http://localhost:3000";

  //用户账号密码登录
  static const String login = "$BASE_HOST/login";
  // 用户详情
  static const String getUserDetail = "$BASE_HOST/staff/detail";
  // 员工列表
  static const String getStaffList = "$BASE_HOST/staff/list";
}
