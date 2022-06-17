import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class LoadingUtils {
  static void config() {
    EasyLoading.instance
      ..indicatorType = EasyLoadingIndicatorType.ring
      ..indicatorColor = Color(0xff447fff)
      ..textColor = Color(0xff447fff)
      ..backgroundColor = Colors.white
      ..maskType = EasyLoadingMaskType.custom
      ..maskColor = Colors.white.withOpacity(.2) // 遮罩背景色
      ..userInteractions = false; //不允许用户操作
  }

  static show({String? msg = '正在加载...'}) {
    EasyLoading.show(status: msg);
  }

  static dismiss() {
    EasyLoading.dismiss();
  }
}
