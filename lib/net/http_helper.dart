///代码清单
class HttpHelper {
  static const String BASE_HOST = "https://test-ec-api.htjicon.com";
  static const String UPLOAD_HOST = "https://test-common-api.htjicon.com";

  //用户账号密码登录
  static const String login =
      BASE_HOST + "/user-center/manage-login/loginByDevice";

  // 加油/洗车维保业务开始>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
  // 根据电子车牌号码查询车牌号
  static const String getPlateNoByCid =
      BASE_HOST + "/vehicle-management/device-evi/getVehicleInfo";
  // 获取枪号下拉列表
  static const String gunList =
      BASE_HOST + "/energy-supply/device-oil/getOilGunList";
  // 收费信息支付-确定按钮
  static const String addTrade =
      BASE_HOST + "/user-center/device-trade/addTrade";
  // 轮询查订单状态 订单详情
  static const String getTrade =
      BASE_HOST + "/user-center/device-trade/getTrade";
  // 关闭/取消订单
  static const String closeTrade =
      BASE_HOST + "/user-center/device-trade/closeTrade";
  // 打印小票
  static const String printTicket =
      BASE_HOST + "/user-center/device-trade/print";
  // 查询订单列表
  static const String getTradeList =
      BASE_HOST + "/user-center/device-trade/getTradeList";
  // 查询商品信息列表
  static const String getPagedGoodsList =
      BASE_HOST + "/vehicle-upkeep/device-org-goods/getPagedGoodsList";

  // 加油/洗车维保业务结束<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  // 卡片核验业务开始>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  // 查询电子车牌信息
  static const String getElecInfo =
      BASE_HOST + "/vehicle-management/installer/scan";
  // 修改并提交电子车牌信息
  static const String verifyElecInfo =
      BASE_HOST + "/vehicle-management/installer/verify";
  // 卡片解绑
  // 根据电子车牌号码查询车牌号
  static const String getPlateNoByElec =
      BASE_HOST + "/vehicle-management/installer/readPlateNo";
  // 解绑
  static const String unbind =
      BASE_HOST + "/vehicle-management/installer/unbind";
  // 报废
  static const String scrap = BASE_HOST + "/vehicle-management/installer/scrap";

  // 卡片核验业务结束<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<

  // 检查更新
  static const String checkApp =
      BASE_HOST + "/user-center/device-user-setting/getLastVersion";
  // 用户信息
  static const String getUserInfo =
      BASE_HOST + "/user-center/manage-user/getUserInfo";
  // 获取用户视图菜单
  static const String getUserViews =
      BASE_HOST + "/user-center/manage-user/getUserViews";
  // 修改密码
  static const String changePassword =
      BASE_HOST + "/user-center/manage-user/changePassword";
  // 退出登录
  static const String logout = BASE_HOST + "/user-center/manage-login/logout";

  // 获取上传令牌
  static const String getUploadToken =
      BASE_HOST + "/user-center/token/getUploadToken";
  // 上传文件
  static const String uploadFile =
      UPLOAD_HOST + "/bmp-oss/upload/uploadPrivate";
}
