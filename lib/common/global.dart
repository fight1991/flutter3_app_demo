import 'dart:convert';

import 'package:app_demo/models/profile.dart';
import 'package:app_demo/utils/sp_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Global {
  static SharedPreferences? _prefs;
  static Profile profile = Profile();
  // 网络缓存对象
  // static NetCache netCache = NetCache();
  // 是否为release版
  // static bool get isRelease => bool.fromEnvironment("dart.vm.product");
  // 兼容chrome
  static bool get isRelease => kReleaseMode;
  // 是否登录
  static bool get isLogin => profile.token != null;
  //初始化全局信息，会在APP启动时执行
  static Future init() async {
    // 初始化本地存储
    _prefs = await SPUtil.init();
    // 读取本地数据
    var localProfile = _prefs?.getString("profile");
    if (localProfile != null) {
      profile = Profile.fromJson(jsonDecode(localProfile));
    }
  }

  // 如果没有缓存策略，设置默认缓存策略
  // profile.cache = profile.cache ?? CacheConfig()
  //   ..enable = true
  //   ..maxAge = 3600
  //   ..maxCount = 100;

  // 持久化Profile信息
  static saveProfile() =>
      _prefs?.setString("profile", jsonEncode(profile.toJson()));
}
